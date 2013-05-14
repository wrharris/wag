(* Llvm_prog.ml: implementation of LLVM VPAs. *)
open Libext
open Llvm
open Vpa

module Llvm_value =
  struct
    type t = Llvm.llvalue
    let compare llval_0 llval_1 =
      compare (Llvm.get_addr llval_0) (Llvm.get_addr llval_1)
  end

module Llvm_value_pairs =
  Set.Make(
    struct
      type t = Llvm.llvalue * Llvm.llvalue
      let compare (fst_val_0, sec_val_0) (fst_val_1, sec_val_1) =
        let fst_cmp = Llvm_value.compare fst_val_0 fst_val_1 in
        if fst_cmp = 0 then Llvm_value.compare sec_val_0 sec_val_1
        else fst_cmp
    end
  )

module Llvm_blocks =
  Set.Make(
    struct
      type t = Llvm.llbasicblock
      let compare blk_0 blk_1 =
        compare
          (Llvm.get_addr (Llvm.value_of_block blk_0))
          (Llvm.get_addr (Llvm.value_of_block blk_1))
    end)

module Llvm_values = Set.Make(Llvm_value)

module Llvm_value_map = Map.Make(Llvm_value)

type lib =
    { modul: Llvm.llmodule;
      name: string;
    }

let lib_name l = l.name
  
module Llvm_posits =
  Set.Make(
    struct
      type t = (llmodule, llvalue) llpos
      let compare = compare
    end)

type inst_state =
    Instr of Llvm.llvalue
  | Call_pre of Llvm.llvalue
  | Indir_call of Llvm.llvalue

let cmp_inst_state state_0 state_1 = 
  (match state_0, state_1 with
      Instr(inst_0), Instr(inst_1)
    | Call_pre(inst_0), Call_pre(inst_1)
    | Indir_call(inst_0), Indir_call(inst_1) ->
      Llvm_value.compare inst_0 inst_1
    | _ -> compare state_0 state_1
  )

let instr_to_addr prog_inst = string_of_int (Llvm.get_addr prog_inst)

let instr_to_print prog_inst =
  (Llvm.value_name (Llvm.block_parent (Llvm.instr_parent prog_inst)))
  ^ "_" ^ (Llvm.print_value prog_inst)

let inst_state_to_string instr_to_string q =
  (match q with
      Instr(i) -> "I(" ^ (instr_to_string i) ^ ")"
    | Call_pre(i) -> "CP(" ^ (instr_to_string i) ^ ")"
    | Indir_call(i) -> "IN(" ^ (instr_to_string i) ^ ")"
  )

(* llvm_state: a state of an LLVM VPA. *)
type llvm_state = 
    Inst_state of inst_state
  | Call_post of Llvm.llvalue

(* Llvm_state: an ordered type of states. *)
module Llvm_state =
struct
  type t = llvm_state
  let compare state_0 state_1 =
    (match state_0, state_1 with
        Inst_state(q_0), Inst_state(q_1) -> cmp_inst_state q_0 q_1
      | Call_post(q_0), Call_post(q_1) -> Llvm_value.compare q_0 q_1
      | _ -> compare state_0 state_1
    )
end

(* Llvm_states: a set of states. *)
module Llvm_states = Set.Make(Llvm_state)

(* human-friendly version of the to_string function. *)
let llvm_state_to_string_h instr_to_string q =
  (match q with
      Inst_state(iq) -> inst_state_to_string instr_to_string iq
    | Call_post(call_inst) -> "PO(" ^ (instr_to_string call_inst) ^ ")"
  )

(* llvm_state_to_string: state to-string function. *)
let llvm_state_to_string = llvm_state_to_string_h instr_to_addr

(* internal_inst: an internal instruction of an internal action. *)
type internal_inst =
    Int_call of Llvm.llvalue
  | Int_intra of Llvm.llvalue
  | Int_branch of Llvm.llvalue
  | Int_indirect_branch of Llvm.llvalue
  | Int_switch of Llvm.llvalue

(* internal: an internal instruction and a destination
 * instruction. The destination is used to construct the action so that
 * we can easily construct a deterministic model. *)
type internal = internal_inst * Llvm.llvalue

module Llvm_int =
struct
  type t = internal
  let compare (int_0, succ_0) (int_1, succ_1) = 
    let int_cmp =
      (match int_0, int_1 with
          Int_call(inst_0), Int_call(inst_1)
        | Int_intra(inst_0), Int_intra(inst_1)
        | Int_branch(inst_0), Int_branch(inst_1)
        | Int_indirect_branch(inst_0), Int_indirect_branch(inst_1)
        | Int_switch(inst_0), Int_switch(inst_1) -> 
          Llvm_value.compare inst_0 inst_1
        | _ -> compare int_0 int_1
      ) in
    if int_cmp != 0 then int_cmp else Llvm_value.compare succ_0 succ_1
end

module Llvm_ints = Set.Make(Llvm_int)

let internal_instr (internal_inst, _) =
  (match internal_inst with
      Int_call(instr)
    | Int_intra(instr)
    | Int_branch(instr)
    | Int_indirect_branch(instr)
    | Int_switch(instr) -> instr
  )

let internal_stub_callee internal = 
  let instr = internal_instr internal in
  if Llvm.instr_opcode instr = Llvm.Opcode.Call then 
    (match Llvm.call_get_called_function instr with
        Some(callee) -> Some(Llvm.value_name callee)
      | None -> None
    ) 
  else None

let internal_succ (_, succ_inst) = succ_inst

let intra_block_succ inst =
  (match Llvm.instr_succ inst with
      At_end(_) -> failwith "intra_block_succ: succ not found"
    | Before(succ) -> succ
  )

let internal_to_string_nm internal =
  (Llvm.print_value (internal_instr internal)) ^ "_to_" 
  ^ (Llvm.print_value (internal_succ internal))

let internal_to_string_addr internal =
  (string_of_int (Llvm.get_addr (internal_instr internal))) ^ "_to_" 
  ^ (string_of_int (Llvm.get_addr (internal_succ internal)))

let internal_to_string = internal_to_string_addr

(* call: an LLVM call. *)
type call = Llvm.llvalue

module Llvm_call = Llvm_value

module Llvm_calls = Llvm_values

module Llvm_mod_ids =
  Set.Make(
    struct
      type t = call mod_id
      let compare = compare
    end
  )

module Llvm_id_map =
  Map.Make(
    struct
      type t = call mod_id
      let compare = compare
    end
  )

let call_to_llvm_func call = call

let callee_name inst =
  (match Llvm.classify_value inst with
      ValueKind.Instruction(Opcode.Call) ->
        (match Llvm.call_get_called_function inst with
            Some(callee) -> Some(Llvm.value_name callee)
          | None -> None
        )
    | _ -> None
  )


let callers lib callees =
  (* For each function: *)
  Llvm.fold_left_functions
    (fun callers func ->
      (* For each block in the function: *)
      Llvm.fold_left_blocks
        (fun callers blk ->
          (* For each value in the block: *)
          Llvm.fold_left_instrs
            (fun callers instr ->
              (* For each marked call: *)
              Strings.fold
                (fun marker_nm callers ->
                  (match callee_name instr with
                      Some(callee_nm) ->
                        if callee_nm = marker_nm then
                          String_pairs.add
                            (Llvm.value_name func, Llvm.print_value instr)
                            callers
                        else callers
                    | None -> callers
                  )
                )
                callees
                callers
            )
            callers
            blk
        )
        callers
        func
    )
    String_pairs.empty
    lib.modul

let call_to_string = Llvm.value_name

