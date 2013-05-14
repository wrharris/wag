(* cg_slicer.ml: a module for slicing a call-graph based on input
 * caller-callee ranges. *)
open Llvm
open Llvm_bitreader

open Libext

type cg_node = Llvm.llvalue

module Cg_node =
  struct
    type t = cg_node
    let compare = compare
  end

module Cg_nodes = Set.Make(Cg_node)

module Cg_map = Map.Make(Cg_node)

type call_graph =
  { nodes: Cg_nodes.t;
    callees: cg_node -> Cg_nodes.t;
    callers: cg_node -> Cg_nodes.t;
  }

(* trans_closure: construct transitive closure of a call-graph, but
 * don't propagate past cutpoints. *)
let trans_closure call_graph cutpoints =
  let rec call_graph_step call_graph frontier =
    if Cg_nodes.is_empty frontier then call_graph
    else
      (* chosen: a call in the frontier. *)
      let chosen = Cg_nodes.choose frontier in
      let cur_callees = Cg_map.find chosen call_graph in
      let tc_callees =
        Cg_nodes.fold
          (fun call trans_callees ->
             Cg_nodes.union trans_callees (Cg_map.find call call_graph)
          )
          (Cg_nodes.diff cur_callees cutpoints)
          cur_callees in
        
        (* If no new transitive callees were added: *)
        if Cg_nodes.subset tc_callees cur_callees then
          (* Then don't extend the frontier, and recurse: *)
          call_graph_step call_graph (Cg_nodes.remove chosen frontier)
        else 
          (* Otherwise, extend the call graph, and don't remove the
           * call from the frontier. *)
          let call_graph' =
            Cg_map.add chosen tc_callees call_graph in
            call_graph_step call_graph' frontier in

  (* all_calls: initial set of functions to propagate from. *)
  let all_calls =
    Cg_map.fold
      (fun call _ all_calls -> Cg_nodes.add call all_calls)
      call_graph
      Cg_nodes.empty in
    call_graph_step call_graph all_calls

(* cons_cg: takes an LLVM program, constructs a call-graph. *)
let cons_cg llvm_prog =
  (* nodes: the nodes of the callgraph. *)
  let nodes =
    Llvm.fold_left_functions
      (fun nodes func -> Cg_nodes.add func nodes) Cg_nodes.empty llvm_prog in

  (* empty_caller_map: an empty initial map of each node to its
   * callers. *)
  let empty_caller_map =
    Cg_nodes.fold
      (fun node empty_caller_map ->
         Cg_map.add node Cg_nodes.empty empty_caller_map
      )
      nodes
      Cg_map.empty in

  (* Build the set of nodes, map from each node to its callees,
   * and map from each node to its callers. *)
  let (callee_map, caller_map) =
    Cg_nodes.fold
      (fun node (callee_map, caller_map) ->
         let (callees, caller_map) =
           Llvm.fold_left_blocks
             (fun (callees, caller_map) blk ->
                Llvm.fold_left_instrs
                  (fun (callees, caller_map) instr ->
                     if Llvm.instr_opcode instr = Opcode.Call then
                       (match Llvm.call_get_called_function instr with
                            Some(callee) ->
                              let callees' = Cg_nodes.add callee callees in
                              let caller_map =
                                Cg_map.add
                                  callee
                                  (Cg_nodes.add
                                     node (Cg_map.find callee caller_map))
                                  caller_map in
                                (callees', caller_map)
                          | None -> (callees, caller_map)
                       )
                     else (callees, caller_map)
                  )
                  (callees, caller_map)
                  blk
             )
             (Cg_nodes.empty, caller_map)
             node in
           (Cg_map.add node callees callee_map, caller_map)
      )
      nodes
      (Cg_map.empty, empty_caller_map) in
    { nodes = nodes;
      callees = (fun node -> Cg_map.find node callee_map);
      callers = (fun node -> Cg_map.find node caller_map);
    } 

let node_to_str = Llvm.value_name

(* cg_dot: print a dot representation of the callgraph. *)
let cg_dot cg =
  (* Construct the dot representation of the call-graph. *)
  let header = "digraph NWA {\n" in
  let body =
    Cg_nodes.fold
      (fun node body ->
         let caller_str = node_to_str node in

         (* calls_str: accumulation of all call transitions. *)
         let calls_str =
           Cg_nodes.fold
             (fun callee calls_str ->
                calls_str ^ "\"" ^ caller_str ^ "\"" ^ " -> " 
                ^ "\"" ^ (node_to_str callee) ^ "\"" ^ ";\n"
             )
             (cg.callees node)
             "" in
           body ^ calls_str
      )
      cg.nodes
      "" in
  let footer = "}\n" in
    header ^ body ^ footer


(* slice_cg: takes a call-graph and a caller and callee. Constructs a
 * call-graph in which the only functions are transitively called by the
 * caller and transitively called by the callee. *)
let slice_cg cg caller_nms callee_nms cutpoint_strs =
  let find_node nm =
    let node_opt =
      Cg_nodes.fold
        (fun node node_opt ->
           (match node, node_opt with
                _, Some(_) -> node_opt
              | _ ->
                  if Libext.substr nm (Llvm.value_name node) then Some(node)
                  else None
           )
        )
        cg.nodes
        None in
      (match node_opt with
           Some(caller_node) -> caller_node
         | None -> failwith ("CG node for " ^ nm ^ " not found")
      ) in

  let cutpoints =
    Strings.fold
      (fun cutpoint_str cutpoints ->
         Cg_nodes.add (find_node cutpoint_str) cutpoints
      )
      cutpoint_strs
      Cg_nodes.empty in
  let no_cuts = Cg_nodes.diff cg.nodes cutpoints in

  let node_func_to_map func =
    Cg_nodes.fold
      (fun node func_map -> 
         Cg_map.add node (Cg_nodes.inter (func node) no_cuts) func_map
      )
      no_cuts
      Cg_map.empty in

  let tc_callees = trans_closure (node_func_to_map cg.callees) cutpoints in
  let tc_callers = trans_closure (node_func_to_map cg.callers) cutpoints in

  (* sliced_callees: nodes reflexively-transitively called by the caller. *)
  let sliced_callees =
    let root_callers =
      if Strings.is_empty caller_nms then no_cuts
      else
        Strings.fold
          (fun caller_nm end_callers ->
             Cg_nodes.add (find_node caller_nm) end_callers
          )
          caller_nms
          Cg_nodes.empty in
      Cg_nodes.fold
        (fun root_caller sliced_callees ->
           Cg_nodes.union sliced_callees (Cg_map.find root_caller tc_callees)
        )
        root_callers
        root_callers in

  (* sliced_callers: nodes that transitively call the callee. *)
  let sliced_callers =
    let end_callees =
      if Strings.is_empty callee_nms then no_cuts
      else 
        Strings.fold
          (fun callee_nm end_callees ->
             Cg_nodes.add (find_node callee_nm) end_callees
          )
          callee_nms
          Cg_nodes.empty in
      Cg_nodes.fold
        (fun end_callee sliced_callers ->
           Cg_nodes.union sliced_callers (Cg_map.find end_callee tc_callers)
        )
        end_callees
        end_callees in

  (* sliced_nodes: the nodes of the sliced graph. *)
  let sliced_nodes = 
    Cg_nodes.inter cg.nodes (Cg_nodes.inter sliced_callees sliced_callers) in
  let sliced_callers node = Cg_nodes.inter (cg.callers node) sliced_nodes in
  let sliced_callees node = Cg_nodes.inter (cg.callees node) sliced_nodes in
    { nodes = sliced_nodes;
      callers = sliced_callers;
      callees = sliced_callees;
    }


let driver () =
  let llvm_file_nm_cell = ref None in
  let caller_nm_cell = ref None in
  let callee_nm_cell = ref None in
  let cutpoints_cell = ref None in
  let set_opt store value = store := Some(value) in
  let _ = 
    Arg.parse
      [("-prog_name",
        Arg.String(set_opt llvm_file_nm_cell),
        "name of bitcode file containing the program");
       ("-caller",
        Arg.String(set_opt caller_nm_cell),
        "name of a lower-bound caller");
       ("-callee",
        Arg.String(set_opt callee_nm_cell),
        "name of an upper-bound callee");
       ("-cutpoints",
        Arg.String(set_opt cutpoints_cell),
        "name of callgraph cutpoints");
      ]
      (fun arg -> ())
      "bad argument" in
    
  (* llvm_file_nm: the name of the bitcode file of the program. *)
  let llvm_file_nm =
    (match !llvm_file_nm_cell with
         Some(llvm_file_nm) -> llvm_file_nm
       | None -> failwith "expected LLVM file name."
    ) in
    
  (* tok_funcs: tokenze a CSV of function names into a set. *)
  let rec tok_funcs funcs_str =
    try
      let comma_pos = String.index funcs_str ',' in
      let pre_comma = String.sub funcs_str 0 comma_pos in
      let post_comma = 
        String.sub
          funcs_str
          (comma_pos + 1)
          ((String.length funcs_str) - comma_pos - 1) in
        Strings.add pre_comma (tok_funcs post_comma)
    with Not_found ->
      if funcs_str = "" then Strings.empty
      else Strings.singleton funcs_str in

  let caller_nms =
    (match !caller_nm_cell with
         Some(caller_str) -> tok_funcs caller_str
       | None -> Strings.empty
    ) in

  let callee_nms =
    (match !callee_nm_cell with
         Some(callee_str) -> tok_funcs callee_str
       | None -> Strings.empty
    ) in

  let cutpoints_set =
    (match !cutpoints_cell with
         Some(cutpoints_str) -> tok_funcs cutpoints_str
       | None -> Strings.empty
    ) in

  (* llvm_prog: the LLVM program module. *)
  let llvm_prog =
    Llvm_bitreader.parse_bitcode
      (Llvm.global_context ()) (MemoryBuffer.of_file llvm_file_nm) in

  (* cg: the callgraph. *)
  let cg = cons_cg llvm_prog in

  (* sliced_cg: the callgraph, sliced for a given caller and callee. *)
  let sliced_cg = slice_cg cg caller_nms callee_nms cutpoints_set in
  let sliced_dot = cg_dot sliced_cg in

  (* Print the dot representation. *)
  let sliced_dot_file = open_out (llvm_file_nm ^ ".dot") in
  let _ = output_string sliced_dot_file sliced_dot in
    flush sliced_dot_file

;;

driver ()
