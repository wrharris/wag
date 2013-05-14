(* Program.ml: representation of programs. *)
open Llvm_prog
open Bin_prog

open Libext
open Vpa

type lib =
    Llvm_lib of Llvm_prog.lib
  | Bin_lib of Bin_prog.lib

module Libs =
  Set.Make(
    struct
      type t = lib
      let compare = compare
    end
  )

type prog_act =
    Llvm_act of Llvm.llvalue
  | Bin_act of Bin_sevpa.Internal.t

module Prog_acts =
  Set.Make(
    struct
      type t = prog_act
      let compare = compare
    end
  )

type prog_acts = Prog_acts.t

(* prog: a program. *)
type prog =
    { entry: lib;
      libs: Libs.t;
    }

let prog_name p =
  (match p.entry with
      Llvm_lib(ll_lib) -> Llvm_prog.lib_name ll_lib
    | Bin_lib(_) -> failwith "Binary libraries are not suppoted"
  )

(* prog_state: a program state is either an LLVM instruction or a
 * Binary instruction that is about to execute. *)
type prog_state =
    Llvm_state of Llvm_prog.Llvm_sevpa.state
  | Bin_state of Bin_prog.Bin_sevpa.state

module Prog_state =
struct
  type t = prog_state
  let compare q_0 q_1 =
    (match q_0, q_1 with
         Llvm_state(llvm_state_0), Llvm_state(llvm_state_1) ->
           Llvm_sevpa.State.compare llvm_state_0 llvm_state_1
       | Bin_state(bin_state_0), Bin_state(bin_state_1) ->
           Bin_sevpa.State.compare bin_state_0 bin_state_1
       | Llvm_state(_), _ -> -1
       | Bin_state(_), _ -> 1
    )
end

module Prog_states = Set.Make(Prog_state)

let prog_state_to_string q =
  (match q with
       Llvm_state(llvm_q) -> Llvm_prog.Llvm_sevpa.state_to_string llvm_q
     | Bin_state(bin_q) -> Bin_prog.Bin_sevpa.state_to_string bin_q
  )

(* call: call actions. *)
type call =
    Llvm_call of Llvm_prog.lib * Llvm_prog.Llvm_sevpa.call
  | Bin_call of Bin_prog.lib * Bin_prog.Bin_sevpa.call

module Prog_call =
  struct
    type t = call
    let compare call_0 call_1 = 
      (match call_0, call_1 with
           Llvm_call(_, llvm_call_0), Llvm_call(_, llvm_call_1) ->
             Llvm_sevpa.Call.compare llvm_call_0 llvm_call_1
         | Bin_call(_, bin_call_0), Bin_call(_, bin_call_1) ->
             Bin_sevpa.Call.compare bin_call_0 bin_call_1
         | Llvm_call(_), _ -> -1
         | Bin_call(_), _ -> 0
      )
  end

module Prog_calls = Set.Make(Prog_call)

let call_to_string call =
  (match call with
       Llvm_call(_, llvm_call) -> Llvm_prog.Llvm_sevpa.call_to_string llvm_call
     | Bin_call(_, bin_call) -> Bin_prog.Bin_sevpa.call_to_string bin_call
  )

let call_to_llvm_func call =
  (match call with
       Llvm_call(_, llvm_call) -> Llvm_prog.call_to_llvm_func llvm_call
     | Bin_call(_) -> failwith "call_to_llvm_func: case Bin_call"
  )

(* Program internals. *)
type internal =
    Llvm_internal of Llvm_prog.lib * Llvm_prog.Llvm_sevpa.internal
  | Bin_internal of Bin_prog.lib * Bin_prog.Bin_sevpa.internal

module Prog_int =
  struct
    type t = internal
    let compare int_0 int_1 =
      (match int_0, int_1 with
           Llvm_internal(_, llvm_int_0), Llvm_internal(_, llvm_int_1) ->
             Llvm_sevpa.Internal.compare llvm_int_0 llvm_int_1
         | Llvm_internal(_), _ -> -1
         | Bin_internal(_), Llvm_internal(_) -> 1
         | Bin_internal(_, bin_int_0), Bin_internal(_, bin_int_1) ->
             Bin_sevpa.Internal.compare bin_int_0 bin_int_1
      )
  end

module Prog_ints = Set.Make(Prog_int)

let internal_to_string prog_int =
  (match prog_int with
       Llvm_internal(_, llvm_int) ->
         Llvm_prog.Llvm_sevpa.internal_to_string llvm_int
     | Bin_internal(_, bin_int) ->
       Bin_prog.Bin_sevpa.internal_to_string bin_int
  )

module Prog_mod_id =
  struct
    type t = Prog_call.t mod_id
    let compare = compare
  end

module Prog_mod_ids = Set.Make(Prog_mod_id)

module Prog_id_map = Map.Make(Prog_mod_id)