(* Module of program SEVPA's. *)
module Llvm_sevpa =
  Sevpa_abs(
    struct
      module Comp_state = Llvm_state
      module Comp_states = Llvm_states

      module Comp_int = Llvm_int
      module Comp_ints = Llvm_ints

      module Comp_call = Llvm_call
      module Comp_calls = Llvm_calls
        
      module Comp_id_map = Llvm_id_map
      module Comp_mod_ids = Llvm_mod_ids

      let comp_state_to_string = llvm_state_to_string
      let comp_internal_to_string = internal_to_string
      let comp_call_to_string = call_to_string
    end)

type instr_func = 
    lib ->
    Llvm_sevpa.Internals.t ->
    (Llvm.llvalue -> int) ->
    Llvm_sevpa.Mod_ids.t ->
    (call mod_id -> int) ->
    unit

(* block_front: get the first instruction in a basic block. *)
let block_front block =
  (match Llvm.instr_begin block with
       At_end(_) -> failwith "block_front: entry basic block is empty"
     | Before(inst) -> inst
  )

(* is_call: decide if an instruction is a call. *)
let is_call instr = Llvm.instr_opcode instr = Llvm.Opcode.Call

(* is_term: decide if an instruction terminates a block. *)
let is_term instr =
  let opcode = Llvm.instr_opcode instr in
  (* If the instruction is a terminator: *)
  opcode = Llvm.Opcode.Br 
  || opcode = Llvm.Opcode.IndirectBr
    || opcode = Llvm.Opcode.Invoke
      || opcode = Llvm.Opcode.Ret
        || opcode = Llvm.Opcode.Switch
          || opcode = Llvm.Opcode.Unreachable

let is_unreachable instr = (Llvm.instr_opcode instr) = Llvm.Opcode.Unreachable

(* is_state_instr: an instruction the defines a state. *)
let is_state_instr instr = (is_call instr) || (is_term instr)

let is_empty_func fn = Llvm.basic_blocks fn = [| |]

(* lib_func_nms: a list of functions that we assume will not call
 * arbitrary functions. *)
let lib_func_nms =
  [ "abort";
    "access";
    "atoi";
    "atol";
    "basename";
    "calloc";
    "chmod";
    "chown";
    "close";
    "connect";
    "ctime";
    "error";
    "exit";
    "fchmod";
    "fchown";
    "fclose";
    "fdopen";
    "ferror";
    "fflush";
    "fget";
    "fgetc";
    "fgets";
    "fileno";
    "fopen";
    "fseek";
    "ftell";
    "fork";
    "fprintf";
    "fputc";
    "fread";
    "free";
    "fwrite";
    "getenv";
    "getgid";
    "getnameinfo";
    "gethostbyaddr";
    "getopt";
    "getuid";
    "isatty";
    "kill";
    "libintl_gettext";
    "lstat";
    "llvm.dbg.declare";
    "llvm.dbg.value";
    "llvm.lifetime.end";
    "llvm.lifetime.start";
    "llvm.uadd.with.overflow.i32";
    "llvm.va_start";
    "llvm.va_end";
    "malloc";
    "memcmp";
    "open";
    "perror";
    "printf";
    "putc";
    "putchar";
    "puts";
    "read";
    "realloc";
    "remove";
    "rewind";
    "setenv";
    "setgid";
    "setsid";
    "setuid";
    "sigaction";
    "signal";
    "sprintf";
    "snprintf";
    "stat";
    "strcasecmp";
    "strcat";
    "strchr";
    "strcmp";
    "strcpy";
    "strcspn";
    "strdup";
    "strerror";
    "strncasecmp";
    "strncmp";
    "strncpy";
    "strlcat";
    "strlen";
    "strpbrk";
    "strrchr";
    "strspn";
    "strstr";
    "strtol";
    "time";
    "touch";
    "ungetc";
    "unlink";
    "unsetenv";
    "utime";
    "wait";
    "write";
    "xrealloc";
    "xalloc_die";
    "xcalloc";
    "xmalloc";
    "xrealloc";
    "xstrdup";
    "vfprintf";
    "zeroext";
    "__assert";
    "__error";
    (* capwave annotations: *)
    "cw_act";
    "cw_desc";
    (* capweave runtime virtualized desc wrappers: *)
    "accept";
    "bind";
    "getpeername";
    "getsockopt";
    "fds";
    "fstat";
    "ftruncate";
    "listen";
    "lseek";
    "poll";
    "pread";
    "pwrite";
    "read";
    "recv";
    "recvfrom";
    "recvmsg";
    "select";
    "send";
    "sendto";
    "sendmsg";
    "setsockopt";
    "socket";
    "socketpair";
    "write";
    (* gzip generated code: *)
    "llvm.memcpy.p0i8.p0i8.i64";
    "llvm.memset.p0i8.i64";
    "__swbuf";
    (* bzip2 generated code: *)
    "panic";
    (* php policy validators: *)
    "is_db";
    "is_wl_sys_lib";
    "is_php_mw_config";
    "is_mw_php";
    "is_skin";
    "is_scratch";
    (* tar: *)
    "full_write";
    "get_status_string";
    "hash_insert";
    "hash_initialize";
    "safe_read";
    (* wget: *)
    "quote";
  ] 

(* non_target_nms: names of functions that shouldn't be call targets
 * of undefined functions. *)
let non_target_nms = 
  [ "main";
    (* gzip: *)
    "zip"
  ] 

(* is_def_func: decide if a function is defined. *)
let is_def_func func = not (is_empty_func func)

(* is_lib: decide if a function is a library function. *)
let is_lib func = List.mem (Llvm.value_name func) lib_func_nms

(* is_call: higher-order function for deciding properties of calls. *)
let is_p_call p instr = 
  if is_call instr then
    (match Llvm.call_get_called_function instr with
        Some(func) -> p func
      | None -> false
    )
  else false

let is_def_call = is_p_call is_def_func

let is_direct_call = is_p_call (fun _ -> true)

let is_lib_call = is_p_call is_lib

(* is_undef_non_lib: decide if a function is not *)
let is_undef_non_lib func = (not (is_def_func func) && (not (is_lib func)))

(* is_undef_call: decide if an instruction is a call to an undefined
 * function. *)
let is_undef_call instr = (is_direct_call instr) &&  (not (is_def_call instr))

(* num_pads: tunable parameter that sets the number of padding
 * instructions. *)
let num_pads = 4
let pad_prog llvm_prog instrs =
  let llvm_ctx = Llvm.module_context llvm_prog in
  let int_ty = Llvm.i32_type llvm_ctx in
  let noop_global = Llvm.declare_global int_ty "noop_glob" llvm_prog in

  (* Insert a noop before each call and return. *)
  let _ =
    Llvm.fold_left_functions
      (fun inter_pads func ->
         Llvm.fold_left_blocks
           (fun inter_pads blk ->
              Llvm.fold_left_instrs
                (fun inter_pads instr ->
                   let inter_indx = Llvm_values.cardinal inter_pads in
                   let op = Llvm.instr_opcode instr in
                     if op = Opcode.Call || op = Opcode.Ret then
                       let inter_glob = 
                         Llvm.build_load
                           noop_global
                           ("ld_inter_glob_" ^ (string_of_int inter_indx))
                           (Llvm.builder_before llvm_ctx instr) in
                       let inter_noop =
                         Llvm.build_add
                           inter_glob
                           inter_glob
                           ("inter_noop_" ^ (string_of_int inter_indx))
                           (Llvm.builder_before llvm_ctx instr) in
                         Llvm_values.add
                           inter_glob (Llvm_values.add inter_noop inter_pads)
                     else inter_pads
                )
                inter_pads
                blk
           )
           inter_pads
           func
      )
      Llvm_values.empty
      llvm_prog in

  (* For each key instruction: *)
  Llvm_values.fold
    (fun instr pad_instrs ->
      let in_entry_blk = 
        let instr_blk = Llvm.instr_parent instr in
        instr_blk = Llvm.entry_block (Llvm.block_parent instr_blk) in
      (* HACK: toggle this. *)
      (*
      if in_entry_blk then pad_instrs
      else 
      *)
        (* non_phi_succ: the first non-phi instruction that succeeds
         * the current instruction. *)
        let build_pos =
          let rec iter_non_phi pos =
            (match pos with
                At_end(_) -> pos
              | Before(instr) ->
                if Llvm.instr_opcode instr = Llvm.Opcode.PHI then
                  iter_non_phi (Llvm.instr_succ instr)
                else pos
            ) in
          iter_non_phi (Before(instr)) in

        (* build_noops: insert noop instructions before the key
         * instruction. *)
        let rec build_noops dep_val i =
          if i = 0 then Llvm_values.empty
          else
            let noop_indx = (Llvm_values.cardinal pad_instrs) + i in
            let pad_instr = 
              Llvm.build_add
                dep_val
                dep_val
                ("noop_" ^ (string_of_int noop_indx))
                (Llvm.builder_at llvm_ctx build_pos) in
            Llvm_values.add
              pad_instr (build_noops pad_instr (i - 1)) in
        let init_glob = 
          Llvm.build_load
            noop_global
            ("ld_glob_ " ^ (string_of_int (Llvm_values.cardinal pad_instrs)))
            (Llvm.builder_before llvm_ctx instr) in

        Llvm_values.union
          pad_instrs (build_noops init_glob num_pads)
    )
    instrs
    Llvm_values.empty


(* lib_to_sevpa: take as an input an LLVM program (module) and
 * constructs a SEVPA model of the program. *)
let lib_to_lib_sevpa lib funcs =
  failwith "Llvm_prog.lib_to_sevpa: not implemented"

let taken_fns prog_calls = 
  Llvm_sevpa.Calls.filter
    (fun call ->
      Llvm.fold_left_uses
        (fun some_non_call_use use ->
          if some_non_call_use then true
          else 
            let user = Llvm.user use in
            (match Llvm.classify_value user with
                ValueKind.Instruction(Opcode.Call) ->
                  let num_args = Llvm.call_get_num_args user in
                  let rec iter_args arg_indx =
                    if arg_indx = num_args then false
                    else
                      let cur_arg = Llvm.call_get_arg user arg_indx in
                      cur_arg = call || (iter_args (arg_indx + 1)) in
                  iter_args 0
              | _ -> true
            )
        )
        false
        call
    )
    prog_calls 

(* taken_call_targets: takes a callee expression and constructs a set of
 * functions that may be called. *)
let taken_call_targets prog_calls =
  (* taken_funcs: all functions in the program that have their
   * address taken. *)
  let taken_funcs = taken_fns prog_calls in

  let rec decons_callee callee =
    (match Llvm.classify_value callee with
        ValueKind.Instruction(Opcode.BitCast) ->
          decons_callee (Llvm.operand callee 0)
      | ValueKind.Instruction(Opcode.Load) ->
        (* Resolve a call on a load from a global. *)
        let loadee = Llvm.operand callee 0 in
        (* Check if the loaded memory address is ever aliased. *)
        let is_glob_var =
          (match Llvm.classify_value loadee with
              ValueKind.GlobalVariable -> true
            | _ -> false
          ) in
        let not_aliased =
          Llvm.fold_left_uses
            (fun not_aliased use ->
              let user = Llvm.user use in
              if not_aliased then
                (match Llvm.classify_value user with
                    ValueKind.Instruction(Opcode.Store) ->
                      (Llvm.operand user 0) != loadee
                  | _ -> true
                )
              else false
            )
            true
            loadee in
        if is_glob_var && not_aliased then
          (* If the memory cell isn't aliased, then take the union
           * of all functions stored into it. *)
          let init_func = Llvm.global_initializer loadee in
          Llvm.fold_left_uses
            (fun callees use ->
              let user = Llvm.user use in
              (match Llvm.classify_value user with
                  ValueKind.Instruction(Opcode.Store) ->
                    if (Llvm.operand user 1) = loadee then
                      let call_value = Llvm.operand user 0 in
                      let value_is_func =
                        Llvm_values.mem call_value prog_calls in
                      if value_is_func then
                        Llvm_values.add call_value callees
                      else taken_funcs
                    else callees
                | ValueKind.GlobalVariable ->
                  Llvm_values.add (Llvm.global_initializer user) callees
                | _ -> callees
              )
            )
            (Llvm_values.inter (Llvm_values.singleton init_func) prog_calls)
            loadee
        else taken_funcs
      | ValueKind.ConstantExpr ->
        (* Get operand of some constant expression. *)
        decons_callee (Llvm.operand callee 0)
      | ValueKind.Function -> Llvm_sevpa.Calls.singleton callee
      | _ -> taken_funcs
    ) in
  decons_callee

let lib_to_sevpa lib actions =
  let llvm_mod = lib.modul in

  (* key_instrs: policy instructions and their padding. *)
  let key_instrs =
    (* pol_instrs: instructions corresponding to policy actions. *)
    let pol_instrs =
      String_pairs.fold
        (fun (func_nm, instr_str) instrs ->
          (match Llvm.lookup_function func_nm llvm_mod with
              Some(act_func) ->
                Llvm.fold_left_blocks
                  (fun instrs blk ->
                    Llvm.fold_left_instrs
                      (fun instrs instr ->
                        if Llvm.print_value instr = instr_str then
                          Llvm_values.add instr instrs
                        else instrs
                      )
                      instrs
                      blk
                  )
                  instrs
                  act_func
            | None -> failwith "action function not found"
          )
        )
        actions
        Llvm_values.empty in
    let pad_instrs = pad_prog llvm_mod pol_instrs in
    Llvm_values.union pol_instrs pad_instrs in

  (* main: the main function. *)
  let main = 
    (match Llvm.lookup_function "main" llvm_mod with
        Some(main) -> main
      | None -> failwith "Llvm_prog: expected main function, none found"
    ) in

  (* non_targets: functions not to be used as call targets. *)
  let non_targets = 
    List.fold_left
      (fun non_targets non_targ_nm ->
        (match Llvm.lookup_function non_targ_nm llvm_mod with
            Some(fn) -> Llvm_sevpa.Calls.add fn non_targets
          | None -> non_targets
        )
      )
      Llvm_sevpa.Calls.empty 
      non_target_nms in

  (* prog_calls: the call actions of the program SEVPA. *)
  let prog_calls = 
    let prog_funcs = 
      Llvm_values.fold
        (fun instr ->
          Llvm_sevpa.Calls.add (Llvm.block_parent (Llvm.instr_parent instr))
        )
        key_instrs 
        Llvm_sevpa.Calls.empty in
    Llvm_sevpa.Calls.remove main prog_funcs in

  (* model_calls: all functions that a call instruction may go to
   * under our model. *)
  let model_calls call_instr = 
    (* If the call is a direct: *)
    (match Llvm.call_get_called_function call_instr with
        Some(callee) -> Llvm_sevpa.Calls.singleton callee
      | None -> 
        taken_call_targets prog_calls (Llvm.call_get_indir_callee call_instr)
    ) in

  (* tc_call_graph: the transitive closure of the call graph, blocking on 
   * functions that contain policy internals. *)
  let tc_call_graph =
    (* llvm_funcs: the set of all LLVM functions. *)
    let llvm_funcs =
      Llvm.fold_left_functions
        (fun llvm_funcs fn -> Llvm_sevpa.Calls.add fn llvm_funcs)
        Llvm_sevpa.Calls.empty
        llvm_mod in

    (* llvm_subs: all LLVM functions that aren't main. *)
    let llvm_subs = Llvm_sevpa.Calls.remove main llvm_funcs in

    (* call_graph: the call graph, represented as a set of
     * caller-callee pairs.  *)
    let call_graph = 
      Llvm.fold_left_functions
        (fun cg func ->
          (* For each basic block in the function: *)
          let callees =
            (* If the function is defined: *)
            if is_def_func func then
              (* Then collect the calls from all blocks. *)
              Llvm.fold_left_blocks
                (fun callees blk ->
                  (* For each instruction in the basic block: *)
                  Llvm.fold_left_instrs
                    (fun callees instr ->
                      (* If the instruction is a call: *)
                      if is_call instr then model_calls instr
                      else callees
                    )
                    callees
                    blk
                )
                Llvm_values.empty
                func
            (* If the function is a library: *)
            else if is_lib func then Llvm_values.empty
            else llvm_subs in

          (* calls: calls from the current function. *)
          Llvm_values.fold
            (fun callee -> Llvm_value_pairs.add (func, callee)) callees cg
        )
        Llvm_value_pairs.empty
        llvm_mod in

    (* to_empty: a map from each program call to the empty set of
     * functions. *)
    let to_empty =
      Llvm_values.fold
        (fun fn -> Llvm_value_map.add fn Llvm_values.empty)
        llvm_funcs
        Llvm_value_map.empty in

    (* wk_upd: weakly update a map over LLVM values. *)
    let wk_upd k v m = 
      Llvm_value_map.add k (Llvm_values.add v (Llvm_value_map.find k m)) m in

    (* callee_graph: the inversion of the call graph. *)
    let callee_graph = 
      let callee_map = 
        Llvm_value_pairs.fold
          (fun (caller, callee) -> wk_upd callee caller) call_graph to_empty in
      (fun caller -> Llvm_value_map.find caller callee_map) in

    (* cons_tc: construct the transitive closure of the call graph
     * from a workset. *)
    let rec cons_tc tc ws =
      if Llvm_value_pairs.is_empty ws then tc
      else 
        let ((caller, callee) as chosen) = Llvm_value_pairs.choose ws in
        let preds = Llvm_values.diff (callee_graph caller) prog_calls in
        let composed =
          Llvm_values.fold
            (fun pred -> Llvm_value_pairs.add (pred, callee)) 
            preds
            Llvm_value_pairs.empty in
        cons_tc 
          (Llvm_value_pairs.add chosen tc) 
          (Llvm_value_pairs.union
             (Llvm_value_pairs.remove chosen ws)
             (Llvm_value_pairs.diff composed tc)) in

    (* Index the TC of the callgraph. *)
    let tc_map =
      Llvm_value_pairs.fold
        (fun (caller, callee) -> wk_upd caller callee)
        (cons_tc Llvm_value_pairs.empty call_graph)
        to_empty in
    (fun call -> Llvm_value_map.find call tc_map) in

  (* pol_calls: function from each instruction to the set of functions
   * that it transitively calls that hold policy instructions. *)
  let pol_calls call_instr = 
    let tcallees =
      let direct_calls = model_calls call_instr in
      Llvm_sevpa.Calls.fold
        (fun fn -> Llvm_sevpa.Calls.union (tc_call_graph fn))
        direct_calls
        direct_calls in
    Llvm_sevpa.Calls.inter tcallees prog_calls in

  (* is_model_instr: decide if an instruction is relevant to the
   * policy. *)
  let is_model_instr instr = Llvm_values.mem instr key_instrs in

  (* is_policy_call: decide if a call goes directly to a policy
   * function. *)
  let is_policy_call = is_p_call (fun f -> Llvm_values.mem f prog_calls) in

  (* instr_to_state: bless an instruction into a state that it
   * marks. *)
  let instr_state instr = 
    if is_model_instr instr || is_term instr then Some(Instr(instr))
    else if is_policy_call instr then Some(Call_pre(instr))
    else if is_call instr then
      if Llvm_sevpa.Calls.is_empty (pol_calls instr) then None
      else Some(Indir_call(instr)) 
    else None in

  (* keeper_succ: the successor keeper instruction. *)
  let rec keeper_succ instr = 
    (match instr_state instr with
        Some(q) ->
          (match q with
              Instr(i) | Call_pre(i) | Indir_call(i) -> i
          )
      | None -> keeper_succ (intra_block_succ instr)
    ) in

  (* proper_keeper_succ: find a keeper instruction that is the proper
   * successor of a given instruction. *)
  let proper_keeper_succ instr = keeper_succ (intra_block_succ instr) in

  (* llvm_func_to_module: takes an LLVM function as input. Constructs a
   * VPA module for the function. *)
  let llvm_func_to_module func =
    (* states: the set of states in the function module. *)
    let states = 
      let core_blks =
        (* succ_blks: the set of all blocks that are control-flow
         * successors of some other block. *)
        let entry_blk = Llvm.entry_block func in
        let succ_blks =
          Llvm.fold_left_blocks
            (fun succs blk ->
              let cur_succs =
                (match Llvm.block_terminator blk with
                    Some(term) ->
                      let rec fold_succs i =
                        if i = Llvm.get_num_successors term then 
                          Llvm_blocks.empty
                        else 
                          Llvm_blocks.add 
                            (Llvm.get_successor term i) (fold_succs (i + 1)) in
                      fold_succs 0
                  | None -> Llvm_blocks.empty
                ) in
              Llvm_blocks.union succs cur_succs
            )
            Llvm_blocks.empty
            func in
        Llvm_blocks.add entry_blk succ_blks in

      (* For each basic block: *)
      Llvm_blocks.fold
        (fun blk ->
          (* For each instruction in the basic block: *)
          let blk_states =
            Llvm.fold_left_instrs
              (fun states instr ->
                (match instr_state instr with
                    Some(state) ->
                      let states' = 
                        Llvm_states.add (Inst_state(state)) states in
                      (match state with
                          Call_pre(i) -> 
                            Llvm_states.add (Call_post(instr)) states'
                        | _ -> states'
                      )
                  | None -> states
                )
              )
              Llvm_states.empty
              blk in
          Llvm_states.union blk_states
        )
        core_blks
        Llvm_states.empty in

    (* call_en: the call enabled map. *)
    let call_en =
      Llvm_sevpa.States.fold
        (fun state ->
          let state_calls =
            (match state with
                Inst_state(Call_pre(call)) | Inst_state(Indir_call(call)) -> 
                  pol_calls call
              | _ -> Llvm_sevpa.Calls.empty
            ) in
          Llvm_sevpa.State_map.add state state_calls
        )
        states
        Llvm_sevpa.State_map.empty in

    (* int_en: map from each state to its internal enabled set. *)
    let int_en =
      Llvm_states.fold
        (fun state ->
          let int_en_set =
            (match state with
                Inst_state(Instr(instr)) ->
                  (* If the instruction is a block terminator: *)
                  if is_term instr then
                    (* num_succs: number of successor instructions of the
                     * terminator instruction. *)
                    let num_succs = Llvm.get_num_successors instr in

                    (* iter_succs: iterate over the internal successors of the
                     * given block. *)
                    let rec iter_succs tagged indx =
                      if indx < 0 then Llvm_sevpa.Internals.empty
                      else
                        let succ_inst =
                          let succ = Llvm.get_successor instr indx in
                          keeper_succ (block_front succ) in
                        Llvm_sevpa.Internals.add
                          (tagged, succ_inst) (iter_succs tagged (indx - 1)) in

                    (* is_indir_br: is instr an indirect branch. *)
                    let is_indir_br = 
                      Llvm.instr_opcode instr = Llvm.Opcode.IndirectBr in
                    if Llvm.instr_opcode instr = Llvm.Opcode.Br then
                      iter_succs (Int_branch(instr)) (num_succs - 1)
                    else if is_indir_br then
                      iter_succs (Int_indirect_branch(instr)) (num_succs - 1)
                    else if Llvm.instr_opcode instr = Llvm.Opcode.Invoke then
                      let invoke_callee = invoke_get_called_function instr in
                      (match invoke_callee with
                          Some(_) -> Llvm_sevpa.Internals.empty
                        | None ->
                          let succ_inst = intra_block_succ instr in
                          Llvm_sevpa.Internals.singleton
                            (Int_intra(instr), succ_inst)
                      )
                    else if Llvm.instr_opcode instr = Llvm.Opcode.Switch then
                      iter_succs (Int_switch(instr)) (num_succs - 1)
                    else Llvm_sevpa.Internals.empty
                    (* Otherwise, if the instruction is a model instruction: *)
                    else if is_model_instr instr then
                      let succ_inst = proper_keeper_succ instr in
                      Llvm_sevpa.Internals.singleton
                        (Int_intra(instr), succ_inst)
                    (* Otherwise, (the instruction is a library with Unreachable
                     * successor). *)
                    else Llvm_sevpa.Internals.empty
              | Call_post(call) -> 
                Llvm_sevpa.Internals.singleton
                  (Int_call(call), proper_keeper_succ call)
              | Inst_state(Call_pre(call)) -> Llvm_sevpa.Internals.empty
              | Inst_state(Indir_call(call)) ->
                Llvm_sevpa.Internals.singleton 
                  (Int_call(call), proper_keeper_succ call)
            ) in
          Llvm_sevpa.State_map.add state int_en_set
        )
        states
        Llvm_sevpa.State_map.empty in

    (* init: the initial state. *)
    let init = 
      let is_opt =
        instr_state (keeper_succ (block_front (Llvm.entry_block func))) in
      (match is_opt with
          Some(is) -> Inst_state(is)
        | None -> failwith "could not find initial state"
      ) in

    (* exits: the exit states of the module are the states
     * corresponding to return instructions. *)
    let exits = 
      Llvm_sevpa.States.filter
        (fun state ->
          (match state with
              Inst_state(Instr(instr)) ->
                let code = Llvm.instr_opcode instr in
                code = Llvm.Opcode.Ret
                || code = Llvm.Opcode.Unwind
                  || code = Llvm.Opcode.Unreachable
            | _ -> false
          )
        )
        states in
    (int_en, call_en, (states, init, exits)) in

  (* Construct the entry module of the program SEVPA. *)
  let (entry_int_en, entry_call_en, ((entry_states, _, _) as prog_entry_mod)) =
    (match Llvm.lookup_function "main" llvm_mod with
        Some(main) -> llvm_func_to_module main
      | None -> failwith "Llvm_prog: expected main function, none found"
    ) in

  (* prog_ints: internal actions of the program SEVPA.
   * 
   * func_mod_map: map to function modules for the program SEVPA.
   *)
  let (prog_int_en_map, prog_call_en_map, func_mod_map) =
    let union_merger =
      (fun state valu_opt_0 valu_opt_1 ->
        (match valu_opt_0 with
            Some(_) -> valu_opt_0
          | _ -> valu_opt_1
        )
      ) in

    Llvm_sevpa.Calls.fold
      (fun func (prog_int_en_map, prog_call_en_map, func_to_mod) ->
        let (func_int_en, func_call_en, func_mod) =
          llvm_func_to_module func in
        (Llvm_sevpa.State_map.merge union_merger prog_int_en_map func_int_en,
         Llvm_sevpa.State_map.merge union_merger prog_call_en_map func_call_en,
         Llvm_value_map.add func func_mod func_to_mod)
      )
      prog_calls
      (entry_int_en, entry_call_en, Llvm_value_map.empty) in

  (* prog_int_en: a function that wraps prog_int_en_map. *)
  let prog_int_en state =
    Llvm_sevpa.State_map.find state prog_int_en_map in

  (* prog_call_en: a function that wraps prog_call_en_map. *)
  let prog_call_en state = Llvm_sevpa.State_map.find state prog_call_en_map in

  (* prog_ints: program internal actions. *)
  let prog_ints =
    Llvm_sevpa.State_map.fold
      (fun state state_ints -> Llvm_sevpa.Internals.union state_ints)
      prog_int_en_map
      Llvm_sevpa.Internals.empty in

  (* Wrap the call module map in a function. *)
  let prog_func_to_mod func = Llvm_value_map.find func func_mod_map in

  (* prog_int_trans: the internal transition function. *)
  let prog_int_trans pre (_, succ) = 
    (match instr_state succ with
        Some(is) -> Inst_state(is)
      | None -> failwith "LLVM_sevpa.int_trans: no successor state found"
    ) in

  (* Construct the return transition function of the program. *)
  let prog_return_trans pre stack_state =
    (match stack_state with
        Inst_state(Call_pre(call)) -> Call_post(call)
      | Inst_state(Indir_call(_)) -> stack_state
      | _ -> failwith "Llvm_prog.return: ill-formed state pair 1"
    ) in

  (* prog_states: the set of all program states. *)
  let prog_states =
    Llvm_value_map.fold
      (fun _ (func_states, _, _) -> Llvm_sevpa.States.union func_states)
      func_mod_map
      entry_states in

  (* Construct the program SEVPA. *)
  let llvm_sevpa =
    { Llvm_sevpa.sevpa_nm = "full_program";
      sevpa_ints = prog_ints;
      sevpa_calls = prog_calls;
      sevpa_states = prog_states;
      sevpa_acc = prog_states;
      sevpa_entry_mod = prog_entry_mod;
      sevpa_call_mod = prog_func_to_mod;
      sevpa_int_enabled = prog_int_en;
      sevpa_call_enabled = prog_call_en;
      sevpa_int_trans = prog_int_trans;
      sevpa_return_trans = prog_return_trans;
    } in

  dbg "pre chk LLVM sevpa is well-formed";
  (* assert (Llvm_sevpa.is_well_formed llvm_sevpa); *)
  dbg "post chk LLVM sevpa is well-formed";
  let key_internals =
    Llvm_sevpa.Internals.filter
      (fun prog_int -> Llvm_values.mem (internal_instr prog_int) key_instrs)
      prog_ints in
  (llvm_sevpa, key_internals)

(* lib_cg: construct the call-graph of an LLVM program module. *)
let lib_cg lib = failwith "lib_cg"
  (* 
  let llvm_prog = lib.modul in

  (* prog_calls: the non-main functions in the LLVM module. *)
  let prog_calls =
    (* all_calls: the set of all calls in the LLVM module. *)
    let all_calls = 
      Llvm.fold_left_functions
        (fun prog_calls func -> Llvm_sevpa.Calls.add func prog_calls)
        Llvm_sevpa.Calls.empty
        llvm_prog in
    Llvm_sevpa.Calls.filter
      (fun func -> call_to_string func = "main") all_calls in

  (* For each function in the program, collect the set of all
   * callees. *)
  let mod_cg =
    Llvm.fold_left_functions
      (fun cg func ->
        (* mod_key: module ID used as key in the callgraph. *)
        let mod_key =
          if Llvm.value_name func = "main" then Entry_mod
          else Call_mod(func) in
        
        (* For each basic block in the function: *)
        let callees =
          (* If the function is a non-lib undefined function, then say
           * that it calls all functions. *)
          if is_undef_non_lib func then prog_calls
          else 
            Llvm.fold_left_blocks
              (fun callees blk ->
                (* For each instruction in the basic block: *)
                Llvm.fold_left_instrs
                  (fun callees instr ->
                    if Llvm.instr_opcode instr = Llvm.Opcode.Call then
                      (* If the stack state is a call instruction, and
                       * the call is to returning function, then return
                       * the instruction after the call. *)
                      let targets =
                        (match Llvm.call_get_called_function instr with
                            Some(callee) -> Llvm_sevpa.Calls.singleton callee
                          | None ->
                            let indir_callee = 
                              Llvm.call_get_indir_callee instr in
                            taken_call_targets indir_callee
                        ) in
                      Llvm_values.union callees targets
                    else callees
                  )
                  callees
                  blk
              )
              Llvm_values.empty
              func in
          Llvm_sevpa.Mod_id_map.add mod_key callees cg
      )
      Llvm_sevpa.Mod_id_map.empty
      llvm_prog in
  
  (* From the call graph over module ID's, construct a call-graph over
   * strings. *)
  let call_nms calls =
    Llvm_sevpa.Calls.fold
      (fun call call_nms -> Strings.add (call_to_string call) call_nms)
      calls
      Strings.empty in
  Llvm_sevpa.Mod_id_map.fold
    (fun modul callees cg ->
      let caller_nm =
        (match modul with
            Entry_mod -> "main"
          | Call_mod(call) -> call_to_string call
        ) in
      String_map.add caller_nm (call_nms callees) cg
    )
    mod_cg
    String_map.empty
  *)

(* is_part_type: decide if a type is partitionable. *)
let rec is_part_type ty =
  (match Llvm.classify_type ty with
       TypeKind.Struct ->
         (* Recursively check that the type of each field is
          * partitionable. *)
         Array.fold_left
           (fun elts_are_part elt_ty ->
              elts_are_part && (is_part_type elt_ty)
           )
           true
           (Llvm.struct_element_types ty)
     | TypeKind.Array | TypeKind.Vector ->
         (* Allow if element type is partitionable, and the size of
          * the array is known statically. *)
         is_part_type (Llvm.element_type ty)
     | TypeKind.Pointer ->
         (* Allow if the element type is character. *)
         let pointed_ty = Llvm.element_type ty in
           (match Llvm.classify_type pointed_ty with
                TypeKind.Integer ->
                  let bitwidth = Llvm.integer_bitwidth pointed_ty in
                  bitwidth = 8
              | TypeKind.Function -> true
              | _ -> false
           )
     | _ -> true
  )

(* TODO: partition this code into a module for points-to analysis. *)
type pts_cell =
    Init of Llvm.llvalue

module Pts_cell =
  struct
    type t = pts_cell
    let compare = compare
  end

module Pts_cells = Set.Make(Pts_cell)

(* initial_cell: return the cell that represents the original cell
 * pointed to by the LLVM value. *)
let initial_cell valu = Init(valu)

(* points_to_info: a structure of points-to information. *)
type points_to_info =
    { aliases: pts_cell -> Pts_cells.t;
      targets: pts_cell -> Pts_cells.t;
    }

(* cons_points_to: takes a program, constructs points-to information
 * for it. *)
let cons_points_to llvm_prog =
  { aliases = (fun _ -> Pts_cells.empty);
    targets = (fun x -> Pts_cells.singleton x);
  }

let part_funcs = 
  [ (* bzip2 functions: *)
    "compress";
    "do_session";
    (* fetchmail: *)
    "gen_send";
    "pop3_getuidl";
    "sdump";
    (* gzip functions: *)
    "unzip";
    "zip";
    (* php functions: *)
    "shim_access";
    "shim_chdir";
    "shim_connect2";
    "shim_getcwd2";
    "shim_open2";
    "shim_stat2";
    (* tar: *)
    "rmt_read__";
    "safer_name_suffix";
    (* wget functions: *)
    "fork_retrieve_from_file";
  ]

let is_fork_func func = List.mem (Llvm.value_name func) part_funcs

(*
let fork_part_funcs llvm_prog = 
  (* For each program function: *)
  Llvm.fold_left_functions
    (fun fork_part_funcs func ->
       let is_fork_func =
         let points_to = cons_points_to llvm_prog in
           
         (* all_params_clear: all parameters of the function are clear
          * by the time the function exits. *)
         let all_params_clear =
           Llvm.fold_left_params
             (fun all_params_clear param ->
                if all_params_clear then
                  (* param_cell: the initial memory cell pointed to
                   * by the parameter. *)
                  let param_cell = initial_cell param in

                  (* param_not_updated: the parameter has not been
                   * updated. *)
                  let param_not_updated = 
                    (Pts_cells.cardinal (points_to.targets param_cell)) = 1 in

                  (* all_aliases_clean: each alias of the pointer is
                   * clean by the end of the function. *)
                  let all_aliases_clean =
                    Pts_cells.for_all
                      (fun alias ->
                         (* Determine if any dirtying of the pointer
                          * reaches the return of the function without
                          * hitting a clear. *)
                         (* TODO: pick up from here. *)
                         true
                      )
                      (points_to.aliases param_cell) in
                    param_not_updated && all_aliases_clean
                else false
             )
             true
             func in

         (* all_globs_clear: all globals mutated by the function are
          * clear by the time the function exits. *)
         let all_globs_clear =
           Llvm.fold_left_globals
             (fun all_globs_clear glob ->
                if all_globs_clear then
                  (* TODO: define this correctly. *)
                  true
                else false
             )
             true
             llvm_prog in
           
         (* ret_is_simple: the return type of the function is
          * simple. *)
         let ret_is_simple = 
           is_part_type (Llvm.return_type (Llvm.type_of func)) in
           all_params_clear && all_globs_clear && ret_is_simple in
         if is_fork_func then Llvm_values.add func fork_part_funcs
         else fork_part_funcs
    )
    Llvm_values.empty
    llvm_prog
*)

let rpc_part_funcs llvm_prog trans_callees =
  let calls =
    Llvm_sevpa.Call_trans_map.fold
      (fun call _ calls -> Llvm_sevpa.Calls.add call calls)
      trans_callees
      Llvm_sevpa.Calls.empty in

  (* part_param_funcs: the set of all functions that have partitionable
   * parameters. *)
  let part_param_funcs =
    Llvm_values.filter
      (fun func -> 
        let param_tys =
          let func_ty = Llvm.element_type (Llvm.type_of func) in
          Llvm.param_types func_ty in
        Array.fold_left
          (fun params_are_part param_ty -> 
            params_are_part && (is_part_type param_ty)
          )
          true
          param_tys
      )
      calls in

  (* part_ret_funcs: the set of all functions that have partitionable
   * return values. *)
  let part_ret_funcs =
    Llvm_values.filter
      (fun func -> 
        is_part_type (Llvm.return_type (Llvm.element_type (Llvm.type_of func)))
      )
      calls in

  (* Collect the set of all functions that have partitionable global
   * values. *)
  let part_glob_funcs =
    (* non_part_globs: the non-partitionable globals. *)
    let non_part_globs = 
      (* For each global: *)
      Llvm.fold_left_globals
        (fun non_part_globs glob ->
           (* If the type of the global element is partitionable, then
            * don't add the global to the set. *)
           let glob_elt_is_part =
             is_part_type (Llvm.element_type (Llvm.type_of glob)) in
             if glob_elt_is_part then non_part_globs
             else Llvm_values.add glob non_part_globs
        )
        Llvm_values.empty
        llvm_prog in

    (* non_part_glob_funcs: functions that use some non-partitionable
     * global. *)
    let non_part_glob_funcs =
      (* For each non-partitionable global: *)
      Llvm_values.fold
        (fun non_part_glob non_part_glob_funcs ->
           (* For each use of the non-part global: *)
           let cur_non_part_funcs =
             Llvm.fold_left_uses
               (fun non_part_glob_funcs use ->
                  let user = Llvm.user use in
                    (match Llvm.classify_value user with
                         ValueKind.Instruction(_) ->
                           (* Add the function containing the instruction to
                            * the set of non-global-partitionable functions. *)
                           Llvm_values.add
                             (Llvm.block_parent (Llvm.instr_parent user))
                             non_part_glob_funcs
                       | _ -> non_part_glob_funcs
                    )
               )
               Llvm_values.empty
               non_part_glob in
           Llvm_values.union non_part_glob_funcs cur_non_part_funcs
        )
        non_part_globs
        Llvm_values.empty in
    Llvm_values.diff calls non_part_glob_funcs in
  (* For each program function: *)
  Llvm_values.filter
    (fun func ->
      (* Keep the function if each of its transitive callees has
       * partitionable globals. *)
      Llvm_values.subset 
        (Llvm_sevpa.Call_trans_map.find func trans_callees) part_glob_funcs
    )
    (Llvm_values.inter
       part_param_funcs (Llvm_values.inter part_ret_funcs part_glob_funcs))


let func_front func = block_front (Llvm.entry_block func)

(* Generic iterator for instrumenting code. *)
let instr_acts act_instrs instr_place instr_arg instr_func =
  Llvm_values.iter
    (fun act_instr ->
      let pos_instr = instr_place act_instr in
      let args = instr_arg act_instr in
      let bldr = 
        let llvm_ctx = Llvm.type_context (Llvm.type_of act_instr) in
        Llvm.builder_before llvm_ctx pos_instr in
      let _ = Llvm.build_call instr_func args "" bldr in
      ()
    )
    act_instrs


(* gen_index: takes as input: 
 * 
 * -a set of internal actions
 * 
 * Constructs an index of each relevant program instruction. *)
let gen_index internals =
  (* insts: all instructions that are used to construct internal
   * actions. *)
  let insts =
    Llvm_sevpa.Internals.fold
      (fun internal insts -> 
        Llvm_values.add
          (internal_instr internal) 
          (Llvm_values.add (internal_succ internal) insts)
      )
      internals
      Llvm_values.empty in

  (* inst_map: a map index each program instruction. *)
  let inst_map =
    Llvm_values.fold
      (fun inst inst_map ->
        Llvm_value_map.add inst (Llvm_value_map.cardinal inst_map) inst_map
      )
      insts
      Llvm_value_map.empty in
  (fun inst -> Llvm_value_map.find inst inst_map)


(* gen_llvm_instr_store: takes as input:
 * 
 * -the set of internal actions
 * 
 * -an index of instructions
 * 
 * -the set of modules
 * 
 * -an index of modules
 * 
 * Side effects: generates an instrumentation store named llvm_instr_store.bc.
 *)
let gen_llvm_instr_store
    internals internal_index inst_pure_index mods mod_index prog_nm =
  (* instr_store: an LLVM module that holds instrumentation functions
   * and global tables. *)
  let instr_store =
    Llvm.create_module (Llvm.create_context ()) "llvm_instr_store" in
  Llvm.set_target_triple "x86_64-unknown-freebsd9.0" instr_store;

  (* store_ctx: the context of the instrumentation module. *)
  let store_ctx = Llvm.module_context instr_store in

  (* int_type: an LLVM integer type. *)
  let int_type = Llvm.i32_type store_ctx in
  let inst_index inst = Llvm.const_int int_type (inst_pure_index inst) in

  (* num_internals: the number of internal actions. *)
  let num_internals = Llvm_sevpa.Internals.cardinal internals in

  (* act_arr: an array of action instructions. *)
  let act_arr = Array.make num_internals (Llvm.const_null int_type) in
  Llvm_sevpa.Internals.iter
    (fun internal ->
      let action_inst = internal_instr internal in
      Array.set act_arr (internal_index internal) (inst_index action_inst)
    )
    internals;
  let _ = 
    Llvm.define_global
      "int_acts" (Llvm.const_array int_type act_arr) instr_store in

  (* succ_arr: an array of index of successor actions. *)
  let succ_arr = Array.make num_internals (Llvm.const_null int_type) in
  Llvm_sevpa.Internals.iter
    (fun internal ->
      let succ_inst = internal_succ internal in
      Array.set succ_arr (internal_index internal) (inst_index succ_inst)
    )
    internals;
  let _ =
    Llvm.define_global
      "int_succs" (Llvm.const_array int_type succ_arr) instr_store in
  
  (* void_ptr, null_ptr: used for various definitions. *)
  let void_ptr = Llvm.pointer_type (Llvm.i8_type store_ctx) in
  let null_ptr = Llvm.const_null void_ptr in
  let stub_type = Llvm.function_type (Llvm.void_type store_ctx) [| |] in

  (* Generate the array of strategy calls. *)
  (* TODO: fix this to store an external link to each function in the
   * global array. *)
  let _ =
    let num_calls = Llvm_sevpa.Mod_ids.cardinal mods in
    let strat_calls = Array.make num_calls null_ptr in
    Llvm_sevpa.Mod_ids.iter
      (fun modul ->
        let func_ptr =
          (match modul with
              Entry_mod -> null_ptr
            | Call_mod(call) -> 
              let stub_func =
                Llvm.declare_function
                  (call_to_string call) stub_type instr_store in
              Llvm.const_bitcast stub_func void_ptr
          ) in
        let index = mod_index modul in
        Array.set strat_calls index func_ptr
      )
      mods;
    Llvm.define_global
      "strat_calls_arr" (Llvm.const_array void_ptr strat_calls) instr_store in

  (* num_calls: the number of calls. *)
  let num_calls = Llvm_sevpa.Mod_ids.cardinal mods in

  (* Generate the array of marshallers. *)
  let gen_stub_funcs prefix =
    (* marsh_arr: array holding pointers to marshallers. *)
    let stub_arr = Array.make num_calls null_ptr in

    (* For each module, set an entry in the array of marshallers. *)
    Llvm_sevpa.Mod_ids.iter
      (fun modul ->
        (match modul with
            Entry_mod -> ()
          | Call_mod(call) ->
            let work_index = mod_index modul in
            let stub_func =
              Llvm.declare_function
                (prefix ^ "_" ^ (call_to_string call))
                stub_type
                instr_store in
            Array.set
              stub_arr work_index (Llvm.const_bitcast stub_func void_ptr)
        )
      )
      mods;
    let _ =
      Llvm.define_global
        (prefix ^ "_arr") (Llvm.const_array void_ptr stub_arr) instr_store in
    () in
  
  (* Generate an array of marshallers. *)
  gen_stub_funcs "marshall";
  Llvm_analysis.assert_valid_module instr_store;

  (* Generate the array of unmarshallers. *)
  gen_stub_funcs "unmarshall";
  Llvm_analysis.assert_valid_module instr_store;

  (* Write the instrumentation store to disk. *)
  let bc_out = prog_nm ^ ".llvm_instr_store.bc" in
  let write_succ = Llvm_bitwriter.write_bitcode_file instr_store bc_out in
  if write_succ then ()
  else failwith ("failed to write bitcode to " ^ bc_out)

let instr_lib_internals internals inst_index lib =
  let int_type = Llvm.i32_type (Llvm.module_context lib.modul) in

  (* Instrument the program action successor instructions. *)
  let int_to_void =
    Llvm.function_type
      (Llvm.void_type (Llvm.module_context lib.modul)) [| int_type |] in

  (* instr_arg: construct a singleton array containing the index of an
   * instruction. *)
  let instr_arg instr = [| inst_index instr |] in

  (* act_succs: all successor instructions in the program. *)
  let act_succs =
    Llvm_sevpa.Internals.fold
      (fun internal -> Llvm_values.add (internal_succ internal))
      internals
      Llvm_values.empty in
  instr_acts
    act_succs
    (fun x -> x)
    instr_arg
    (Llvm.declare_function "wg_read_succ" int_to_void lib.modul);

  (* Instrument the program internal instructions. *)
  let act_instrs =
    Llvm_sevpa.Internals.fold
      (fun att_int act_instrs -> 
        Llvm_values.add (internal_instr att_int) act_instrs
      )
      internals
      Llvm_values.empty in
  instr_acts
    act_instrs
    (fun x -> x)
    instr_arg
    (Llvm.declare_function "wg_read_action" int_to_void lib.modul);

  (* At this point, the LLVM module should be consistent. *)
  Llvm_analysis.assert_valid_module lib.modul


let get_callee_value instr =
  (match Llvm.call_get_called_function instr with
      Some(callee) -> callee
    | None -> Llvm.call_get_indir_callee instr
  )

let mod_funcs mods =
  Llvm_sevpa.Mod_ids.fold
    (fun mod_id funcs ->
      (match mod_id with
          Entry_mod -> funcs
        | Call_mod(call) -> Llvm_values.add call funcs
      )
    )
    mods
    Llvm_values.empty

(* TODO: optimize this to only place instrumentation after an indirect
 * call if some one if the calls has its address taken and the callee
 * is a function translator. *)
let call_instrs lib calls =
  let call_nms =
    Llvm_values.fold
      (fun call -> Strings.add (Llvm.value_name call))
      calls
      Strings.empty in

  (* For each program function: *)
  Llvm.fold_left_functions
    (fun instrs func ->
      (* For each block in the function: *)
      Llvm.fold_left_blocks
        (fun instrs block ->
          (* For each instruction in the block: *)
          Llvm.fold_left_instrs
            (fun instrs instr ->
              if Llvm.instr_opcode instr = Llvm.Opcode.Call then
                let may_call_strat =
                  (match Llvm.call_get_called_function instr with
                      Some(callee) -> 
                        Strings.mem (Llvm.value_name callee) call_nms
                    | None -> 
                      let callee = Llvm.call_get_indir_callee instr in
                      (not 
                         (Llvm_sevpa.Calls.is_empty 
                            (Llvm_sevpa.Calls.inter 
                               (taken_call_targets calls callee)
                               calls)))
                      && 
                        (* HACK: *)
                        (not 
                           (Libext.substr "trans_fn" (Llvm.value_name callee)))
                  ) in
                if may_call_strat then Llvm_values.add instr instrs
                else instrs
              else instrs
            )
            instrs
            block
        )
        instrs
        func
    )
    Llvm_values.empty
    lib.modul

let instr_lib_calls mods lib_mods mod_index lib =
  let lib_ctx = Llvm.module_context lib.modul in
  let int_ty = Llvm.i32_type lib_ctx in

  (* entry_instrs: the set of entry instructions of functions.
   * 
   * entry_index: map every entry instruction of a module to its
   * transition table index. *)
  let (entry_instrs, entry_index) =
    let entry_index_map =
      Llvm_sevpa.Mod_ids.fold
        (fun modul entry_index ->
          let func =
            (match modul with
                Entry_mod ->
                  (match Llvm.lookup_function "main" lib.modul with
                      Some(main_func) -> main_func
                    | None -> 
                      failwith
                        ("Llvm_prog.instr_lib_calls expected main function, "
                         ^ "none found")
                  )
              | Call_mod(call) -> call_to_llvm_func call
            ) in
          Llvm_value_map.add 
            (func_front func)
            (mod_index modul)
            entry_index
        )
        lib_mods
        Llvm_value_map.empty in
    let entry_instrs =
      Llvm_value_map.fold
        (fun instr _ entry_instrs -> Llvm_values.add instr entry_instrs)
        entry_index_map
        Llvm_values.empty in
    let entry_index instr = Llvm_value_map.find instr entry_index_map in
    (entry_instrs, entry_index) in

  (* Instrument the initial instruction of each function. *)
  let int_to_void =
    Llvm.function_type
      (Llvm.void_type (Llvm.module_context lib.modul)) [| int_ty |] in
  instr_acts
    entry_instrs
    (fun x -> x)
    (fun instr -> [| entry_index instr |])
    (Llvm.declare_function "wg_read_call" int_to_void lib.modul);

  (* trans_func_glob: a global pointing to a function that may
   * translate a callee to its marshaller. *)
  let void_ptr =
    Llvm.pointer_type (Llvm.i8_type (Llvm.module_context lib.modul)) in
  let trans_func_glob =
    let ptr_vp_to_vp =
      Llvm.pointer_type (Llvm.function_type void_ptr [| void_ptr |]) in
    Llvm.declare_global ptr_vp_to_vp "trans_func" lib.modul in
  Llvm_values.iter
    (fun instr ->
      (* Apply trans_func to the callee. *)
      let bldr = Llvm.builder_before (Llvm.module_context lib.modul) instr in
      let org_callee = get_callee_value instr in
      (* If the callee is something whose address can be taken (i.e.,
       * not assembly), then translate it. *)
      (match Llvm.classify_value org_callee with
          ValueKind.InlineAsm -> ()
        | _ ->
          (* Replace the old callee with a new one that calls the
           * updated callee. *)
          let callee' =
            let trap_callee = 
              let trans_func =
                Llvm.build_load trans_func_glob "trans_fn" bldr in
              let void_callee = 
                Llvm.build_bitcast org_callee void_ptr "callee_cast" bldr in
              Llvm.build_call trans_func [| void_callee |] "wrapped" bldr in
            Llvm.build_bitcast
              trap_callee (Llvm.type_of org_callee) "test" bldr in
          Llvm.set_called_function instr callee'
      )
    )
    (call_instrs lib (mod_funcs mods));
  Llvm_analysis.assert_valid_module lib.modul
      
let instr_lib_returns mods lib =
  let lib_ctx = Llvm.module_context lib.modul in
  let ret_instrs = call_instrs lib (mod_funcs mods) in
  let void_ptr =
    Llvm.pointer_type (Llvm.i8_type (Llvm.module_context lib.modul)) in
  let null_ptr = Llvm.const_null void_ptr in

  (* Instrument a call at each return point. *)
  instr_acts
    ret_instrs
    intra_block_succ
    (fun instr ->
      let cast =
        let callee = get_callee_value instr in
        (match Llvm.classify_value callee with
            ValueKind.InlineAsm -> null_ptr
          | _ ->
            let bldr = Llvm.builder_before lib_ctx (intra_block_succ instr) in
            Llvm.build_bitcast
              callee
              void_ptr
              ("cast_call_" ^ (string_of_int (Llvm.get_addr instr)))
              bldr
        ) in
      [| cast |]
    ) 
    (let void_ptr_to_void =
       Llvm.function_type (Llvm.void_type lib_ctx) [| void_ptr |] in
     Llvm.declare_function "wg_read_ret" void_ptr_to_void lib.modul);
  Llvm_analysis.assert_valid_module lib.modul

let cpy_funcs lib = 
  let lib_ctx = Llvm.module_context lib.modul in
  (* void_ptr: in LLVM, a void* is really a byte pointer. *)
  let void_ptr =
    Llvm.pointer_type (Llvm.i8_type (Llvm.module_context lib.modul)) in
  let str_ty = void_ptr in 

  (* val_to_void: a function from an LLVM type to a program function
   * that copies values from the parameter to a void*. *)
  let val_to_void val_ty =
    let cast_nm = Llvm.string_of_lltype val_ty ^ "_to_voidp" in
    (match Llvm.lookup_global cast_nm lib.modul with
        Some(fn) -> fn
      | None ->
        if val_ty = str_ty then 
          Llvm.declare_function
            cast_nm
            (Llvm.function_type
               void_ptr
               [| Llvm.pointer_type str_ty |])
            lib.modul
        else 
          (* caster: the casting function. *)
          let caster =
            Llvm.define_function
              ((Llvm.string_of_lltype val_ty) ^ "_to_voidp")
              (Llvm.function_type void_ptr [| Llvm.pointer_type val_ty |])
              lib.modul in

          (* Build a return. *)
          let bldr = Llvm.builder_at_end lib_ctx (Llvm.entry_block caster) in
          let bc = 
            Llvm.build_bitcast (Llvm.param caster 0) void_ptr "cast" bldr in
          let _ = Llvm.build_ret bc bldr in
          caster
    ) in

  (* void_to_val: a function from each LLVM type to a function that
   * marshalls from void pointers to value pointers. *)
  let void_to_val val_ty =
    let loader_nm = "voidpp_to_" ^ (Llvm.string_of_lltype val_ty) in
    (match Llvm.lookup_function loader_nm lib.modul with
        Some(fn) -> fn
      | None ->
        if val_ty = str_ty then
          Llvm.declare_function
            loader_nm
            (Llvm.function_type
               str_ty
               [| void_ptr |])
            lib.modul
        else
          (* loader: loads a value from a pointer. *)
          let loader =
            Llvm.define_function
              loader_nm
              (Llvm.function_type val_ty [| void_ptr |])
              lib.modul in

          let bldr = Llvm.builder_at_end lib_ctx (Llvm.entry_block loader) in

          (* ty_ptr: pointer with the right type. *)
          let ty_ptr = 
            Llvm.build_bitcast
              (Llvm.param loader 0) (Llvm.pointer_type val_ty) "cast" bldr in

          (* Build a load from the input parameter. *)
          let v = Llvm.build_load ty_ptr "rv" bldr in

          (* Build a return of the loaded value. *)
          let _ = Llvm.build_ret v bldr in
          loader
    ) in

    (* let tab =  *)
    (*   [ (bool_ty, *)
    (*      Llvm.declare_function *)
    (*        "voidpp_to_bool" *)
    (*        (Llvm.function_type *)
    (*           bool_ty *)
    (*           [| void_ptr |]) *)
    (*        lib.modul); *)
    (*     (int_ty, *)
    (*      Llvm.declare_function *)
    (*        "voidpp_to_int" *)
    (*        (Llvm.function_type *)
    (*           int_ty *)
    (*           [| void_ptr |]) *)
    (*        lib.modul); *)
    (*     (long_ty, *)
    (*      Llvm.declare_function *)
    (*        "voidpp_to_long" *)
    (*        (Llvm.function_type *)
    (*           long_ty *)
    (*           [| void_ptr |]) *)
    (*        lib.modul); *)
    (*     (str_ty, *)
    (*   ] in *)

  (* val_to_size val_ty: LLVM function from a value of type val_ty to
   * the size val_ty. *)
  let size_ty = Llvm.i64_type lib_ctx in
  let val_to_size val_ty = 
    let sizer_nm = (Llvm.string_of_lltype val_ty) ^ "_size" in
    (match Llvm.lookup_function sizer_nm lib.modul with
        Some(fn) -> fn
      | None -> 
        if val_ty = str_ty then
          Llvm.declare_function
            sizer_nm
            (Llvm.function_type
               size_ty
               [| str_ty |])
            lib.modul
        else 
          (* sizer: the sizeof function. *)
          let sizer =
            Llvm.define_function
              sizer_nm
              (Llvm.function_type size_ty [| val_ty |])
              lib.modul in

          (* Build a return. *)
          Llvm.build_ret
            (Llvm.size_of val_ty)
            (Llvm.builder_at_end lib_ctx (Llvm.entry_block sizer));
          sizer
    ) in

    (* let tab =  *)
    (*   [ (bool_ty, *)
    (*      Llvm.declare_function *)
    (*        "bool_size" *)
    (*        (Llvm.function_type *)
    (*           size_ty *)
    (*           [| bool_ty |]) *)
    (*        lib.modul); *)
    (*     (int_ty, *)
    (*      Llvm.declare_function *)
    (*        "int_size" *)
    (*        (Llvm.function_type *)
    (*           size_ty *)
    (*           [| int_ty |]) *)
    (*        lib.modul); *)
    (*     (long_ty, *)
    (*      Llvm.declare_function *)
    (*        "long_size" *)
    (*        (Llvm.function_type *)
    (*           size_ty *)
    (*           [| long_ty |]) *)
    (*        lib.modul); *)
    (*   ] in *)
  (val_to_void, void_to_val, val_to_size)


(* is_part_func: decide if a program function can be partitoned. *)
let is_part_func prog_fn = List.mem (Llvm.value_name prog_fn) part_funcs

(* gen_stub: takes an LLVM function, inserts a well-typed return at
 * the end of the function. *)
let gen_stub llvm_fn =
  let bldr =
    Llvm.builder_at_end
      (Llvm.module_context (Llvm.global_parent llvm_fn))
      (Llvm.entry_block llvm_fn) in

  let ret_type = Llvm.return_type (Llvm.element_type (Llvm.type_of llvm_fn)) in
  let prog_void = Llvm.void_type (Llvm.type_context ret_type) in
  if ret_type = prog_void then
    let _ = Llvm.build_ret_void bldr in ()
  else
    let _ = Llvm.build_ret (Llvm.const_null ret_type) bldr in
    ()

(* instr_marshes: generate marshallers. *)
let instr_marshes mods mod_index lib =
  let (val_to_void, void_to_val, val_to_size) = cpy_funcs lib in
  let lib_ctx = Llvm.module_context lib.modul in
  let int_ty = Llvm.i32_type lib_ctx in

  let void_ptr =
    Llvm.pointer_type (Llvm.i8_type (Llvm.module_context lib.modul)) in
  let size_ty = Llvm.i64_type lib_ctx in
  let iovec_ty = 
    (match Llvm.type_by_name lib.modul "struct.iovec" with
        Some(iovec_ty) -> iovec_ty
      | None -> failwith "no iovec struct type defined"
    ) in
  let iovec_ptr = Llvm.pointer_type iovec_ty in
  let setup_ptr =
    let setup_ty =
      Llvm.pointer_type
        (Llvm.function_type iovec_ptr [| int_ty; iovec_ptr; int_ty |]) in
    Llvm.declare_global setup_ty "setup_func" lib.modul in

  Llvm_sevpa.Mod_ids.iter
    (fun modul ->
      let llvm_index = mod_index modul in 
      (match modul with
          Entry_mod -> ()
        | Call_mod(call) ->
          let work_func = call in
          let work_type = Llvm.element_type (Llvm.type_of work_func) in
          
          (* marsh_func: the marshaller function. *)
          let marsh_func = 
            Llvm.define_function
              ("marshall_" ^ (call_to_string call))
              work_type
              lib.modul in
          Llvm.set_function_call_conv
            (Llvm.function_call_conv work_func) marsh_func;

          (* If the work function is partitonable, then define a
           * marshalling function. *)
          if is_part_func work_func then
            let bldr =
              Llvm.builder_at_end lib_ctx (Llvm.entry_block marsh_func) in

            (* param_slots: stack space to store arguments. *)
            let param_slots =
              Llvm.fold_left_params
                (fun param_slots param ->
                  let param_slot =
                    Llvm.build_alloca
                      (Llvm.type_of param)
                      ("arg_slot_"
                       ^ (string_of_int (Array.length param_slots)))
                      bldr in
                  Array.append param_slots [| param_slot |]
                )
                [| |]
                marsh_func in
            
            (* args: an argument iovec* on the stack. *)
            let args =
              Llvm.build_array_alloca
                iovec_ty
                (Llvm.const_int
                   int_ty (Array.length (Llvm.params work_func)))
                "arg_iovec"
                bldr in

            (* For each parameter p, store p in its corresponding iovec. *)
            let _ =
              Llvm.fold_left_params
                (fun param_indx param ->
                  (* Store the parameter in the parameter slot. *)
                  let param_slot = Array.get param_slots param_indx in
                  let _ = Llvm.build_store param param_slot bldr in

                  (* Store the parameter slot in the iovec buffer.
                   * buf_ptr: pointer to the iovec buffer. *)
                  let param_valu = Llvm.const_int int_ty param_indx in
                  let index_string = string_of_int param_indx in
                  let buf_ptr =
                    Llvm.build_gep
                      args
                      [| param_valu; Llvm.const_null int_ty |]
                      ("arg_" ^ index_string)
                      bldr in

                  (* Store the argument value in the iovec. *)
                  let param_ty = Llvm.type_of param in
                  let void_ptr_slot = 
                    Llvm.build_call 
                      (val_to_void param_ty)
                      [| param_slot |]
                      "catch_vp" 
                      bldr in
                  let _ = Llvm.build_store void_ptr_slot buf_ptr bldr in

                  (* Store the parameter size in the iovec field. *)
                  let size_valu = 
                    Llvm.build_call
                      (val_to_size param_ty)
                      [| param |] 
                      ("sz_param_" ^ index_string)
                      bldr in
                  let size_ptr =
                    Llvm.build_gep
                      args
                      [| param_valu; Llvm.const_int int_ty 1 |]
                      ("sz_" ^ (string_of_int param_indx))
                      bldr in
                  let _ = Llvm.build_store size_valu size_ptr bldr in
                  param_indx + 1
                )
                0
                marsh_func in
            
            (* Call the library function. *)
            let work_call =
              let setup_fn = 
                Llvm.build_load setup_ptr "setup_fn" bldr in
              let num_params = 
                Llvm.const_int
                  int_ty (Array.length (Llvm.params work_func)) in
              Llvm.build_call
                setup_fn
                [| llvm_index; args; num_params  |] 
                "work_call"
                bldr in

            (* If the worker function returns void: *)
            let work_ret_type = Llvm.return_type work_type in
            let prog_void =
              Llvm.void_type (Llvm.type_context work_ret_type) in

            (* If the worker returns void, then return void. *)
            if work_ret_type = prog_void then
              (* Add a void return. *)
              let _ = Llvm.build_ret_void bldr in ()
            else 
              let ret_val =
                (* If the worker returns an iovec, then return it
                 * directly. *)
                if work_ret_type = iovec_ptr then 
                  let _ = print_endline "marsh: is iovec" in work_call
                else 
                  (* ret_buf: a pointer to the return value. *)
                  let ret_buf_ptr =
                    Llvm.build_struct_gep work_call 0 "work_res" bldr in
                  let ret_buf =
                    Llvm.build_load ret_buf_ptr "work_ret_buf" bldr in

                    (* Copy the value in the return iovec to the stack. *)
                  Llvm.build_call 
                    (void_to_val work_ret_type)
                    [| ret_buf |]
                    "ret_val"
                    bldr in

              (* Return the value. *)
              let _ = Llvm.build_ret ret_val bldr in 
              ()
          else gen_stub marsh_func
      )
    )
    mods;
  Llvm_analysis.assert_valid_module lib.modul;
  ()

let instr_unmarshes mods lib =
  (* For each strategy call, generate an unmarshaller. *)
  let (val_to_void, void_to_val, val_to_size) = cpy_funcs lib in 
  let lib_ctx = Llvm.module_context lib.modul in
  let int_ty = Llvm.i32_type lib_ctx in
  let int_null = Llvm.const_null int_ty in
  let void_ptr =
    Llvm.pointer_type (Llvm.i8_type (Llvm.module_context lib.modul)) in
  let null_ptr = Llvm.const_null void_ptr in
  let size_ty = Llvm.i64_type lib_ctx in
  let iovec_ty = 
    (match Llvm.type_by_name lib.modul "struct.iovec" with
        Some(iovec_ty) -> iovec_ty
      | None -> failwith "no iovec defined"
    ) in
  let iovec_ptr = Llvm.pointer_type iovec_ty in
  Llvm_sevpa.Mod_ids.iter
    (fun modul ->
      (match modul with
          Entry_mod -> ()
        | Call_mod(call) ->
          (* Define an unmarshalling function. *)
          let unmarsh_func = 
            Llvm.define_function
              ("unmarshall_" ^ (call_to_string call))
              (Llvm.function_type iovec_ptr [| iovec_ptr |])
              lib.modul in
          if is_part_func call then
            let work_func = call in
            let work_type = Llvm.element_type (Llvm.type_of work_func) in

            let bldr =
              Llvm.builder_at_end
                lib_ctx (Llvm.entry_block unmarsh_func) in

            (* ret_slot: stack space for the return value. *)
            let work_ret_type = Llvm.return_type work_type in

            (* work_rets_void: whether or not the function returns void. *)
            let work_rets_void =
              let prog_void =
                Llvm.void_type (Llvm.type_context work_ret_type) in
              work_ret_type = prog_void in

            (* work_rets_iovecp: whether or not the work function
             * returns a pointer to an iovec. *)
            let work_rets_iovecp = 
              (Llvm.string_of_lltype work_ret_type) = "struct.iovec*" in
            
            print_endline
              ("worker return type: " ^ (Llvm.string_of_lltype work_ret_type));
            print_endline ("iovecp: " ^ (Llvm.string_of_lltype iovec_ptr));
            print_endline
              ("work ret is iovecp: " ^ (string_of_bool work_rets_iovecp));

            let ret_slot = 
              if work_rets_void then null_ptr
              else Llvm.build_malloc work_ret_type "ret_slot" bldr in
            
            (* Construct an argument array by loading values from the
             * argument iovec. *)
            let arg_vec = Llvm.param unmarsh_func 0 in
            let args =
              Array.fold_left
                (fun args param ->
                  let arg_indx = Array.length args in
                  let indx_string = string_of_int arg_indx in
                  let prog_arg_indx = Llvm.const_int int_ty arg_indx in
                  let arg_ptr =
                    Llvm.build_gep 
                      arg_vec
                      [| prog_arg_indx; int_null |]
                      ("arg_" ^ indx_string ^ "_ptr")
                      bldr in
                  let arg_buf = 
                    Llvm.build_load
                      arg_ptr ("arg_buf_" ^ indx_string) bldr in
                  let arg = 
                    Llvm.build_call
                      (void_to_val (Llvm.type_of param))
                      [| arg_buf |]
                      ("arg_" ^ indx_string) 
                      bldr in 
                  Array.append args [| arg |]
                )
                [| |]
                (Llvm.params work_func) in

            (* Call the work function on the argument list. *)
            let work_call = 
              let catcher_nm =
                if work_rets_void then "" else "work_res" in
              Llvm.build_call work_func args catcher_nm bldr in
            Llvm.set_instruction_call_conv
              (Llvm.function_call_conv work_func) work_call;

            (* res_iovecp: an iovec storing the result. *)
            let res_iovecp =
              (* If the worker returns a ptr to an iovec: *)
              if work_ret_type = iovec_ptr then work_call
              else 
                (* Otherwise, allocate memory to hold the result
                 * value. *)
                let (void_res_buf, work_size) =
                (* If the return type is void, then return a null
                 * pointer. *)
                  if work_rets_void then (null_ptr, Llvm.const_int size_ty 0)
                  else
                  (* Store the work result on the stack. *)
                    let _ = Llvm.build_store work_call ret_slot bldr in 
                    let void_res_buf = 
                      Llvm.build_call
                        (val_to_void work_ret_type)
                        [| ret_slot |]
                        "void_res_buf" 
                        bldr in
                    let ret_size = 
                      Llvm.build_call
                        (val_to_size work_ret_type)
                        [| work_call |] 
                        "res_size"
                        bldr in
                    (void_res_buf, ret_size) in

                (* Allocate memory to hold the result iovec. *)
                let res_iovec =
                  Llvm.build_malloc iovec_ty "res_iovec" bldr in
                
                (* Store the result pointer in the iovec. *)
                let _ =
                  let base_field = 
                    Llvm.build_gep
                      res_iovec
                      [| int_null; int_null |]
                      "res_data_field"
                      bldr in
                  Llvm.build_store void_res_buf base_field bldr in

                (* Store the result size of the iovec. *)
                let _ =
                  let size_field =
                    Llvm.build_gep
                      res_iovec
                      [| int_null; Llvm.const_int int_ty 1 |]
                      "res_size_field"
                      bldr in
                  Llvm.build_store work_size size_field bldr in
                res_iovec in
            
            (* Return the result iovec. *)
            let _ = Llvm.build_ret res_iovecp bldr in
            ()
          else gen_stub unmarsh_func
      )
    )
    mods;
  Llvm_analysis.assert_valid_module lib.modul;
  ()


let instr_lib_h lib internals pure_inst_index mods pure_call_index =
  let int_type = Llvm.i32_type (Llvm.module_context lib.modul) in
  let inst_index inst = Llvm.const_int int_type (pure_inst_index inst) in
  let call_index modul = Llvm.const_int int_type (pure_call_index modul) in

  (* lib_mods: the functions that appear in each library. *)
  let lib_mods = 
    Llvm_sevpa.Mod_ids.filter
      (fun mod_id ->
        (match mod_id with
            Entry_mod -> 
              (match Llvm.lookup_function "main" lib.modul with
                  Some(_) -> true
                | None -> false
              )
          | Call_mod(call) -> Llvm.global_parent call = lib.modul
        )
      )
      mods in
  instr_lib_internals internals inst_index lib;
  instr_lib_calls mods lib_mods call_index lib;
  instr_lib_returns mods lib;
  instr_marshes lib_mods call_index lib;
  instr_unmarshes lib_mods lib;
  Llvm_analysis.assert_valid_module lib.modul

let instr_lib lib internals inst_index calls call_index =
  (* Instrument the library. *)
  instr_lib_h lib internals inst_index calls call_index;
  let bc_out = lib.name ^ ".wvd.bc" in
  let write_succ = Llvm_bitwriter.write_bitcode_file lib.modul bc_out in
  if write_succ then ()
  else failwith ("failed to write bitcode to " ^ bc_out)
    
let instr_entry entry internals inst_index calls call_index =
  let main_func =
    (match Llvm.lookup_function "main" entry.modul with
        Some(main_func) -> main_func
      | None -> failwith "Llvm_prog.instr_entry_init: no main function found"
    ) in

  (* Instrument a call to initialize the strategy transition table. *)
  let llvm_ctx = Llvm.module_context entry.modul in
  let charp_to_void = 
    Llvm.function_type
      (Llvm.void_type llvm_ctx)
      [| Llvm.pointer_type (Llvm.integer_type llvm_ctx 8) |] in

  instr_lib_h entry internals inst_index calls call_index;

  (* Instrument the initial action of the main function. *)
  instr_acts
    (Llvm_values.singleton (func_front main_func))
    (fun x -> x)
    (fun x ->
      (* Load the first argument of argv. *)
      let prog_path =
        let argv = Llvm.param main_func 1 in
        let bldr = Llvm.builder_before llvm_ctx x in
        Llvm.build_load argv "prog_path" bldr in
      [| prog_path |]
    )
    (Llvm.declare_function "wg_init_strat" charp_to_void entry.modul);

  let bc_out = entry.name ^ ".wvd.bc" in
  let write_succ = Llvm_bitwriter.write_bitcode_file entry.modul bc_out in
  if write_succ then ()
  else failwith ("failed to write bitcode to " ^ bc_out)

let load_lib file_nm =
  let modu =
    Llvm_bitreader.parse_bitcode
      (Llvm.global_context ()) (MemoryBuffer.of_file file_nm) in
  { modul = modu;
    name = file_nm;
  }
