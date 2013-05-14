(* Capsicum.ml: implementation of the symbolic model of the Capsicum
 * OS.
 *)

(* LLVM modules: *)
open Llvm

(* Wag modules: *)
open Libext
open Host
open Policy
open Program
open Vpa

(* Capsicum policy module: *)
open Cappol_regex_types
open Cappols

module Policy = Cappols
module Priv_lats = Cappols.Lat_ops.Priv_lats

let marker_names = Strings.add "cw_act" (Strings.singleton "cw_desc")

type prim =
    Enter_cm
  | Fork
  | Limit_fd of desc * Rights.t
  | Noop
  | Refresh of desc
  | Rpc

module Prim =
struct
  type t = prim
  let compare prim_0 prim_1 =
    (match prim_0, prim_1 with
         Limit_fd(desc_0, rights_0), Limit_fd(desc_1, rights_1) ->
           Desc_map.compare 
             Rights.compare
             (Desc_map.singleton desc_0 rights_0)
             (Desc_map.singleton desc_1 rights_1)
       | Limit_fd(_), _ -> -1
       | _, Limit_fd(_) -> 1
       | _ -> compare prim_0 prim_1
    )
end

module Prims = Set.Make(Prim)
module Prim_map = Map.Make(Prim)

(* cm_effect: the effect of a Capsicum transform on the capability
 * mode of the program. *)
type cm_effect = Cm_enter | Cm_id
let cm_effect_to_string cm_delta =
  (match cm_delta with
       Cm_enter -> "drop_cm"
     | Cm_id -> "id_cm"
  )

(* rights_effect: change in the set of rights associated with a given
 * descriptor. *)
type rights_effect =
    Const of Rights.t
  | Lower of Rights.t
  | Rights_id
  | Set_non_cap
  | Set_uninit

let rights_effect_cmp effect_0 effect_1 =
  (match effect_0, effect_1 with
       Lower(rights_0), Lower(rights_1)
     | Const(rights_0), Const(rights_1) -> Rights.compare rights_0 rights_1
     | _ -> compare effect_0 effect_1
  )

let rights_to_id rights =
  Rights.fold
    (fun right id ->
       let right_nm = Cappols.right_to_string right in
         if id = "" then right_nm
         else (id ^ "_" ^ right_nm)
    )
    rights
    ""

let rights_to_string =
  Libext.set_to_string Rights.fold Cappols.right_to_string

let rights_effect_to_string rights_effect =
  (match rights_effect with
       Lower(rights) -> "lower " ^ (rights_to_string rights)
     | Const(rights) -> "const " ^ (rights_to_string rights)
     | Rights_id -> "rights-id"
     | Set_non_cap -> "set-non-cap"
     | Set_uninit -> "set-uninit"
  )

type rpc_state = Fork_armed | Rpc_armed | Rpc_unarmed

let rpc_state_to_string rpc_state =
  (match rpc_state with
       Fork_armed -> "fork_armed"
     | Rpc_armed -> "rpc_armed"
     | Rpc_unarmed -> "rpc_unarmed"
  )

type cap_trfrm =
    Pre_ambient of cm_effect * (rights_effect Desc_map.t)
  | Pre_cm of (rights_effect Desc_map.t)

let cap_trfrm_cmp trfrm_0 trfrm_1 =
  (match trfrm_0, trfrm_1 with
       Pre_ambient(cm_0, rights_0), Pre_ambient(cm_1, rights_1) ->
         let cm_cmp = compare cm_0 cm_1 in
           if cm_cmp != 0 then cm_cmp
           else Desc_map.compare rights_effect_cmp rights_0 rights_1
     | Pre_cm(rights_0), Pre_cm(rights_1) ->
         Desc_map.compare rights_effect_cmp rights_0 rights_1
     | Pre_ambient(_), _ -> -1
     | Pre_cm(_), _ -> 1
  )

type host_trfrm = cap_trfrm * rpc_state

module Host_trfrm =
struct
  type t = host_trfrm
  let compare (cap_0, rpc_0) (cap_1, rpc_1) =
    let rpc_cmp = compare rpc_0 rpc_1 in
    if rpc_cmp != 0 then rpc_cmp else cap_trfrm_cmp cap_0 cap_1
end
module Host_trfrms = Set.Make(Host_trfrm)