(* Module of program SEVPA's. *)
module Prog_sevpa =
  Sevpa_abs(
    struct
      module Comp_state = Prog_state
      module Comp_states = Prog_states

      module Comp_int = Prog_int
      module Comp_ints = Prog_ints

      module Comp_call = Prog_call
      module Comp_calls = Prog_calls

      module Comp_mod_ids = Prog_mod_ids
      module Comp_id_map = Prog_id_map

      let comp_state_to_string = prog_state_to_string
      let comp_internal_to_string = internal_to_string
      let comp_call_to_string = call_to_string
    end)

let cmp_prog_call (prog_0, call_0) (prog_1, call_1) =
  let prog_cmp = Prog_state.compare prog_0 prog_1 in
    if prog_cmp != 0 then prog_cmp else Prog_call.compare call_0 call_1

let internal_stub_callee internal =
  (match internal with
      Llvm_internal(_, llvm_int) -> Llvm_prog.internal_stub_callee llvm_int
    | Bin_internal(_, bin_int) ->
      failwith "internal_stub_callee: case Bin_internal"
  )

let dot_dump vpa_to_dot out_file_nm vpa =
  let vpa_file = open_out out_file_nm in
  let vpa_dot = vpa_to_dot vpa in
  output_string vpa_file vpa_dot;
  flush vpa_file

(* compose_vpa_lib: takes a SEVPA and a library SEVPA and constructs
 * their composition. *)
let compose_vpa_lib vpa lib_vpa =
  let calls_nms calls =
    Prog_sevpa.Calls.fold
      (fun call calls_nms -> 
        Strings.add (Prog_sevpa.call_to_string call) calls_nms
      )
      calls
      Strings.empty in
  let func_nms =
    Strings.union
      (calls_nms vpa.Prog_sevpa.sevpa_calls)
      (calls_nms lib_vpa.Prog_sevpa.lib_calls) in

  (* comp_ints: the internals of the composition. *)
  let comp_ints =
    Prog_sevpa.Internals.filter
      (fun internal ->
        (match internal_stub_callee internal with
            Some(func_nm) -> not (Strings.mem func_nm func_nms)
          | None -> true
        )
      )
      (Prog_sevpa.Internals.union 
         vpa.Prog_sevpa.sevpa_ints lib_vpa.Prog_sevpa.lib_ints) in

  (* comp_calls: the call alphabet of the composition. *)
  let comp_calls = 
    Prog_sevpa.Calls.union
      vpa.Prog_sevpa.sevpa_calls lib_vpa.Prog_sevpa.lib_calls in

  (* comp_states: the state space of the composition. *)
  let comp_states =
    Prog_sevpa.States.union
      vpa.Prog_sevpa.sevpa_states lib_vpa.Prog_sevpa.lib_states in

  (* comp_acc: the accepting states of the composition. *)
  let comp_acc =
    Prog_sevpa.States.union
      vpa.Prog_sevpa.sevpa_acc lib_vpa.Prog_sevpa.lib_acc in

  let comp_call_mod call =
    let mod_table = 
      if Prog_sevpa.Calls.mem call vpa.Prog_sevpa.sevpa_calls then
        vpa.Prog_sevpa.sevpa_call_mod
      else lib_vpa.Prog_sevpa.lib_call_mod in
    mod_table call in

  let state_is_vpa state = 
    Prog_sevpa.States.mem state vpa.Prog_sevpa.sevpa_states in

  (* comp_int_enabled: internals enabled in the composition. *)
  let comp_int_enabled state =
    let int_en =
      if state_is_vpa state then vpa.Prog_sevpa.sevpa_int_enabled
      else lib_vpa.Prog_sevpa.lib_int_enabled in
    Prog_sevpa.Internals.inter (int_en state) comp_ints in

  (* lookup_stub_func: takes the name of a function, finds the call
   * action with the name. *)
  let lookup_stub_func =
    let call_index =
      Prog_sevpa.Calls.fold
        (fun call call_index ->
          String_map.add (Prog_sevpa.call_to_string call) call call_index
        )
        comp_calls
        String_map.empty in
    (fun func_nm -> String_map.find func_nm call_index) in

  (* comp_call_enabled: calls enabled in the composition. *)
  let comp_call_enabled state =
    (* org_calls: original calls. *)
    let org_calls =
      let call_en =
        if state_is_vpa state then vpa.Prog_sevpa.sevpa_call_enabled
        else lib_vpa.Prog_sevpa.lib_call_enabled in
      call_en state in

    (* stubbed_calls: stubbed calls. *)
    let stubbed_calls =
      Prog_sevpa.Internals.fold
        (fun internal stubbed_calls ->
          (match internal_stub_callee internal with
              Some(callee_nm) ->
                Prog_sevpa.Calls.add (lookup_stub_func callee_nm) stubbed_calls
            | None -> stubbed_calls
          )
        )
        (comp_int_enabled state)
        Prog_sevpa.Calls.empty in
    Prog_sevpa.Calls.union org_calls stubbed_calls in

  (* comp_int_trans: the internal transition function of the
   * composition. *)
  let comp_int_trans state internal =
    let int_trans =
      if state_is_vpa state then vpa.Prog_sevpa.sevpa_int_trans
      else lib_vpa.Prog_sevpa.lib_int_trans in
    int_trans state internal in
  
  (* state_func: takes a state and returns the call of the module
   * containing the state. *)
  let exit_call =
    (* exit_call_map: a map from each exit state to its call. *)
    let exit_call_map =
      Prog_sevpa.Calls.fold
        (fun call exit_call_map ->
          Prog_sevpa.States.fold
            (fun exit_state exit_call_map ->
              Prog_sevpa.State_map.add exit_state call exit_call_map
            )
            (let (_, _, exits) = comp_call_mod call in exits)
            exit_call_map
        )
        comp_calls
        Prog_sevpa.State_map.empty in
    (fun state -> Prog_sevpa.State_map.find state exit_call_map) in

  (* comp_ret_trans: the return transition function. *)
  let comp_ret_trans pre stack =
    let call = exit_call pre in
    let (int_en, call_en, int_trans, return_trans) =
      if state_is_vpa stack then
        (vpa.Prog_sevpa.sevpa_int_enabled,
         vpa.Prog_sevpa.sevpa_call_enabled,
         vpa.Prog_sevpa.sevpa_int_trans,
         vpa.Prog_sevpa.sevpa_return_trans)
      else 
        (lib_vpa.Prog_sevpa.lib_int_enabled,
         lib_vpa.Prog_sevpa.lib_call_enabled,
         lib_vpa.Prog_sevpa.lib_int_trans,
         lib_vpa.Prog_sevpa.lib_return_trans) in

    (* If the call was originally a call, then apply the VPA
     * transition function. *)
    if Prog_sevpa.Calls.mem call (call_en stack) then return_trans pre stack
    else
      (* Otherwise, find the internal that stubbed the function and
       * transition to that state. *)
      let post_opt =
        Prog_sevpa.Internals.fold
          (fun internal post_opt ->
            (match post_opt, internal_stub_callee internal with
                Some(_), _ -> post_opt
              | None, Some(stub_callee) ->
                if lookup_stub_func stub_callee = call then
                  Some(int_trans stack internal)
                else None
              | _ -> None
            )
          )
          (int_en stack)
          None in
      (match post_opt with
          Some(post) -> post
        | None -> failwith "comp_ret_trans: stub internal not found"
      ) in
  
  let composed_sevpa =
    { Prog_sevpa.sevpa_nm = "composed_program";
      sevpa_ints = comp_ints;
      sevpa_calls = comp_calls;
      sevpa_states = comp_states;
      sevpa_acc = comp_acc;
      sevpa_entry_mod = vpa.Prog_sevpa.sevpa_entry_mod;
      sevpa_call_mod = comp_call_mod;
      sevpa_int_enabled = comp_int_enabled;
      sevpa_call_enabled = comp_call_enabled;
      sevpa_int_trans = comp_int_trans;
      sevpa_return_trans = comp_ret_trans;
    } in
  dbg "composed sevpa: pre chk";
  assert (Prog_sevpa.is_well_formed composed_sevpa);
  dbg "composed program is well-formed";
  composed_sevpa

let inv_call_graph cg =
  let empty_map =
    String_map.fold
      (fun caller _ rev_cg -> String_map.add caller Strings.empty rev_cg)
      cg
      String_map.empty in
  String_map.fold
    (fun mod_id callees rev_cg ->
      Strings.fold
        (fun callee rev_cg ->
          String_map.add
            callee
            (Strings.add mod_id (String_map.find callee rev_cg))
            rev_cg
        )
        callees
        rev_cg
    )
    cg
    empty_map

let tc_call_graph cg targets = 
  let reverse_rev_cg rev_cg =
    let empty_map =
      String_map.fold
        (fun callee _ cg -> String_map.add callee Strings.empty cg)
        rev_cg
        String_map.empty in
    String_map.fold
      (fun call callers cg ->
        Strings.fold
          (fun caller cg ->
            String_map.add
              caller (Strings.add call (String_map.find caller cg)) cg
          )
          callers
          cg
      )
      rev_cg
      empty_map in

  let rec rev_tc_rec rev_tc worklist =
    if Strings.is_empty worklist then rev_tc
    else
      (* chosen: a call in the frontier. *)
      let chosen = Strings.choose worklist in

        (* cur_tc_callees: the current callers of the chosen function. *)
      let cur_tc_callers = String_map.find chosen rev_tc in

        (* tc_callers: under-approximation of TC-callers constructed
         * from applying the concatenation rule. *)
      let tc_callers =
        Strings.fold
          (fun tc_caller tc_callers ->
            Strings.union tc_callers (String_map.find tc_caller rev_tc)
          )
          cur_tc_callers
          cur_tc_callers in
      
      (* If no new transitive callees were added: *)
      if Strings.subset tc_callers cur_tc_callers then
        (* Then remove the chosen function from the worklist, and
         * recurse: *)
        rev_tc_rec rev_tc (Strings.remove chosen worklist)
      else 
        (* Otherwise, extend the call graph, and don't remove the
         * chosen call from the worklist. *)
        let rev_tc' = String_map.add chosen tc_callers rev_tc in
        rev_tc_rec rev_tc' worklist in
  reverse_rev_cg (rev_tc_rec (inv_call_graph cg) targets)

(* lift_lib_sevpa: takes an LLVM SEVPA library and lifts it to a
 * Program SEVPA. *)
let lift_llvm_lib_sevpa lib lib_llvm_sevpa = 
  let lift_llvm_internals llvm_ints =
    Llvm_sevpa.Internals.fold
      (fun llvm_int llvm_comps ->
         Prog_sevpa.Internals.add (Llvm_internal(lib, llvm_int)) llvm_comps
      )
      llvm_ints
      Prog_sevpa.Internals.empty in

  let lift_llvm_calls llvm_calls =
    Llvm_sevpa.Calls.fold
      (fun llvm_call llvm_comps ->
        Prog_sevpa.Calls.add (Llvm_call(lib, llvm_call)) llvm_comps
      )
      llvm_calls
      Prog_sevpa.Calls.empty in
  
  let lift_llvm_states llvm_states =
    Llvm_sevpa.States.fold
      (fun llvm_state lifted_states ->
         Prog_sevpa.States.add (Llvm_state(llvm_state)) lifted_states
      )
      llvm_states
      Prog_sevpa.States.empty in

  (* lift_llvm_mod: takes an LLVM module as input, lifts it to a
   * module in the composition. *)
  let lift_llvm_mod (states, init, exits) =
    (lift_llvm_states states, Llvm_state(init), lift_llvm_states exits) in

  (* lifted_call_mod: the call-module map of the composition. *)
  let lifted_call_mod call =
    (match call with
         Llvm_call(_, llvm_call) ->
           lift_llvm_mod (lib_llvm_sevpa.Llvm_sevpa.lib_call_mod llvm_call)
       | Bin_call(_) -> failwith "call_mod: unexpected Bin_call"
    ) in

  (* lift_int_enabled: the internal enabled map of the composition. *)
  let lifted_int_enabled state =
    (match state with
         Llvm_state(llvm_state) -> 
           lift_llvm_internals
             (lib_llvm_sevpa.Llvm_sevpa.lib_int_enabled llvm_state)
       | Bin_state(bin_state) -> failwith "int_enabled: unexpected Bin_state"
    ) in

  (* comp_call_enabled: enabled calls of the composed SEVPA. *)
  let lifted_call_enabled state =
    (match state with
         Llvm_state(llvm_state) ->
           lift_llvm_calls
             (lib_llvm_sevpa.Llvm_sevpa.lib_call_enabled llvm_state)
       | Bin_state(bin_state) -> failwith "call_enabled: unexpected Bin_state"
    ) in

  (* lifted_int_trans: the internal transition function of the
   * composition. *)
  let lifted_int_trans pre internal =
    (match pre, internal with
         Llvm_state(llvm_pre), Llvm_internal(_, llvm_int) ->
           Llvm_state(
             lib_llvm_sevpa.Llvm_sevpa.lib_int_trans llvm_pre llvm_int)
       | _ -> failwith "lifted_int_trans: unexpected transition prefix."
    ) in

  (* lifted_ret_trans: the return transition function of the
   * composition. *)
  let lifted_ret_trans pre stack =
    (match pre, stack with
         Llvm_state(llvm_pre), Llvm_state(llvm_stack) ->
           Llvm_state(
             lib_llvm_sevpa.Llvm_sevpa.lib_return_trans llvm_pre llvm_stack)
       | _ -> failwith "lifted_ret_trans: unexpected return transition"
    ) in

    { Prog_sevpa.lib_nm = "lifted_lib";
      lib_ints = lift_llvm_internals lib_llvm_sevpa.Llvm_sevpa.lib_ints;
      lib_calls = lift_llvm_calls lib_llvm_sevpa.Llvm_sevpa.lib_calls;
      lib_states = lift_llvm_states lib_llvm_sevpa.Llvm_sevpa.lib_states;
      lib_acc = lift_llvm_states lib_llvm_sevpa.Llvm_sevpa.lib_acc;
      lib_call_mod = lifted_call_mod;
      lib_int_enabled = lifted_int_enabled;
      lib_call_enabled = lifted_call_enabled;
      lib_int_trans = lifted_int_trans;
      lib_return_trans = lifted_ret_trans;
    }

let lift_llvm_internals lib llvm_ints =
  Llvm_sevpa.Internals.fold
    (fun llvm_int llvm_comps ->
      Prog_sevpa.Internals.add (Llvm_internal(lib, llvm_int)) llvm_comps
    )
    llvm_ints
    Prog_sevpa.Internals.empty

let lift_llvm_sevpa lib llvm_sevpa =
  let lift_llvm_calls llvm_calls =
    Llvm_sevpa.Calls.fold
      (fun llvm_call ->
        Prog_sevpa.Calls.add (Llvm_call(lib, llvm_call))
      )
      llvm_calls
      Prog_sevpa.Calls.empty in
  
  let lift_llvm_states llvm_states =
    Llvm_sevpa.States.fold
      (fun llvm_state lifted_states ->
         Prog_sevpa.States.add (Llvm_state(llvm_state)) lifted_states
      )
      llvm_states
      Prog_sevpa.States.empty in

  (* lift_llvm_mod: takes an LLVM module as input, lifts it to a
   * module in the composition. *)
  let lift_llvm_mod (states, init, exits) =
    (lift_llvm_states states, Llvm_state(init), lift_llvm_states exits) in

  (* lifted_call_mod: the call-module map of the composition. *)
  let lifted_call_mod call =
    (match call with
         Llvm_call(_, llvm_call) ->
           lift_llvm_mod (llvm_sevpa.Llvm_sevpa.sevpa_call_mod llvm_call)
       | Bin_call(_) -> failwith "call_mod: unexpected Bin_call"
    ) in

  (* lift_int_enabled: the internal enabled map of the composition. *)
  let lifted_int_enabled state =
    (match state with
         Llvm_state(llvm_state) -> 
           lift_llvm_internals
             lib
             (llvm_sevpa.Llvm_sevpa.sevpa_int_enabled llvm_state)
       | Bin_state(bin_state) -> failwith "int_enabled: unexpected Bin_state"
    ) in

  (* comp_call_enabled: enabled calls of the composed SEVPA. *)
  let lifted_call_enabled state =
    (match state with
         Llvm_state(llvm_state) ->
           lift_llvm_calls
             (llvm_sevpa.Llvm_sevpa.sevpa_call_enabled llvm_state)
       | Bin_state(bin_state) -> failwith "call_enabled: unexpected Bin_state"
    ) in

  (* lifted_int_trans: the internal transition function of the
   * composition. *)
  let lifted_int_trans pre internal =
    (match pre, internal with
         Llvm_state(llvm_pre), Llvm_internal(_, llvm_int) ->
           Llvm_state(
             llvm_sevpa.Llvm_sevpa.sevpa_int_trans llvm_pre llvm_int)
       | _ -> failwith "lifted_int_trans: unexpected transition prefix."
    ) in

  (* lifted_ret_trans: the return transition function of the
   * composition. *)
  let lifted_ret_trans pre stack =
    (match pre, stack with
         Llvm_state(llvm_pre), Llvm_state(llvm_stack) ->
           Llvm_state(
             llvm_sevpa.Llvm_sevpa.sevpa_return_trans llvm_pre llvm_stack)
       | _ -> failwith "lifted_ret_trans: unexpected return transition"
    ) in

    { Prog_sevpa.sevpa_nm = "lifted_lib";
      sevpa_ints = lift_llvm_internals lib llvm_sevpa.Llvm_sevpa.sevpa_ints;
      sevpa_calls = lift_llvm_calls llvm_sevpa.Llvm_sevpa.sevpa_calls;
      sevpa_states = lift_llvm_states llvm_sevpa.Llvm_sevpa.sevpa_states;
      sevpa_acc = lift_llvm_states llvm_sevpa.Llvm_sevpa.sevpa_acc;
      sevpa_entry_mod = lift_llvm_mod llvm_sevpa.Llvm_sevpa.sevpa_entry_mod;
      sevpa_call_mod = lifted_call_mod;
      sevpa_int_enabled = lifted_int_enabled;
      sevpa_call_enabled = lifted_call_enabled;
      sevpa_int_trans = lifted_int_trans;
      sevpa_return_trans = lifted_ret_trans;
    }

let lib_to_vpa lib actions =
  (match lib with
      Llvm_lib(llvm_lib) -> failwith "Program.lib_to_vpa: case Llvm_lib"
    | Bin_lib(_) -> failwith "Program.lib_to_vpa: case Bin_lib"
  )

let entry_to_vpa entry actions =
  (match entry with
      Llvm_lib(llvm_lib) -> 
        let (llvm_sevpa, lib_ints) =
          Llvm_prog.lib_to_sevpa llvm_lib actions in
        (lift_llvm_sevpa llvm_lib llvm_sevpa,
         lift_llvm_internals llvm_lib lib_ints)
    | Bin_lib(_) -> failwith "Program.entry_to_vpa: case Bin_lib"
  )

let lib_call_graph lib =
  (match lib with
      Llvm_lib(llvm_lib) -> Llvm_prog.lib_cg llvm_lib
    | Bin_lib(bin_lib) -> Bin_prog.lib_cg bin_lib
  )

(* approx_calls: language for approximating the policy-relevant calls
 * made by a function. *)
type approx_calls =
    Pol_noop
  | Exactly_once of Prog_sevpa.Calls.t
  | At_most_once of Prog_sevpa.Calls.t
  | Kleene of Prog_sevpa.Calls.t
  | Havoc

let lang_to_string lang =
  let calls_to_string =
    Libext.set_to_string Prog_sevpa.Calls.fold Prog_sevpa.call_to_string in
  (match lang with
      Pol_noop -> "noop"
    | Exactly_once(calls) -> calls_to_string calls
    | At_most_once(calls) -> (calls_to_string calls) ^ "?"
    | Kleene(calls) -> (calls_to_string calls) ^ "*"
    | Havoc -> "*"
  )

let int_hold_functions prog_sevpa internals =
  Prog_sevpa.Calls.filter
    (fun call ->
      (* mod_states: states in the call module. *)
      let (mod_states, _, _) = prog_sevpa.Prog_sevpa.sevpa_call_mod call in

      (* mod_ints: the internal actions enabled at some state in
       * the module. *)
      let mod_ints =
        Prog_sevpa.States.fold
          (fun state mod_ints ->
            Prog_sevpa.Internals.union
              mod_ints (prog_sevpa.Prog_sevpa.sevpa_int_enabled state)
          )
          mod_states
          Prog_sevpa.Internals.empty in

           (* Check if some module internal is a key internal. *)
      not 
        (Prog_sevpa.Internals.is_empty
           ((Prog_sevpa.Internals.inter mod_ints internals)))
    )
    prog_sevpa.Prog_sevpa.sevpa_calls

(* proj_intraproc: project intraprocedural actions. *)
let proj_intraproc prog_sevpa internals = 
  (* callsites: states that issue calls. *)
  let callsites =
    Prog_sevpa.States.filter
      (fun state -> 
        not
          (Prog_sevpa.Calls.is_empty
             (prog_sevpa.Prog_sevpa.sevpa_call_enabled state))
      )
      prog_sevpa.Prog_sevpa.sevpa_states in

  (* key_returns: returns from calls to projected functions. *)
  let key_returns =
    (* For each key caller: *)
    Prog_sevpa.States.fold
      (fun caller key_returns ->
         (* For each call enabled for the caller: *)
         Prog_sevpa.Calls.fold
           (fun call key_returns ->
              let (_, _, call_exits) =
                prog_sevpa.Prog_sevpa.sevpa_call_mod call in
                (* For each exit state in the callee: *)
                Prog_sevpa.States.fold
                  (fun exit_state key_returns ->
                     Prog_sevpa.States.add
                       (prog_sevpa.Prog_sevpa.sevpa_return_trans 
                          exit_state caller)
                       key_returns
                  )
                  call_exits
                  key_returns
           )
           (prog_sevpa.Prog_sevpa.sevpa_call_enabled caller)
           key_returns
      )
      callsites
      Prog_sevpa.States.empty in

  (* proj_module: takes a module as input. Projects the module, and
   * defines enabled and transition maps for states in the module. *)
  let proj_module (mod_states, mod_init, mod_exits) =
    let mod_internals =
      let ret_sites =
        let non_ret_sites =
          Prog_sevpa.States.fold
            (fun int_pre -> 
              Prog_sevpa.Internals.fold
                (fun instr -> 
                  Prog_sevpa.States.add
                    (prog_sevpa.Prog_sevpa.sevpa_int_trans int_pre instr)
                )
                (prog_sevpa.Prog_sevpa.sevpa_int_enabled int_pre)
            )
            mod_states 
            Prog_sevpa.States.empty in
        Prog_sevpa.States.diff mod_states non_ret_sites in
      Prog_sevpa.States.fold
        (fun pre mod_internals ->
           let pre_ints =
             Prog_sevpa.Internals.filter
               (fun internal ->
                  let is_key_int =
                    Prog_sevpa.Internals.mem internal internals in
                  let is_to_interproc =
                    let dest = 
                      prog_sevpa.Prog_sevpa.sevpa_int_trans pre internal in
                      Prog_sevpa.States.mem
                        dest
                        (Prog_sevpa.States.union
                           callsites
                           (Prog_sevpa.States.union key_returns mod_exits)) in
                  let is_ret_site = Prog_sevpa.States.mem pre ret_sites in
                    is_key_int || is_to_interproc || is_ret_site
               )
               (prog_sevpa.Prog_sevpa.sevpa_int_enabled pre) in
             Prog_sevpa.Internals.union mod_internals pre_ints
        )
        mod_states
        Prog_sevpa.Internals.empty in

    (* int_en_map: the internal enabled map.
     * 
     * int_trans_map: the internal transition map. *)
    let (int_en_map', int_trans_map') =
      (* For each module state: *)
      Prog_sevpa.States.fold
        (fun prog_state (int_en_map, int_trans_map) ->
           (* state_eps_front: the epsilon frontier of the state. *)
           let state_eps_front =
             let rec cons_eps_frontier seen frontier =
               (* If the frontier is empty: *)
               if Prog_sevpa.States.is_empty frontier then
                 (* then return the set of all states seen so far. *)
                 seen
               else
                 (* chosen: a state chosen from the frontier. *)
                 let chosen = Prog_sevpa.States.choose frontier in
                 let rem_frontier = Prog_sevpa.States.remove chosen frontier in

                 (* eps_reach: states reachable from the chosen state
                  * over non-key instructions. *)
                 let eps_reach =
                   Prog_sevpa.Internals.fold
                     (fun eps_int eps_reach ->
                       Prog_sevpa.States.add 
                         (prog_sevpa.Prog_sevpa.sevpa_int_trans
                            chosen eps_int)
                         eps_reach
                     )
                     (Prog_sevpa.Internals.diff
                        (prog_sevpa.Prog_sevpa.sevpa_int_enabled chosen)
                        mod_internals)
                     Prog_sevpa.States.empty in

                 (* frontier': the updated frontier. The old frontier
                  * and all eps-reachable states that haven't already
                  * been seen. *)
                 let frontier' = 
                   Prog_sevpa.States.union
                     rem_frontier (Prog_sevpa.States.diff eps_reach seen) in

                 (* seen': the updated set of seen states. *)
                 let seen' = Prog_sevpa.States.union seen eps_reach in
                   cons_eps_frontier seen' frontier' in
               cons_eps_frontier
                 (Prog_sevpa.States.singleton prog_state)
                 (Prog_sevpa.States.singleton prog_state) in

           (* state_int_en: enabled internal actions for the state. *)
           let (state_int_en, int_trans_map') =
             Prog_sevpa.States.fold
               (fun front_state (state_int_en, int_trans_map') ->
                  (* key_int_en: the key internals enabled for the
                   * current state. *)
                  let key_front_en =
                    Prog_sevpa.Internals.inter
                      (prog_sevpa.Prog_sevpa.sevpa_int_enabled front_state)
                      mod_internals in

                  (* int_trans_map': updated internal transition map. *)
                  let int_trans_map' =
                    Prog_sevpa.Internals.fold
                      (fun internal int_trans_map' ->
                         Prog_sevpa.Internal_trans_map.add
                           (prog_state, internal)
                           (prog_sevpa.Prog_sevpa.sevpa_int_trans
                              front_state internal)
                           int_trans_map'
                      )
                      key_front_en
                      int_trans_map' in
                    (Prog_sevpa.Internals.union state_int_en key_front_en,
                     int_trans_map')
               )
               state_eps_front
               (Prog_sevpa.Internals.empty, int_trans_map) in

           (* int_en': the enabled internal map, updated for the
            * current state. *)
           let int_en' =
             Prog_sevpa.State_map.add prog_state state_int_en int_en_map in
             (int_en', int_trans_map')
        )
        mod_states
        (Prog_sevpa.State_map.empty, Prog_sevpa.Internal_trans_map.empty) in

    (* mod_states': states in the projected module. Consists of the
     * initial state of the module and all states that are destinations
     * of key internals. *)
    let mod_states' =
      (* int_succ_states: successor of key internal actions. *)
      let int_succ_states =
        Prog_sevpa.State_map.fold
          (fun state enabled_ints int_succ_states ->
             Prog_sevpa.Internals.fold
               (fun enabled_int int_succ_states ->
                  if Prog_sevpa.Internals.mem enabled_int mod_internals then
                    Prog_sevpa.States.add
                      (Prog_sevpa.Internal_trans_map.find
                         (state, enabled_int) int_trans_map')
                      int_succ_states
                  else int_succ_states
               )
               enabled_ints
               int_succ_states
          )
          int_en_map'
          Prog_sevpa.States.empty in
        Prog_sevpa.States.add
          mod_init
          (Prog_sevpa.States.union
             int_succ_states
             (Prog_sevpa.States.inter
                mod_states
                (Prog_sevpa.States.union callsites key_returns))) in

      ((mod_states', mod_init, mod_exits), int_en_map', int_trans_map') in

  (* entry_mod: the entry module, with no exit states. *)
  let entry_mod =
    let (entry_states, entry_init, _) = 
      prog_sevpa.Prog_sevpa.sevpa_entry_mod in
      (entry_states, entry_init, Prog_sevpa.States.empty) in

  (* Projection of the entry module. *)
  let (proj_entry_mod, proj_int_enabled_map, proj_int_trans_map) =
    proj_module entry_mod in

  (* Projection of the call modules. *)
  let (call_mod_map, int_en_map, int_trans_map) =
    Prog_sevpa.Calls.fold
      (fun call (proj_call_mods, proj_int_en_map, proj_int_trans_map) ->
         let call_mod = prog_sevpa.Prog_sevpa.sevpa_call_mod call in
         let (call_mod', mod_int_en_map, mod_int_trans_map) =
           proj_module call_mod in
           
         let proj_call_mods' =
           Prog_sevpa.Call_trans_map.add call call_mod' proj_call_mods in
           
         let proj_int_en_map' =
           map_union Prog_sevpa.State_map.fold Prog_sevpa.State_map.add
             proj_int_en_map mod_int_en_map in

         let proj_int_trans_map' =
           Libext.map_union
             Prog_sevpa.Internal_trans_map.fold
             Prog_sevpa.Internal_trans_map.add
             proj_int_trans_map
             mod_int_trans_map in

           (proj_call_mods', proj_int_en_map', proj_int_trans_map')
      )
      prog_sevpa.Prog_sevpa.sevpa_calls
      (Prog_sevpa.Call_trans_map.empty,
       proj_int_enabled_map,
       proj_int_trans_map) in

  (* proj_call_mods: map from call to module in the projection. *)
  let proj_call_mods call =
    Prog_sevpa.Call_trans_map.find call call_mod_map in

  (* proj_int_enabled: the enabled internal map of the projection. *)
  let proj_int_enabled state = Prog_sevpa.State_map.find state int_en_map in
    
  (* proj_int_trans: the internal transition function of the projection. *)
  let proj_int_trans state act =
    Prog_sevpa.Internal_trans_map.find (state, act) int_trans_map in

  (* proj_states: the set of states that stay in the projection. *)
  let proj_states =
    let (proj_entry_states, _, _) = proj_entry_mod in
      Prog_sevpa.Call_trans_map.fold
        (fun call (call_mod_states, _, _) proj_states ->
           Prog_sevpa.States.union proj_states call_mod_states
        )
        call_mod_map
        proj_entry_states in

  (* proj_ints: the internal actions of the projection. *)
  let proj_ints =
    Prog_sevpa.States.fold
      (fun state proj_ints ->
         Prog_sevpa.Internals.union proj_ints (proj_int_enabled state)
      )
      proj_states
      Prog_sevpa.Internals.empty in

    (* Construct the final program. *)
  let res =
    { Prog_sevpa.sevpa_nm = "intra_proj_prog";
      sevpa_ints = proj_ints;
      sevpa_calls = prog_sevpa.Prog_sevpa.sevpa_calls;
      sevpa_states = proj_states;
      sevpa_acc = proj_states;
      sevpa_entry_mod = proj_entry_mod;
      sevpa_call_mod = proj_call_mods;
      sevpa_int_enabled = proj_int_enabled;
      sevpa_call_enabled = prog_sevpa.Prog_sevpa.sevpa_call_enabled;
      sevpa_int_trans = proj_int_trans;
      sevpa_return_trans = prog_sevpa.Prog_sevpa.sevpa_return_trans;
    } in
  dbg "proj_intraproc: pre chk SEVPA";
  (* assert (Prog_sevpa.is_well_formed res); *)
  dbg "proj_intraproc: SEVPA is well-formed";
  res

(* project_prog: project the program to include only the given
 * internals. *)
let project_prog = proj_intraproc 

let llvm_inst internal =
  (match internal with
      Llvm_internal(_, llvm_int) ->
        Some(Llvm_prog.internal_instr llvm_int)
    | _ -> None
  )

(* lookup_callees: takes a program SEVPA and the name of a
 * callee. Constructs the set of all internals are calls into the
 * callee. *)
let lookup_callees prog_sevpa callee =
  Prog_sevpa.Internals.filter
    (fun intrnal ->
      (match llvm_inst intrnal with
          Some(inst) ->
            (match Llvm_prog.callee_name inst with
                Some(callee_nm) -> callee = callee_nm
              | None -> false
            )
        | None -> false
      )
    )
    prog_sevpa.Prog_sevpa.sevpa_ints

let lookup_call prog_sevpa func_nm arg_code =
  let callee_opt =
    Prog_sevpa.Internals.fold
      (fun intrnal callee_opt ->
        (match callee_opt, llvm_inst intrnal with
            Some(_), _ -> callee_opt
          | None, Some(inst) ->
            if Llvm.instr_opcode inst = Llvm.Opcode.Call then
              (match Llvm.call_get_called_function inst with
                  Some(callee) ->
                    if (Llvm.value_name callee) = func_nm then
                      (match Llvm.int64_of_const (Llvm.call_get_arg inst 0) with
                          Some(c) ->
                            if Int64.to_int c = arg_code then Some(intrnal)
                            else None
                        | None -> None
                      )
                    else None
                | None -> None
              )
            else None
          | None, None -> None
        )
      )
      prog_sevpa.Prog_sevpa.sevpa_ints
      None in
  (match callee_opt with
      Some(callee) -> callee
    | None -> failwith ("lookup_call: " ^ func_nm ^ " not found")
  )

(* prog_to_vpa: takes a set of marker functions and a
 * program. Constructs the VPA representation of the program. *)
let prog_to_vpa marker_names prog =
  let actions =
    Libs.fold
      (fun lib ->
        (match lib with
            Llvm_lib(llvm_lib) ->
              String_pairs.union (Llvm_prog.callers llvm_lib marker_names)
          | Bin_lib(_) -> failwith "prog_to_vpa: Bin_lib: not implemented"
        )
      )
      (Libs.add prog.entry prog.libs)
      String_pairs.empty in

  (* funcs: set of key functions. *)
  (* 
  let funcs = 
    (* act_funcs: functions containing key actions. *)
    let act_funcs = 
      String_pairs.fold
        (fun (func_nm, _) -> Strings.add func_nm)
        actions
        Strings.empty in
    dbg (Libext.set_to_string Strings.fold (fun x -> x) act_funcs);

    (* call_graph: map from name of caller to name of callees. *)
    dbg "pre construct callgraph";
    let call_graph =
      Libs.fold
        (fun lib cg ->
          String_map.merge
            (fun caller callees_0_opt callees_1_opt ->
              (match callees_0_opt, callees_1_opt with
                  Some(callees), None
                | None, Some(callees) -> Some(callees)
                | None, None -> None
                | _ -> failwith "caller defined in multiple libraries"
              )
            )
            cg
            (lib_call_graph lib)
        )
        prog.libs
        (lib_call_graph prog.entry) in

    (* inv_tc_cg: inverse of the TC of the call-graph. *)
    let inv_tc_cg =
      dbg "pre construct TC of call graph";
      let tc_call_graph = tc_call_graph call_graph act_funcs in
      dbg "pre invert call graph";
      inv_call_graph tc_call_graph in
    dbg "pre collect callers";
    let tc_callers =
      String_map.fold
        (fun callee callers all_callers ->
          let func_act_callers =
            if Strings.mem callee act_funcs then callers else Strings.empty in
          Strings.union all_callers func_act_callers
        )
        inv_tc_cg
        Strings.empty in
    Strings.union act_funcs (Strings.union marker_names tc_callers) in

  dbg "pre construct entry_vpa";
  *)
  let entry_vpa = entry_to_vpa prog.entry actions in
  let (full_vpa, pol_internals) =
    Libs.fold
      (fun lib (vpa, key_internals) ->
        let (lib_vpa, lib_internals) = lib_to_vpa lib actions in
        (compose_vpa_lib vpa lib_vpa,
         Prog_sevpa.Internals.union key_internals lib_internals)
      )
      prog.libs
      entry_vpa in

  (* Project the full program VPA. *)
  project_prog full_vpa pol_internals


let fork_part_funcs calls prog =
  Prog_sevpa.Calls.filter
    (fun prog_call -> 
      (match prog_call with
          Llvm_call(_, llvm_call) -> Llvm_prog.is_fork_func llvm_call
        | _ -> false
      )
    )
    calls

let rpc_part_funcs calls prog =
  Prog_sevpa.Calls.filter
    (fun prog_call -> 
      (match prog_call with
          Llvm_call(_, llvm_call) -> Llvm_prog.is_part_func llvm_call
        | _ -> false
      )
    )
    calls
    
let instr_prog prog internals internal_index mods mod_index =
  (* llvm_ints: the LLVM internals that are used as actions in the
   * model. *)
  let llvm_ints llvm_lib =
    Prog_sevpa.Internals.fold
      (fun internal lib_ints ->
        (match internal with
            Llvm_internal(inst_lib, llvm_inst) ->
              if llvm_lib = inst_lib then
                Llvm_sevpa.Internals.add llvm_inst lib_ints
              else lib_ints
          | _ -> lib_ints
        )
      )
      internals
      Llvm_sevpa.Internals.empty in

  (* llvm_internal_map: an index of each LLVM internal. *)
  let llvm_internal_map =
    Libs.fold
      (fun lib llvm_internal_map ->
        (match lib with
            Llvm_lib(llvm_lib) ->
              Llvm_sevpa.Internals.fold
                (fun llvm_int ->
                  Llvm_sevpa.Internal_map.add
                    llvm_int
                    (internal_index (Llvm_internal(llvm_lib, llvm_int))) 
                )
                (llvm_ints llvm_lib)
                llvm_internal_map
          | _ -> llvm_internal_map
        )
      )
      (Libs.add prog.entry prog.libs)
      Llvm_sevpa.Internal_map.empty in

  let llvm_internals =
    Llvm_sevpa.Internal_map.fold
      (fun llvm_int _ -> Llvm_sevpa.Internals.add llvm_int)
      llvm_internal_map
      Llvm_sevpa.Internals.empty in

  (* llvm_all_int_index: an index of all LLVM internals. *)
  let llvm_all_int_index intrnal = 
    Llvm_sevpa.Internal_map.find intrnal llvm_internal_map in

  (* llvm_inst_index: index of each LLVM instruction. *)
  let llvm_inst_index = Llvm_prog.gen_index llvm_internals in

  (* llvm_mods: the modules in an LLVM library. *)
  let llvm_mods is_entry llvm_lib =
    Prog_sevpa.Mod_ids.fold
      (fun modul lib_mods ->
        (match modul with
            Entry_mod -> 
              if is_entry then Llvm_sevpa.Mod_ids.add Entry_mod lib_mods
              else lib_mods
          | Call_mod(call) ->
            (match call with
                Llvm_call(call_lib, llvm_call) ->
                  if llvm_lib = call_lib then
                    Llvm_sevpa.Mod_ids.add (Call_mod(llvm_call)) lib_mods
                  else lib_mods
              | _ -> lib_mods
            )
        )
      )
      mods
      Llvm_sevpa.Mod_ids.empty in

  (* all_llvm_mods: all LLVM modules over all libraries. *)
  let all_llvm_mods = 
    let lib_mods lib = 
      (match lib with
          Llvm_lib(llvm_lib) -> llvm_mods true llvm_lib
        | _ -> Llvm_sevpa.Mod_ids.empty
      ) in
    Libs.fold
      (fun lib -> Llvm_sevpa.Mod_ids.union (lib_mods lib))
      prog.libs
      (lib_mods prog.entry) in

  (* llvm_mod_index: an index over all LLVM modules. *)
  let llvm_mod_index =
    let mod_index_map =
      Prog_sevpa.Mod_ids.fold
        (fun prog_mod mod_index_map -> 
          let ind = mod_index prog_mod in
          (match prog_mod with
              Entry_mod -> 
                Llvm_sevpa.Mod_id_map.add Entry_mod ind mod_index_map
            | Call_mod(Llvm_call(_, llvm_call)) ->
              Llvm_sevpa.Mod_id_map.add
                (Call_mod(llvm_call)) ind mod_index_map
            | _ -> mod_index_map
          )
        )
        mods
        Llvm_sevpa.Mod_id_map.empty in
    (fun modul -> Llvm_sevpa.Mod_id_map.find modul mod_index_map) in

  (* Generate an LLVM instrumentaton store. *)
  Llvm_prog.gen_llvm_instr_store
    llvm_internals 
    llvm_all_int_index
    llvm_inst_index
    all_llvm_mods 
    llvm_mod_index
    (prog_name prog);

  (* Instrument the modules of the program. First, instrument the
   * entry module of the program. *)
  (match prog.entry with
      Llvm_lib(llvm_lib) ->
        let lib_ints = llvm_ints llvm_lib in
        Llvm_prog.instr_entry
          llvm_lib lib_ints llvm_inst_index all_llvm_mods llvm_mod_index
    | Bin_lib(bin_lib) -> failwith "Program.instr_prog: Bin_lib case"
  );

  (* Instrument all library modules of the program. *)
  Libs.iter
    (fun lib ->
      (match lib with
          Llvm_lib(llvm_lib) ->
            (* lib_ints: the internals defined for the library. *)
            let lib_ints = llvm_ints llvm_lib in

            (* Instrument the LLVM library. *)
            Llvm_prog.instr_lib 
              llvm_lib lib_ints llvm_inst_index all_llvm_mods llvm_mod_index
        | Bin_lib(bin_lib) -> failwith "Program.instr_prog: case Bin_lib"
      )
    )
    prog.libs

let parse_llvm_lib lib_nm = Llvm_lib(Llvm_prog.load_lib lib_nm)

let parse_prog llvm_entry_opt bin_entry_opt llvm_lib_opt bin_lib_opt =
  (* entry_mod: the entry module of the program. *)
  let entry_mod =
    (match llvm_entry_opt, bin_entry_opt with
        Some(llvm_file_nm), None -> parse_llvm_lib llvm_file_nm
      | None, Some(bin_file_nm) -> Bin_lib(Bin_prog.load_lib bin_file_nm)
      | _ -> 
        invalid_arg
          "WAG expected exactly one program module with an entry function."
    ) in

  (* libs: the libraries of the program. *)
  let lib_mods =
    let llvm_libs =
      (match llvm_lib_opt with
          Some(llvm_file_nm) ->
            Libs.singleton (parse_llvm_lib llvm_file_nm)
        | None -> Libs.empty
      ) in
    (match bin_lib_opt with
        Some(bin_file_nm) -> 
          Libs.add (Bin_lib(Bin_prog.load_lib bin_file_nm)) llvm_libs
      | None -> llvm_libs
    ) in

  (* Construct the program. *)
  { entry = entry_mod;
    libs = lib_mods;
  }

let append_llvm_lib prog lib_nm =
  { prog with libs = Libs.add (parse_llvm_lib lib_nm) prog.libs }
