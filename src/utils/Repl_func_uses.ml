(* Upd_func_uses: take an LLVM bitcode, a target function, and a
 * replacement function. Replace all instances of the target with the
 * replacement. *)
open Llvm

let driver _ =
  (* Parse command-line arguments. *)
  let prog_cell = ref None in
  let target_cell = ref None in
  let repl_cell = ref None in
  let set_opt store value = store := Some(value) in
  Arg.parse
    [ ("-prog",
       Arg.String(set_opt prog_cell),
       "file containing the target LLVM bitcode");
      ("-target",
       Arg.String(set_opt target_cell),
       "name of the target function");
      ("-replacement",
       Arg.String(set_opt repl_cell),
       "name of the replacement function");
    ]
    (fun _ -> ())
    "bad argument";

  (* prog_nm: the name of the program. *)
  let prog_nm =
    (match !prog_cell with
        Some(prog_nm) -> prog_nm
      | None -> failwith "program name: not provided"
    ) in

  (* prog: the program bitcode. *)
  let prog =
    Llvm_bitreader.parse_bitcode
      (Llvm.global_context ()) (MemoryBuffer.of_file prog_nm) in

  (* target_func_nm: name of the target function. *)
  let target_func_nm =
    (match !target_cell with
        Some(target_func) -> target_func
      | None -> failwith "target_func: not provided"
    ) in

  (* repl_func_nm: name of the replacment function. *)
  let repl_func_nm =
    (match !repl_cell with
        Some(repl_func) -> repl_func
      | None -> failwith "repl_func: not provided"
    ) in

  (* Replace target function if it exists. *)
  (match Llvm.lookup_function target_func_nm prog with
      Some(target_func) -> 
          (* repl_func: the replacment function. *)
        let target_type = Llvm.element_type (Llvm.type_of target_func) in
        let repl_func = Llvm.declare_function repl_func_nm target_type prog in

        (* Replace all uses of the target function with use sof the
         * replacement function. *)
        replace_all_uses_with target_func repl_func;
    | None -> ()
  );

  (* Write the bitcode to a file. *)
  let bc_out = prog_nm ^ "-" ^ target_func_nm ^ "-" ^ repl_func_nm ^ ".bc" in
  let write_succ = Llvm_bitwriter.write_bitcode_file prog bc_out in
  if write_succ then ()
  else failwith ("failed to write bitcode to " ^ bc_out) ;;
    
driver ()