type host_monitor =
    {
      int_compose_transforms:
        Host_trfrm.t -> Host_trfrm.t -> Host_trfrm.t option;
      
      ret_compose_transforms:
        Host_trfrm.t -> Host_trfrm.t -> Host_trfrm.t option;

      trans_id: Host_trfrms.t;

      trans_init: Host_trfrm.t;

      enabled_prims: 
        Prog_sevpa.state -> Policy.Dfa.state -> Host_trfrm.t -> Prims.t;

      entry_priv_lat: Cappols.priv_lattice;

      instr_to_transforms: Program.Prog_sevpa.Internal.t -> Host_trfrms.t;

      is_entry_trfrm: Host_trfrm.t -> bool;

      is_entry_priv_lats: Priv_lats.t -> bool;

      prim_score: prim -> int;

      prims: Prims.t;

      prim_to_transforms: Prim.t -> Host_trfrms.t;

      stack_wp_transform: 
        Host_trfrm.t -> Cappols.priv_lattice -> Cappols.priv_lattice;

      wp_transform: 
        Host_trfrm.t -> Cappols.priv_lattice -> Cappols.priv_lattice;
    }

let trfrm_to_string (trfrm, rpc) =
  let cap_string =
    (match trfrm with
         Pre_ambient(cm_delta, rights_effects) ->
           "guard: ambient\n"
           ^ "CM effect: " ^ (cm_effect_to_string cm_delta) ^ "\n"
           ^ "rights effect:\n" ^ 
             (map_to_string
                Desc_map.fold
                desc_to_string
                rights_effect_to_string
                rights_effects)
       | Pre_cm(rights_effects) ->
           "guard: cap mode\n"
           ^ "rights ceilings:\n" ^ 
             (map_to_string
                Desc_map.fold
                desc_to_string
                rights_effect_to_string
                rights_effects)
    ) in
  let rpc_string = "RPC: " ^ (rpc_state_to_string rpc) ^ "\n" in
    cap_string ^ rpc_string

module Priv_lats_set = Set.Make(Priv_lats)

let cons_code_gen hst_monitor instr_store =
  let instr_ctx = Llvm.module_context instr_store in
  let int_ty = Llvm.i32_type instr_ctx in

  (* desc_to_var: a map from each policy descriptor to its global
   * variable. *)
  let host_descs =
    Prims.fold
      (fun prim host_descs ->
        (match prim with
            Limit_fd(desc, _) -> Descs.add desc host_descs
          | _ -> host_descs
        )
      )
      hst_monitor.prims
      Descs.empty in
  let desc_value_map =
    Descs.fold
      (fun desc desc_to_var ->
         let prog_desc =
           (match desc with
                Llvm_desc(ll_desc) ->
                  let desc_nm = Llvm.value_name ll_desc in
                    Llvm.define_global
                      desc_nm (Llvm.const_null int_ty) instr_store
              | Stdin ->
                  Llvm.define_global
                    "cw_stdin" (Llvm.const_int int_ty 0) instr_store
              | Stdout ->
                  Llvm.define_global
                    "cw_stdout" (Llvm.const_int int_ty 1) instr_store
              | Stderr ->
                  Llvm.define_global
                    "cw_stderr" (Llvm.const_int int_ty 2) instr_store
           ) in
           Desc_map.add desc prog_desc desc_to_var
      )
      host_descs
      Desc_map.empty in
  let desc_to_value desc = Desc_map.find desc desc_value_map in

  (* Instrument a store that copies each descriptor to its global. *)
  Descs.iter
    (fun desc ->
      (match desc with
          Llvm_desc(desc_inst) ->
            (* lib: LLVM parent module. *)
            let lib =
              Llvm.global_parent
                (Llvm.block_parent (Llvm.instr_parent desc_inst)) in

            let lib_ctx = Llvm.module_context lib in

            let desc_val = Llvm.call_get_arg desc_inst 1 in

            (* glob_store: a function that stores the descriptor in a
             * global variable. *)
            let glob_store =
              let store_ty = 
                let void_ty = Llvm.void_type lib_ctx in
                let desc_ty = Llvm.type_of desc_val in
                let int_ptr_ty = Llvm.pointer_type int_ty in
                Llvm.function_type void_ty [| desc_ty; int_ptr_ty |] in
              Llvm.declare_function "store_fd" store_ty lib in
            
            (* desc_glob: a global that holds the descriptor. *)
            let desc_glob =
              Llvm.declare_global int_ty (Llvm.value_name desc_inst) lib in
            
            (* Call the extractor on the descriptor variable. *)
            let _ = 
              Llvm.build_call
                glob_store
                [| desc_val; desc_glob |]
                ""
                (Llvm.builder_at lib_ctx (Llvm.instr_succ desc_inst)) in
            ()
        | _ -> ()
      )
    )
    host_descs;

  let prog_prim_ty = Llvm.function_type (Llvm.void_type instr_ctx) [| |] in
  let rights_ty = Llvm.i32_type instr_ctx in
  let limit_fd_func =
    Llvm.declare_function
      "cw_lc_limitfd"
      (Llvm.function_type
         (Llvm.void_type instr_ctx)
         [| int_ty; rights_ty |])
      instr_store in
  let refresh_func =
    Llvm.declare_function
      "cw_refresh"
      (Llvm.function_type
         (Llvm.void_type instr_ctx)
         [| int_ty |]) 
      instr_store in

  (* right_to_bit_mask: function from a Capsicum right to its bitmask
   * value, as defined in the Capsicum distro in sys/capability.h. *)
  let right_to_bit_mask right =
    (* Function from each right to its representation as a hex ULL in
     * sys/capability.h. *)
    let (valu, shift) =
      (match right with
          Accept -> (8, 7)
        | Acl_check -> (2, 7)
        | Acl_delete -> (4, 7)
        | Acl_get -> (8, 7)
        | Acl_set -> (1, 8)
        | Bind -> (4, 8)
        | Connect -> (8, 8)
        | Create -> (8, 4)
        | Delete -> (1, 5)
        | Fexecve -> (1, 1)
        | Extattr_delete -> (2, 6)
        | Extattr_get -> (4, 6)
        | Extattr_list -> (8, 6)
        | Extattr_set -> (1, 7)
        | Fchdir -> (2, 2)
        | Fchflags -> (1, 2)
        | Fchmod -> (2, 3)
        | Fchown -> (8, 3)
        | Fcntl -> (2, 2)
        | Flock -> (4, 3)
        | Fpathconf -> (2, 3)
        | Fsck -> (8, 3)
        | Fstat -> (8, 1)
        | Fstatfs -> (2, 4)
        | Fsync -> (2, 1)
        | Ftruncate -> (4, 1)
        | Futimes -> (4, 4)
        | Getpeername -> (8, 0)
        | Getsockname -> (1, 1)
        | Getsockopt -> (4, 9)
        | Ioctl -> (4, 12)
        | Listen -> (1, 9)
        | Lookup -> (1, 6)
        | Mac_get -> (8, 10)
        | Mac_set -> (1, 11)
        | Mapexec -> (8, 0)
        | Mkdir -> (2, 5)
        | Mkfifo -> (8, 5)
        | Mmap -> (4, 0)
        | Pdgetpid -> (1, 13)
        | Pdkill -> (4, 13)
        | Pdwait -> (2, 13)
        | Peeloff -> (1, 10)
        | Poll_event -> (1, 12)
        | Post_event -> (2, 12)
        | Read -> (1, 0)
        | Rmdir -> (4, 5)
        | Seek -> (4, 0)
        | Sem_getvalue -> (2, 11)
        | Sem_post -> (4, 11)
        | Sem_wait -> (8, 11)
        | Setsockopt -> (2, 10)
        | Shutdown -> (4, 10)
        | Ttyhook -> (8, 12)
        | Write -> (2, 0)
      ) in
    (* HACK: *)
    (match right with
        Read ->
          List.fold_left 
            Int64.logor 
            Int64.zero
            (List.map
               (fun (valu, shift) -> 
                 Int64.shift_left (Int64.of_int valu) (4 * shift)
               )
               [ (1, 0); (8, 1); (2, 2); (4, 0); (8, 7) ]
            )
      | _ -> Int64.shift_left (Int64.of_int valu) (4 * shift) 
    ) in

  
  (* rights_to_bit_mask: takes a set of rights, constructs the
   * bit-mask representation of the set as a bitwise-or of per-right
   * bitmasks. *)
  let rights_to_bit_mask rights bldr =
    Rights.fold
      (fun right rights_bit_mask ->
        Llvm.build_or
          rights_bit_mask
          (Llvm.const_of_int64 rights_ty (right_to_bit_mask right) false)
          ("inc_" ^ (right_to_string right))
          bldr
      )
      rights
      (Llvm.const_int rights_ty 0) in
  
  let void_to_void = Llvm.function_type (Llvm.void_type instr_ctx) [| |] in
  let prim_to_llvm_map =
    (* build_closure: takes an LLVM function and a list of
     * arguments. Builds a closure of the LLVM function for all of the
     * arguments. *)
    let build_closure abs args =
      let (arg_bldrs, arg_nms) = List.split args in
      let closure =
        let closure_nm = 
          List.fold_left
            (fun closure_nm arg_nm -> closure_nm ^ "_" ^ arg_nm)
            (Llvm.value_name abs)
            arg_nms in
        Llvm.define_function closure_nm prog_prim_ty instr_store in

      (* closure_ret: a return instruction. *)
      let closure_ret = 
        let closure_begin = Llvm.instr_begin (Llvm.entry_block closure) in
        Llvm.build_ret_void (Llvm.builder_at instr_ctx closure_begin) in
      let ret_bldr = Llvm.builder_before instr_ctx closure_ret in

      (* Build a list of arguments (pick up from here). *)
      let args =
        List.fold_left
          (fun args arg_bldr -> Array.append args [| arg_bldr ret_bldr |]) 
          [| |]
          arg_bldrs in

      (* Build the call to the abstraction. *)
      let _ = Llvm.build_call abs args "" ret_bldr in
      closure in

    Prims.fold
      (fun prim prim_to_func ->
        let closure =
          (match prim with
              Enter_cm ->
                Llvm.declare_function "cw_cap_enter" void_to_void instr_store
            | Fork -> Llvm.declare_function "cw_fork" void_to_void instr_store
            | Limit_fd(desc, rights) ->
              let desc_cons = Llvm.build_load (desc_to_value desc) "catch" in
              let mask_cons = rights_to_bit_mask rights in
              build_closure
                limit_fd_func
                [ (desc_cons, desc_to_string desc);
                   (mask_cons, rights_to_string rights) 
                ]
            | Refresh(desc) -> 
              build_closure 
                refresh_func
                [ (Llvm.build_load (desc_to_value desc) "catch",
                    desc_to_string desc)
                ]
            | Rpc -> Llvm.declare_function "cw_rpc" void_to_void instr_store
            | Noop -> Llvm.declare_function "cw_noop" void_to_void instr_store
          ) in
        Prim_map.add prim closure prim_to_func
      )
      hst_monitor.prims
      Prim_map.empty in
  (fun prim -> Prim_map.find prim prim_to_llvm_map)

let prim_to_string prim =
  (match prim with
       Enter_cm -> "cap_enter"
     | Fork -> "fork"
     | Limit_fd(desc, rights) ->
         let desc_string = Cappols.desc_to_string desc in
         let rights_string =
           let enum_string =
             Rights.fold
               (fun right enum_string ->
                  enum_string ^ ", " ^ (right_to_string right)
               )
               rights
               "" in
             "{ " ^ enum_string ^ " }" in
           "lc_limitfd(" ^ desc_string ^ ", " ^ rights_string ^ ")"
     | Noop -> "noop"
     | Refresh(desc) -> "refresh(" ^ (Cappols.desc_to_string desc)
     | Rpc -> "rpc"
  )

let cons_host_monitor prog prog_sevpa pol =
  (* comp_rights: the composition (intersection) of effects on
   * descriptor rights. *)
  let comp_rights rights_0 rights_1 =
      (* For each descriptor: *)
    Descs.fold
      (fun desc ->
        let rights_effect_0 = Desc_map.find desc rights_0 in
        let rights_effect_1 = Desc_map.find desc rights_1 in
        let desc_rights =
          (match rights_effect_0, rights_effect_1 with
              (* Rights_id is the identity of rights operations. *)
              Rights_id, re
            | re, Rights_id -> re
            (* Set_non_cap, Set_uninit, and Const are all
             * right-annihilators. *)
            | _, Set_uninit
            | _, Set_non_cap
            | _, Const(_) -> rights_effect_1
            (* Define right-composition with Lower: *)
            | Set_uninit, Lower(_) -> Set_uninit
            | Set_non_cap, Lower(rs) -> Const(rs)
            | Const(rights_0), Lower(rights_cap_1) ->
              Const(Rights.inter rights_0 rights_cap_1)
            | Lower(rights_cap_0), Lower(rights_cap_1) ->
              Lower(Rights.inter rights_cap_0 rights_cap_1)
          ) in
        Desc_map.add desc desc_rights
      )
      pol.info.descs
      Desc_map.empty in

  (* compose_int_transforms: compose two Host transforms. *)
  let cap_int_compose_transforms (trfrm_0, _) (trfrm_1, rpc_1) =
      (match trfrm_0, trfrm_1 with
           (* If both transforms are in the context of ambient
            * mode: *)
           Pre_ambient(cm_delta_0, rights_0),
           Pre_ambient(cm_delta_1, rights_1) ->
             (* If the first transform is cap_enter, then this
              * transform is undefined. *)
             if cm_delta_0 = Cm_enter then None
             else
               Some(
                 (Pre_ambient(
                    cm_delta_1, comp_rights rights_0 rights_1), rpc_1))
         | Pre_ambient(cm_delta, rights_0), Pre_cm(rights_1) ->
             (* If the first transform has an ambient context and the
              * second transform has a cap_mode context, then the first
              * transform must have entered cap-mode, or the composition
              * is undefined. *)
             if cm_delta = Cm_id then None
             else
               (* Compose the effect of rights the rights bound to each
                * descriptor. *)
               let comp_rights = comp_rights rights_0 rights_1 in
                 Some((Pre_ambient(Cm_enter, comp_rights), rpc_1))
         | Pre_cm(_), Pre_ambient(_) -> None
         | Pre_cm(rights_0), Pre_cm(rights_1) ->
             let composed_rights = comp_rights rights_0 rights_1 in
             Some((Pre_cm(composed_rights), rpc_1))
      ) in

  let get_rights_effect cap_trfrm =
    (match cap_trfrm with
       Pre_ambient(_, pre_rights) -> pre_rights
     | Pre_cm(pre_rights) -> pre_rights
    ) in

  (* cap_ret_compose_transforms: compose transforms on a return
   * transition. *)
  let cap_ret_compose_transforms 
      ((cap_pre_trfrm, pre_rpc) as pre_trfrm)
      ((cap_stack_trfrm, stack_rpc) as stack_trfrm) =
    (match stack_rpc with
        Fork_armed ->
          (* Compose the transforms as if they were internal. *)
          let comp_opt = cap_int_compose_transforms stack_trfrm pre_trfrm in
          (* Update the CM effect to be just the delta on the stack. *)
          (match comp_opt with 
              Some(Pre_ambient(cm_delta, rights_delta), rpc) ->
                (match cap_stack_trfrm with
                    Pre_ambient(stack_cm_delta, _) -> 
                      Some(Pre_ambient(stack_cm_delta, rights_delta), rpc)
                  | _ -> comp_opt
                )
            | _ -> comp_opt
          )
      | Rpc_armed -> 
         let cons_ret_comp cons_fn =
           let comp_cap_trfrm =
             cons_fn
               (comp_rights
                 (get_rights_effect cap_stack_trfrm)
                 (get_rights_effect cap_pre_trfrm)) in
           Some(comp_cap_trfrm, Rpc_unarmed) in
         (match cap_pre_trfrm with
             Pre_ambient(_) ->
               (match cap_stack_trfrm with
                   Pre_ambient(cm_trfrm, _) ->
                     cons_ret_comp (fun rights -> Pre_ambient(cm_trfrm, rights))
                 | Pre_cm(_) -> cons_ret_comp (fun rights -> Pre_cm(rights))
               )
           | Pre_cm(_) -> None
         )
      | Rpc_unarmed -> cap_int_compose_transforms stack_trfrm pre_trfrm
    ) in
    
  (* id_rights: ID rights effect. *)
  let id_rights =
    Descs.fold
      (fun desc -> Desc_map.add desc Rights_id) pol.info.descs Desc_map.empty in
  let cap_trans_id = 
    let ambient_id = (Pre_ambient(Cm_id, id_rights), Rpc_unarmed) in
    let cm_id = (Pre_cm(id_rights), Rpc_unarmed) in
      Host_trfrms.add ambient_id (Host_trfrms.singleton cm_id) in
    
  (* cap_trans_init: the initial Capsicum transform. *)
  let cap_trans_init = (Pre_ambient(Cm_id, id_rights), Rpc_unarmed) in

  (* fork_funcs: functions that can be forked. *)
  let fork_funcs =
    Program.fork_part_funcs prog_sevpa.Prog_sevpa.sevpa_calls prog  in

  (* rpc_funcs: the functions that can be called via RPC. *)
  let rpc_funcs =
    Program.rpc_part_funcs prog_sevpa.Prog_sevpa.sevpa_calls prog  in

  (* cap_prims: the set of all monitor primitives. *)
  let cap_prims =
    let limit_fds =
      (* For each descriptor: *)
      Desc_map.fold
        (fun desc all_rights prims ->
           (* right_sets: the power set of rights. *)
           let right_sets = right_pset all_rights in
             (* For each set of rights contained in the set of all
              * interesting rights: *)
             Rights_set.fold
               (fun right_set prims ->
                  (* Construct a limit_fd primitive on the descriptor
                   * and set of rights. *)
                  Prims.add (Limit_fd(desc, right_set)) prims
               )
               right_sets
               prims
        )
        pol.info.desc_to_all
        Prims.empty in
      Prims.add
        Fork (Prims.add Rpc (Prims.add Enter_cm (Prims.add Noop limit_fds))) in

  (* cap_enabled_prims: the primitives that the Capsicum monitor can
   * invoke from a given transform and have some effect on the Capsicum
   * state. *)
  let cap_enabled_prims prog_state pol_state (trfrm, rpc) =
    (* always_prims: primitives that are always enabled: *)
    let always_prims = Prims.singleton Noop in

    (* in_cap_mode: decide if the transform is in capability mode. *)
    let in_cap_mode =
      (match trfrm with
          Pre_ambient(cm_delta, _) -> cm_delta = Cm_enter
        | Pre_cm(_) -> true
      ) in

    (* interproc_prims: the RPC primitives that are enabled. *)
    let interproc_prims =
      let state_calls = prog_sevpa.Prog_sevpa.sevpa_call_enabled prog_state in
      let no_call_en = Prog_sevpa.Calls.is_empty state_calls in

      (* rpc_prims: the RPC primitives. *)
      let rpc_prims = 
        let all_calls_rpc = Prog_sevpa.Calls.subset state_calls rpc_funcs in
        if (not no_call_en) && all_calls_rpc && in_cap_mode then
          Prims.singleton Rpc 
        else Prims.empty in

      (* fork_prims: the fork primitives. *)
      let fork_prims =
        let all_calls_fork = Prog_sevpa.Calls.subset state_calls fork_funcs in
          if (not no_call_en) && all_calls_fork && (not in_cap_mode) then
            Prims.singleton Fork
          else Prims.empty in
        Prims.union rpc_prims fork_prims in

    (* top_lats: lattices on the top of internal transitions. *)
    let top_lats =
      Policy.Dfa.Actions.fold
        (fun (_, lat) -> Priv_lats.add lat)
        (pol.Policy.dfa.Dfa.en_sets pol_state)
        Priv_lats.empty in

    (* cap_enter_prims: primitives for entering capability mode. *)
    let cap_enter_prims =
      if in_cap_mode then Prims.empty else Prims.singleton Enter_cm in

    (* limfd_prims: primitives for lowering the rights bound to a
     * given file descriptor. *)
    let limfd_prims = 
      let strict_prims rights_effect =
        (* For each rights effect in the current state: *)
        Desc_map.fold
          (fun desc right_effect ->
            (* desc_prims: all primitives that lower the rights of
             * the descriptor to some set of rights in the upper bound
             * of some policy transition lattice. *)
            let desc_prims =
              (* pol_desc_rights: all descriptor right sets that
               * are in the top of some lattice. *)
              let pol_desc_rights =
                Priv_lats.fold
                  (fun lat pol_desc_rights ->
                    (match lat with
                        Non_empty_lat(bounds) -> 
                          let cap_rights = 
                            Desc_map.find
                              desc bounds.upper_bound.desc_rights in
                          (match cap_rights with
                              Cap(rights) -> 
                                Rights_set.add rights pol_desc_rights
                            | _ -> pol_desc_rights
                          )
                      | Empty_lat -> pol_desc_rights
                    )
                  )
                  top_lats
                  Rights_set.empty in

              (* lim_rights: valid arguments for a call to
               * limit_fd. *)
              let lim_rights =
                Rights_set.fold
                  (fun pol_rights lim_rights ->
                    (match right_effect with
                        Const(prim_rights)
                      | Lower(prim_rights) ->
                        let inter_rights =
                          Rights.inter prim_rights pol_rights in
                        let proper_sub = 
                          not (Rights.subset prim_rights inter_rights) in
                        if proper_sub then 
                          Rights_set.add inter_rights lim_rights
                        else lim_rights
                      | _ -> Rights_set.add pol_rights lim_rights
                    )
                  )
                  pol_desc_rights
                  Rights_set.empty in
              
              (* Construct a call to limitfd from each limiting set
               *  of rights. *)
              Rights_set.fold
                (fun lim_rights -> Prims.add (Limit_fd(desc, lim_rights)))
                lim_rights
                Prims.empty in
            Prims.union desc_prims
          )
          rights_effect
          Prims.empty in

      (* rights_effects: the rights effects of the current transition. *)
      let rights_effects = 
        (match trfrm with
             Pre_ambient(_, rights_effects)
           | Pre_cm(rights_effects) -> rights_effects
        ) in
        strict_prims rights_effects in

    (* refresh_prims: primitives for refreshing descriptors. *)
    let refresh_prims =
      (match trfrm with
          Pre_ambient(Cm_id, _) ->
            Descs.fold
              (fun desc -> Prims.add (Refresh(desc))) pol.info.descs Prims.empty
        | _ -> Prims.empty
      ) in

    Prims.union
      always_prims
      (Prims.union
         interproc_prims (Prims.union cap_enter_prims limfd_prims)) in
  
  (* cap_instr_to_transforms: takes a program instruction,
   * constructs the set of all Capsicum transforms. *)
  let cap_instr_to_transforms action =
    (* If the instruction is a descriptor: *)
    let action_inst_opt = Program.llvm_inst action in
    let action_desc_opt =
      (match action_inst_opt with
          Some(action_inst) ->
            Descs.fold
              (fun desc action_desc->
                (match action_desc, desc with
                    Some(_), _ -> action_desc
                  | None, Llvm_desc(desc_inst) ->
                    if action_inst = desc_inst then Some(desc) else None
                  | _ -> None
                )
              )
              pol.info.descs
              None
        | None -> None
      ) in
    
    (match action_desc_opt with
        Some(open_desc) ->
          let amb_trfrm =
            (Pre_ambient(
              Cm_id,
              Desc_map.add open_desc Set_non_cap id_rights),
             Rpc_unarmed) in
          let cm_trfrm = 
            (Pre_cm(Desc_map.add open_desc Set_uninit id_rights),
             Rpc_unarmed) in
          Host_trfrms.add cm_trfrm
            (Host_trfrms.singleton amb_trfrm)
      | None -> cap_trans_id
    ) in

  (* cap_entry_lat: the entry lattice of Capsicum. *)
  let cap_entry_lat =
    let entry_caps =
      let entry_rights =
        Descs.fold
          (fun desc -> 
            let entry_cap_rights =
              (match desc with
                  Llvm_desc(_) -> Uninit
                | _ -> Non_cap
              ) in
            Desc_map.add desc entry_cap_rights
          )
          pol.info.descs
          Desc_map.empty in
      { amb = true;
        desc_rights = entry_rights;
        rights_ceiling = pol.info.desc_to_all;
      } in
    let entry_lat =
      { lower_bound = entry_caps;
        upper_bound = entry_caps;
      } in
      Non_empty_lat(entry_lat) in

  let cap_is_entry_priv_lats priv_lats =
    Priv_lats.exists
      (fun priv_lat ->
         not
           (Lat_ops.lat_is_empty
              (Lat_ops.intersect_lats cap_entry_lat priv_lat))
      )
      priv_lats in

  (* cap_is_entry_trfrm: decide if a transform is for the entry module
   * of a program. *)
  let cap_is_entry_trfrm (trfrm, _) =
    (match trfrm with
        Pre_ambient(_) -> true
      | Pre_cm(_) -> false
    ) in

  (* cap_prim_to_transforms: take a Capsicum primitive and define
   * its set of transforms. *)
  let cap_prim_to_transforms prim =
    (match prim with
         Enter_cm -> 
           Host_trfrms.add (Pre_cm(id_rights), Rpc_unarmed)
             (Host_trfrms.singleton
                (Pre_ambient(Cm_enter, id_rights), Rpc_unarmed))
       | Fork ->
           Host_trfrms.add
             (Pre_ambient(Cm_id, id_rights), Fork_armed)
             (Host_trfrms.singleton
                (Pre_cm(id_rights), Fork_armed))
       | Limit_fd(desc, rights) ->
          let upd_rights_effect = 
            Desc_map.add desc (Lower(rights)) id_rights in
           Host_trfrms.add
             (Pre_ambient(Cm_id, upd_rights_effect), Rpc_unarmed)
             (Host_trfrms.singleton
                (Pre_cm(upd_rights_effect), Rpc_unarmed))
       | Noop -> cap_trans_id
       | Rpc -> 
          Host_trfrms.add
             (Pre_ambient(Cm_id, id_rights), Rpc_armed)
             (Host_trfrms.singleton (Pre_cm(id_rights), Rpc_armed))
       | Refresh(desc) ->
         Host_trfrms.singleton
           (Pre_ambient(Cm_id, Desc_map.add desc Set_non_cap id_rights), 
            Rpc_unarmed)
    ) in

  (* cap_prim_score: assign a numeric weight to each Capsicum primitive. *)
  let cap_prim_score cap_prim =
    (match cap_prim with
         Enter_cm -> 1
       | Fork -> 10
       | Limit_fd(_) -> 1
       | Noop -> 0
       | Rpc -> 50
       | Refresh(_) -> 25
    ) in

  (* low_wp_rights: takes a rights effect and a post set of
   * rights. Constructs the lowest set of rights that go above the post
   * rights under the effect, if defined. *)
  let low_wp_rights desc rights_effect post_cap_rights =
    (match post_cap_rights with
        Cap(post_rights) ->
          (match rights_effect with
              Rights_id -> Some(post_cap_rights)
            | Lower(lower_rights) -> 
              if Rights.subset post_rights lower_rights then 
                Some(post_cap_rights)
              else None
            | Const(const_rights) -> 
              if Rights.subset post_rights const_rights then Some(Uninit)
              else None
            | Set_non_cap -> Some(Uninit)
            | Set_uninit -> None
          )
      | Non_cap ->
        (match rights_effect with
            Rights_id -> Some(post_cap_rights)
          | Set_non_cap -> Some(Uninit)
          | _ -> None
        )
      | Uninit -> Some(Uninit)
    ) in

  (* high_wp_rights: takes a rights effect and a post set of
   * rights. Constructs the highest set of rights that go below the post
   * rights under the effect, if defined. *)
  let high_wp_rights desc rights_effect post_cap_rights =
    (match post_cap_rights with
        Cap(post_rights) ->
          (match rights_effect with
              Rights_id -> Some(post_cap_rights)
            | Set_non_cap -> None
            | Set_uninit -> Some(Non_cap)
            | Const(const_rights) ->
              if Rights.subset const_rights post_rights then Some(Non_cap)
              else None
            | Lower(lower_rights) ->
              (* DBG: fix? *)
              if Rights.subset lower_rights post_rights then Some(Non_cap)
              else 
                let pre_rights = 
                  Rights.union
                    post_rights
                    (Rights.diff
                       (Desc_map.find desc pol.info.desc_to_all)
                       lower_rights) in
                Some(Cap(pre_rights))
          )
      | Non_cap -> Some(Non_cap)
      | Uninit ->
        (match rights_effect with
            Set_uninit -> Some(Non_cap)
          | Rights_id
          | Lower(_) -> Some(Uninit)
          | _ -> None
        )
    ) in

  (* wp_rights_map: takes extremal values of rights, a transform, and
   * post-rights, and constructs the weakest set of rights that get to
   * the post-rights. *)
  let wp_rights_map rights_pre rights_effects post_rights =
    Descs.fold
      (fun desc wp_rights_opt ->
        (match wp_rights_opt with
            Some(wp_rights_map) -> 
              let desc_pre =
                let desc_effect = Desc_map.find desc rights_effects in
                let desc_post = Desc_map.find desc post_rights in
                rights_pre desc desc_effect desc_post in
              (match desc_pre with
                  Some(pre_rights) -> 
                    Some(Desc_map.add desc pre_rights wp_rights_map)
                | None -> None
              )
          | None -> None
        )
      )
      pol.info.descs
      (Some(Desc_map.empty)) in

  let cap_wp_transform (trfrm, _) priv_lat =
    (match priv_lat with
        Non_empty_lat(lat) ->
          let bot = lat.lower_bound in
          let top = lat.upper_bound in
          let pre_env_opt =
            (match trfrm with
                Pre_ambient(cm_change, _) ->
                  if (cm_change = Cm_enter && bot.amb)
                    || (cm_change = Cm_id && not top.amb) then None
                  else Some(true)
              | Pre_cm(_) -> if bot.amb then None else Some(false)
            ) in
          (match pre_env_opt with
              Some(pre_env) ->
                let rights_effect = get_rights_effect trfrm in
                let bot_rights_opt =
                  wp_rights_map low_wp_rights rights_effect bot.desc_rights in
                let top_rights_opt =
                  wp_rights_map high_wp_rights rights_effect top.desc_rights in
                (match bot_rights_opt, top_rights_opt with
                    Some(bot_desc_rights), Some(top_desc_rights) ->
                      let pre_lat =
                        { lower_bound =
                            { amb = pre_env;
                              desc_rights = bot_desc_rights;
                              rights_ceiling = pol.info.desc_to_all;
                            };
                          upper_bound =
                            { amb = pre_env;
                              desc_rights = top_desc_rights; 
                              rights_ceiling = pol.info.desc_to_all;
                            };
                        } in
                      Non_empty_lat(pre_lat)
                  | _ -> Empty_lat
                )
            | None -> Empty_lat
          )
      | Empty_lat -> Empty_lat
    ) in

  (* desc_to_lb: map from each desciptor to its lower bound on
   * rights. *)
  let desc_to_lb =
    Descs.fold
      (fun desc -> 
        let bound =
          (match desc with
              Llvm_desc(_) -> Uninit
            | _ -> Cap(Rights.empty)
          ) in
        Desc_map.add desc bound
      )
      pol.info.descs
      Desc_map.empty in

  let desc_to_non_cap =
    Descs.fold
      (fun desc -> Desc_map.add desc Non_cap) pol.info.descs Desc_map.empty in
    
  (* cap_stack_wp_transform: the stack WP for Capsicum transforms. *)
  let cap_stack_wp_transform ((_, interproc) as trfrm) priv_lat =
    let pre_lat =
      (match interproc with
        | Fork_armed
        | Rpc_unarmed -> priv_lat
        | Rpc_armed -> 
          (match priv_lat with
              Non_empty_lat(lat_bounds) ->
                (* If the entry lattice includes ambient capability: *)
                if lat_bounds.upper_bound.amb then
                  (* then relax the entry lattice to have any any
                   * capability. *)
                  let lat_bounds' =
                    { lat_bounds with
                      lower_bound =
                        { lat_bounds.lower_bound with amb = false } 
                    } in
                  Non_empty_lat(lat_bounds')
                else Empty_lat
            | Empty_lat -> Empty_lat
           )
      ) in
      cap_wp_transform trfrm pre_lat in

  (* Construct the host monitor. *)
  { int_compose_transforms = cap_int_compose_transforms;
    ret_compose_transforms = cap_ret_compose_transforms;
    trans_id = cap_trans_id;
    trans_init = cap_trans_init;
    enabled_prims = cap_enabled_prims;
    entry_priv_lat = cap_entry_lat;
    instr_to_transforms = cap_instr_to_transforms;
    is_entry_trfrm = cap_is_entry_trfrm;
    is_entry_priv_lats = cap_is_entry_priv_lats;
    prim_score = cap_prim_score;
    prims = cap_prims;
    prim_to_transforms = cap_prim_to_transforms;
    stack_wp_transform = cap_stack_wp_transform;
    wp_transform = cap_wp_transform;
  }

(* key_host_internals: all internals that are key for Capsicum are key
 * for the policy. *)
let key_host_internals prog_ints pol_ints = Prog_sevpa.Internals.empty

