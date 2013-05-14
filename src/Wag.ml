(* Wag.ml: the policy-weaver generator. *)
(* open LLVM modules. *)
(* LLVM modules. *)
open Llvm
open Llvm_bitreader
open Llvm_bitwriter

(* open WAG modules: *)
open Llvm_prog
open Bin_prog
open Libext
open Host
open Policy
open Program
open Vpa
open Z3_lib

(* open host-specific modules: *)
open Capsicum

(* Dump a VPA to dot. *)
let dot_dump vpa_to_dot out_file_nm vpa =
  let vpa_file = open_out out_file_nm in
  let vpa_dot = vpa_to_dot vpa in
    output_string vpa_file vpa_dot;
    flush vpa_file

(* Weave_gen: a policy-weaver generator. Takes a HOST module as input,
 * constructs a policy-weaver for the Host. *)
module Weave_gen =
  functor (Hst: HOST) ->
struct
  module Prog_sevpa = Program.Prog_sevpa
  module Pol = Hst.Policy
  module Priv_lats = Pol.Lat_ops.Priv_lats

  (* Priv_trfrms: map from a host transform and current policy
   * state. *)
  module Priv_trfrms =
    Map.Make(
      struct
        type t = Hst.Host_trfrm.t * Pol.Dfa.state
        let compare (host_trfrm_0, pol_state_0) (host_trfrm_1, pol_state_1) =
          let trfrm_cmp = Hst.Host_trfrm.compare host_trfrm_0 host_trfrm_1 in
          if trfrm_cmp != 0 then trfrm_cmp
          else Pol.Dfa.State.compare pol_state_0 pol_state_1
      end)

  let priv_trfrm_key_to_string (host_trfrm, pol_state) =
    "prim. trfrm:\n" ^ (Hst.trfrm_to_string host_trfrm) ^ "\n" 
    ^ "pol. state: " ^ (Pol.Dfa.state_to_string pol_state) ^ "\n"

  (* Pol_state_map: a map over policy states. *)
  module Pol_state_map = Map.Make(Pol.Dfa.State)

  (* priv_guard: a map from a policy state to a set of privilege
   * lattices. *)
  type priv_guard = Priv_lats.t Pol_state_map.t

  let cmp_priv_guard = Pol_state_map.compare Priv_lats.compare

  let priv_trfrms_to_string priv_trfrms =
    let guard_to_string = 
      map_to_string
        Pol_state_map.fold 
        Pol.Dfa.state_to_string
        (set_to_string Priv_lats.fold Pol.Lat_ops.lat_to_string) in
    map_to_string
      Priv_trfrms.fold
      priv_trfrm_key_to_string
      guard_to_string
      priv_trfrms

  let att_state_to_string (proj_state, priv_trfrms) =
    "prog. state: "
    ^ (Program.Prog_sevpa.state_to_string proj_state)
    ^ "\npriv trfrms.:\n" ^ (priv_trfrms_to_string priv_trfrms)

  (* game_state: a game state is a program state paired with a set
   * of privilege transforms. *)
  type game_state = Prog_sevpa.state * (priv_guard Priv_trfrms.t)

  module Game_state =
  struct
    type t = game_state
    let compare
        ((prog_0, trfrm_0) as att_state_0) ((prog_1, trfrm_1) as att_state_1) =
      let prog_cmp = compare prog_0 prog_1 in
      if prog_cmp != 0 then prog_cmp
      else Priv_trfrms.compare cmp_priv_guard trfrm_0 trfrm_1
  end
  module Game_states = Set.Make(Game_state)

  (* def_state: each Defender state of the game is a normal state or
   * the accepting state. *)
  type def_state =
      Game_non_acc of game_state
    | Game_acc

  module Def_state =
  struct
    type t = def_state
    let compare state_0 state_1 =
      (match state_0, state_1 with
          Game_non_acc(att_state_0), Game_non_acc(att_state_1) ->
            Game_state.compare att_state_0 att_state_1
        | Game_non_acc(_), _ -> -1
        | Game_acc, Game_acc -> 0
        | Game_acc, _ -> 1
      )
        
  end
  module Def_states = Set.Make(Def_state)

  let def_state_to_string def_state =
    (match def_state with
        Game_non_acc(game_state) -> att_state_to_string game_state
      | Game_acc -> "ACC"
    )

  (* Instantiate the game and strategy SEVPA's. *)
  module Game_sevpas =
    Game_abs(
      struct
        module Comp_att_int = Prog_sevpa.Internal
        module Comp_att_ints = Prog_sevpa.Internals

        module Comp_def_int = Hst.Prim
        module Comp_def_ints = Hst.Prims

        module Comp_call = Prog_sevpa.Call
        module Comp_calls = Prog_sevpa.Calls

        module Comp_mod_ids = Prog_sevpa.Mod_ids
        module Comp_mod_map = Prog_sevpa.Mod_id_map

        module Comp_att_state = Game_state
        module Comp_att_states = Game_states

        module Comp_def_state = Def_state
        module Comp_def_states = Def_states
          
        let comp_att_int_to_string = Prog_sevpa.internal_to_string
        let comp_def_int_to_string = Hst.prim_to_string
        let comp_call_to_string = Prog_sevpa.call_to_string

        let comp_att_state_to_string = att_state_to_string
            
        let comp_def_state_to_string = def_state_to_string
      end
    )

  (* Alias shorthands for Game and Strategy. *)
  type game = Game_sevpas.game
  type strat = Game_sevpas.def_strategy

  (* cons_internal_index: for a given strategy, map each internal
   * action to an integer index. *)
  let cons_internal_index strat_ints internal =
    let int_map =
      Game_sevpas.Att_ints.fold
        (fun att_int internal_index ->
          Prog_sevpa.Internal_map.add
            att_int
            (Prog_sevpa.Internal_map.cardinal internal_index)
            internal_index
        )
        strat_ints
        Prog_sevpa.Internal_map.empty in
    Prog_sevpa.Internal_map.find internal int_map

  (* cons_mod_index: for a given strategy, map each module to an
   * integer index. *)
  let cons_mod_index strat_mods modul =
    let mod_map =
      Prog_sevpa.Mod_ids.fold
        (fun modul mod_index ->
          Prog_sevpa.Mod_id_map.add
            modul
            (Prog_sevpa.Mod_id_map.cardinal mod_index) 
            mod_index
        )
        strat_mods
        Prog_sevpa.Mod_id_map.empty in
    Prog_sevpa.Mod_id_map.find modul mod_map 

  (* gen_instr_state: takes as input:
   * 
   * -hst_monitor: a host monitor
   * 
   * -strat: a winning Defender strategy
   * 
   * Constructs:
   * 
   * Mutates instr_store to hold an executable representation of the
   * strategy.
   * 
   *)
  let gen_instr_state hst_monitor strat internal_index mod_index prog_nm =
    (* instr_store: an LLVM module that holds instrumentation
     * functions and global tables. *)
    let instr_store =
      Llvm.create_module (Llvm.create_context ()) "instr_store" in
    Llvm.set_target_triple "x86_64-unknown-freebsd9.0" instr_store;
    let instr_ctx = Llvm.module_context instr_store in
    let int_ty = Llvm.i32_type instr_ctx in
    let state_index =
      Game_sevpas.Strat_states.fold
        (fun state state_index -> 
          let indx = Game_sevpas.Strat_state_map.cardinal state_index in
          let prog_indx = Llvm.const_int int_ty indx in
          Game_sevpas.Strat_state_map.add state prog_indx state_index
        )
        strat.Game_sevpas.states
        Game_sevpas.Strat_state_map.empty in

    let llvm_internal_index internal = 
      Llvm.const_int int_ty (internal_index internal) in

    (* internal_arr_ty: type of an array with one entry for every
     * internal. *)
    let num_internals = 
      Game_sevpas.Att_ints.cardinal strat.Game_sevpas.att_ints in
    
    (* Initialize global holding the number of internals. *)
    let _ = 
      Llvm.define_global
        "num_internals" (Llvm.const_int int_ty num_internals) instr_store in
    
    (* ptr_void_to_void: pointer to a function type from void to
     * void. *)
    let void_ptr = Llvm.pointer_type (Llvm.i8_type instr_ctx) in
    let void_to_void = Llvm.function_type (Llvm.void_type instr_ctx) [| |] in
    let ptr_void_to_void = Llvm.pointer_type void_to_void in
    
    (* prim_to_llvm: the Host code generator. *)
    let prim_to_llvm = Hst.cons_code_gen hst_monitor instr_store in

    (* Generate parallel arrays that represent the internal
     * transition table. *)
    (* Construct arrays of LLVM values. *)
    let (pre_arr, internal_arr, prim_arr, post_arr) =
      (* For each strategy state: *)
      Game_sevpas.Strat_states.fold
        (fun pre_state arrs ->
          (* For each internal enabled in the current state: *)
          Game_sevpas.Att_ints.fold
            (fun att_int (pre_arr, internal_arr, prim_arr, post_arr) ->
              let internal_const = llvm_internal_index att_int in
              let prim =
                strat.Game_sevpas.int_action_choice pre_state att_int in
              let post_state = 
                strat.Game_sevpas.int_state_choice pre_state att_int in
              (Array.append
                 pre_arr
                 [| Game_sevpas.Strat_state_map.find
                     pre_state state_index |],
               Array.append internal_arr [| internal_const |],
               Array.append prim_arr [| prim_to_llvm prim |],
               Array.append
                 post_arr
                 [| Game_sevpas.Strat_state_map.find
                     post_state state_index |])
            )
            (strat.Game_sevpas.enabled_att_ints pre_state)
            arrs
        )
        strat.Game_sevpas.states
        ([| |], [| |], [| |], [| |]) in
    let num_trans = Array.length pre_arr in

    (* Define global arrays of state and action codes. *)
    let _ = 
      Llvm.define_global
        "int_trans_pres" (Llvm.const_array int_ty pre_arr) instr_store in
    let _ =
      Llvm.define_global
        "int_trans_acts" (Llvm.const_array int_ty internal_arr) instr_store in
    let _ =
      Llvm.define_global
        "int_trans_prims"
        (Llvm.const_array ptr_void_to_void prim_arr) 
        instr_store in
    let _ =
      Llvm.define_global
        "int_trans_posts" (Llvm.const_array int_ty post_arr) instr_store in
    let _ =
      Llvm.define_global
        "num_int_trans" (Llvm.const_int int_ty num_trans) instr_store in
    
    (* Generate arrays representing call transitions. *)
    let strat_mods = Game_sevpas.strat_mod_ids strat in
    let num_calls = Game_sevpas.Mod_ids.cardinal strat_mods in
    dbg "functions to instrument: ";
    Game_sevpas.Mod_ids.iter
      (fun modul -> 
        (match modul with
            Entry_mod -> dbg "main";
          | Call_mod(call) -> dbg (Game_sevpas.call_to_string call)
        )
      )
      strat_mods;

    (* Populate the call array. *)
    let null_ptr = Llvm.const_null void_ptr in

    (* Populate the primitives array. *)
    let call_prims = Array.make num_calls null_ptr in
    Game_sevpas.Mod_ids.iter
      (fun modul ->
        let index = mod_index modul in
        let llvm_prim =
          (match modul with
              Entry_mod -> prim_to_llvm strat.Game_sevpas.init_act
            | Call_mod(call) -> 
              prim_to_llvm (strat.Game_sevpas.mod_action_choice call)
          ) in
        Array.set call_prims index llvm_prim
      )
      strat_mods;

    (* Populate the chosen-states array. *)
    let call_posts = Array.make num_calls (Llvm.const_null int_ty) in
    Game_sevpas.Mod_ids.iter
      (fun modul ->
        let post_code =
          (match modul with
              Entry_mod ->
                Game_sevpas.Strat_state_map.find
                  strat.Game_sevpas.init_state state_index
            | Call_mod(call) ->
              let post_state = strat.Game_sevpas.mod_state_choice call in
              Game_sevpas.Strat_state_map.find post_state state_index
          ) in
        let index = mod_index modul in
        Array.set call_posts index post_code
      )
      strat_mods;

    (* Construct LLVM arrays representing call transitions. *)
    let num_trans =
      (Game_sevpas.Calls.cardinal strat.Game_sevpas.calls) + 1 in
    let _ =
      Llvm.define_global
        "call_trans_prims"
        (Llvm.const_array ptr_void_to_void call_prims) 
        instr_store in
    let _ =
      Llvm.define_global
        "call_trans_posts"
        (Llvm.const_array int_ty call_posts)
        instr_store in
    let _ =
      Llvm.define_global
        "num_calls" (Llvm.const_int int_ty num_trans) instr_store in

    (* Construct arrays representing return transitions. *)
    let (ret_pres, ret_stacks, ret_prims, ret_posts) =
      (* For each stack state: *)
      Game_sevpas.Strat_states.fold
        (fun pre arrs ->
          let pre_const = 
            Game_sevpas.Strat_state_map.find pre state_index in
          (* For each pre state: *)
          Game_sevpas.Strat_states.fold
            (fun stack
              ((ret_pres, ret_stacks, ret_prims, ret_posts) as arrs) ->
                let stack_const =
                  Game_sevpas.Strat_state_map.find stack state_index in 
                try
                  let llvm_prim =
                    let prim =
                      strat.Game_sevpas.ret_action_choice pre stack in
                    prim_to_llvm prim in
                  let post_const = 
                    let post =
                      strat.Game_sevpas.ret_state_choice pre stack in
                    Game_sevpas.Strat_state_map.find
                      post state_index in
                  (Array.append ret_pres [| pre_const |],
                   Array.append ret_stacks [| stack_const |],
                   Array.append ret_prims [| llvm_prim |],
                   Array.append ret_posts [| post_const |])
                with Not_found -> arrs
            )
            strat.Game_sevpas.states
            arrs
        )
        strat.Game_sevpas.states
        ([| |], [| |], [| |], [| |]) in

    (* From the arrays of LLVM objects, construct LLVM arrays. *)
    let num_trans = Array.length ret_pres in
    let _ =
      Llvm.define_global
        "ret_trans_pres" (Llvm.const_array int_ty ret_pres) instr_store in
    let _ =
      Llvm.define_global
        "ret_trans_stacks"
        (Llvm.const_array int_ty ret_stacks) 
        instr_store in
    let _ =
      Llvm.define_global
        "ret_trans_prims"
        (Llvm.const_array ptr_void_to_void ret_prims)
        instr_store in
    let _ =
      Llvm.define_global
        "ret_trans_posts"
        (Llvm.const_array int_ty ret_posts) 
        instr_store in
    let _ = 
      Llvm.define_global
        "num_ret_trans" (Llvm.const_int int_ty num_trans) instr_store in

    (* Validate the generated LLVM instrumentation state. *)
    Llvm_analysis.assert_valid_module instr_store;
    
    (* Write the instrumentation store to a file. *)
    (* Write the weaved program out to a bitcode file. *)
    let bc_out = prog_nm ^ ".instr_store.bc" in
    let write_succ = Llvm_bitwriter.write_bitcode_file instr_store bc_out in
    if write_succ then ()
    else failwith ("failed to write bitcode to " ^ bc_out)
      
  (* wp_lats: extend a wp operator over privilege lattices to
   * sets of privilege lattices. *)
  let wp_lats wp trfrm post_lats =
    Priv_lats.fold
      (fun post_lat pre_lats -> Priv_lats.add (wp trfrm post_lat) pre_lats)
      post_lats
      Priv_lats.empty

  (* empty_pol_map: map from each policy state to an empty set of
   * lattices. *)
  let empty_pol_map pol =
    Pol.Dfa.States.fold
      (fun post -> Pol_state_map.add post Priv_lats.empty)
      pol.Pol.dfa.Pol.Dfa.en_states
      Pol_state_map.empty

  (* merge_pol_maps: merge two maps from policy states to sets of
   * lattices. *)
  let merge_pol_maps pol =
    Pol_state_map.merge
      (fun pol_state lats_0_opt lats_1_opt ->
        let none_to_empty lats_opt =
          (match lats_opt with
              Some(lats) -> lats
            | None -> Priv_lats.empty
          ) in
        Some(
          Pol.Lat_ops.union_lat_sets 
            (none_to_empty lats_0_opt)
            (none_to_empty lats_1_opt))
      )
  
  let weak_upd_priv_trfrms pol cur_state pre_map priv_trfrms =
    let cur_pre_map =
      if Priv_trfrms.mem cur_state priv_trfrms then
        Priv_trfrms.find cur_state priv_trfrms
      else empty_pol_map pol in
    Priv_trfrms.add
      cur_state (merge_pol_maps pol pre_map cur_pre_map) priv_trfrms
    
  (* compose_ret_trfrms: compose privilege transforms over a return
   * transition. *)
  let compose_ret_trfrms host_monitor pol pre_trfrms stack_trfrms =
    (* For each privilege-transform in the pre-state: *)
    Priv_trfrms.fold
      (fun (pre_trfrm, pre_pol_state) pre_priv_guards priv_trfrms ->
         (* For each privilege-transform in the stack state: *)
         Priv_trfrms.fold
           (fun (stack_trfrm, stack_pol_state) stack_priv_guards priv_trfrms ->
             (* comp_trfrm_opt: the composition of the pre and stack
              * transforms. *)
             let comp_trfrm_opt = 
               host_monitor.Hst.ret_compose_transforms pre_trfrm stack_trfrm in
             
             (match comp_trfrm_opt with
                 Some(comp_trfrm) ->
                   (* callee_lat_pres: pre-image of the pre-module
                    * lattices. *)
                   let callee_lat_pres =
                     let pre_lats =
                       Pol_state_map.find stack_pol_state pre_priv_guards in
                     wp_lats
                       host_monitor.Hst.stack_wp_transform
                       stack_trfrm
                       pre_lats in

                   (* comp_stack_guard': the privilege guard for the
                    * composition. *)
                   let comp_stack_guard =
                     Pol_state_map.map
                       (fun stack_priv_lats ->
                         (* comp_lats: composed lattices. *)
                         Pol.Lat_ops.intersect_lat_sets 
                           stack_priv_lats callee_lat_pres
                       )
                       stack_priv_guards in
                   weak_upd_priv_trfrms
                     pol
                     (comp_trfrm, pre_pol_state)
                     comp_stack_guard
                     priv_trfrms
               | None ->
                 (* If the composition of host transforms isn't
                  * defined, then don't add any transforms. *)
                 priv_trfrms
             )
           )
           stack_trfrms
           priv_trfrms
      )
      pre_trfrms
      Priv_trfrms.empty

  (* compose_all_pairs: compose all prim transforms in the first set
   * with all transforms in the second set. *)
  let compose_all_pairs host_monitor fst_trfrms sec_trfrms =
    Hst.Host_trfrms.fold
      (fun fst_trfrm fst_acc ->
         Hst.Host_trfrms.fold
           (fun sec_trfrm sec_acc ->
              let comp_trfrm =
                host_monitor.Hst.int_compose_transforms fst_trfrm sec_trfrm in
                (match comp_trfrm with
                     Some(composition) ->
                       Hst.Host_trfrms.add composition sec_acc
                   | None -> sec_acc
                )
           )
           sec_trfrms
           Hst.Host_trfrms.empty
      )
      fst_trfrms
      Hst.Host_trfrms.empty

  type mod_state_opt =
      Entry_front of Game_sevpas.Def_state.t        
    | Call_front of Game_sevpas.Call.t * Game_sevpas.Def_state.t
    | No_front

  module Callers =
    Set.Make(
      struct
        type t = Game_sevpas.Att_state.t * Game_sevpas.vpa_mod_id
        let compare (att_state_0, id_0) (att_state_1, id_1) =
          let state_cmp = 
            Game_sevpas.Att_state.compare att_state_0 att_state_1 in
            if state_cmp != 0 then state_cmp
            else compare id_0 id_1
      end
    )

  (* cons_game: given a program, policy, and host monitor, construct a
   * policy-weaving game. *)
  let cons_game prog pol host_monitor =
    (* pol_dfa: local alias for the policy SEVPA. *)
    let pol_dfa = pol.Pol.dfa in

    (* canon_att_state: canonicalize an Attacker state. *)
    let canon_att_state (prog_state, priv_trfrms) =
      let priv_trfrms' =
        (* merged_trfrms: merge the lattice guards of each transform
         * per host-transform-state. *)
        let merged_trfrms =
          Priv_trfrms.map
            (Pol_state_map.map Pol.Lat_ops.merge_lats) priv_trfrms in

        (* non_empty_trfrms: filter transforms with non-empty lattices
         * and non-accepting states of the policy. *)
        let non_empty_trfrms =
          let feas_state_map =
            Pol_state_map.exists
              (fun _ lats -> not (Priv_lats.is_empty lats)) in
          Priv_trfrms.filter
            (fun _ pre_map -> feas_state_map pre_map) merged_trfrms in

        (* prog_is_entry: the state is in an entry module of the
         * program. *)
        let prog_is_entry =
          let (entry_states, _, _) = prog.Prog_sevpa.sevpa_entry_mod in
          Prog_sevpa.States.mem prog_state entry_states in

        (* If composition builds a transform in the entry module: *)
        if prog_is_entry then
          Priv_trfrms.filter
            (fun (trfrm, pol_state) pre_map ->
              let are_entry_lats =
                host_monitor.Hst.is_entry_priv_lats
                  (Pol_state_map.find pol_dfa.Pol.Dfa.en_init pre_map) in
              let is_entry_trfrm = host_monitor.Hst.is_entry_trfrm trfrm in
              are_entry_lats && is_entry_trfrm
            )
            non_empty_trfrms
        else non_empty_trfrms in
      (prog_state, priv_trfrms') in

    (* is_gm_acc: takes a Defender state as input. Decides if the
     * state really represents an accepting state of the game. *)
    let is_gm_acc def_state =
      (match def_state with
          Game_non_acc((_, priv_trfrms)) -> Priv_trfrms.is_empty priv_trfrms
        | Game_acc -> true
      ) in
    
    (* canon_def_state: canonicalize a Defender game state. *)
    let canon_def_state def_state =
      (match def_state with
          Game_non_acc(att_state) ->
            let canon_def = Game_non_acc(canon_att_state att_state) in
            if is_gm_acc canon_def then Game_acc else canon_def
        | Game_acc -> Game_acc
      ) in
    
    (* gm_att_ints: the Attacker internal actions are the program
     * intraprocedural instructions. *)
    let gm_att_ints = prog.Prog_sevpa.sevpa_ints in

    (* gm_def_ints: the Defender internal actions are the Capiscum
     * primitives. *)
    let gm_def_ints = host_monitor.Hst.prims in

    (* gm_calls: the call actions are the call actions of the
     * program. *)
    let gm_calls = prog.Prog_sevpa.sevpa_calls in

    (* id_to_prog_mod: given a module ID, find the program module. *)
    let id_to_prog_mod mod_id =
      (match mod_id with
          Entry_mod -> prog.Prog_sevpa.sevpa_entry_mod
        | Call_mod(call) -> prog.Prog_sevpa.sevpa_call_mod call
      ) in

    (* gm_state_is_exit: decide if a game state is an exit state of
     * its module. *)
    let gm_state_is_exit mod_id (prog_state, _) =
      let (_, _, prog_exits) = id_to_prog_mod mod_id in
      Prog_sevpa.States.mem prog_state prog_exits in

    (* cons_enabled_atts: takes a game Attacker state as input,
     * constructs the set of Attacker internal actions enabled for the
     * state. *)
    let cons_enabled_atts (prog_state, _) = 
      prog.Prog_sevpa.sevpa_int_enabled prog_state in

    (* cons_enabled_defs: takes a game Defender state as input,
     * construct the set of Defender internal actions enabled for the
     * state. *)
    let cons_enabled_defs def_state =
      (match def_state with
          Game_non_acc(prog_state, priv_trans) ->
            Priv_trfrms.fold
              (fun (host_trfrm, pol_state) _ ->
                Hst.Prims.union
                  (host_monitor.Hst.enabled_prims
                     prog_state pol_state host_trfrm)
              )
              priv_trans
              Hst.Prims.empty
        | Game_acc -> Game_sevpas.Def_ints.empty
      ) in

    (* cons_enabled_calls: takes as input an Attacker game state,
     * constructs the set of all calls enabled for the state. *)
    let cons_enabled_calls (prog_state, _) = 
      prog.Prog_sevpa.sevpa_call_enabled prog_state in

    (* cons_ret_succ: takes a game pre-state and stack state,
     * constructs the successor of the two states on the game's return
     * transition. *)
    let cons_ret_succ (pre_prog, pre_trfrms) (stack_prog, stack_trfrms) =
      let prog_state' =
        prog.Prog_sevpa.sevpa_return_trans pre_prog stack_prog in
      let priv_trfrms' =
        compose_ret_trfrms host_monitor pol pre_trfrms stack_trfrms in

      (* If the constructed state is non-accepting, then directly
       * construct a Defender state from it. Otherwise, directly
       * construct an accepting state. *)
      let raw_return = Game_non_acc(prog_state', priv_trfrms') in
      canon_def_state raw_return in

    (* Construct the set of Attacker and Defender states, Attacker
     * internal transition function, Defender internal transition
     * function, and return transition function. *)
    let (gm_full_entry_mod,
         gm_full_call_mods,
         att_en_map,
         def_en_map,
         call_en_map,
         gm_att_int_trans_map,
         gm_def_int_trans_map,
         gm_return_trans_map) =
      (* DBG: for profiling. *)
      let state_count = ref 0 in

      (* lazy_game_cons: lazily construct the game. *)
      let rec lazy_game_cons
          entry_mod
          call_mods
          att_int_en
          def_int_en
          call_en
          att_int_trans_map
          def_int_trans_map
          ret_trans_map
          call_to_callers =
        (* chosen_state_opt: a Defender state on the frontier and a
         * call that identifies its module, if such a state exists. *)
        let chosen_state_opt =
          (* Check if the frontier of the entry module is empty. *)
          let (_, _, _, _, entry_frontier) = entry_mod in
          if Game_sevpas.Def_states.is_empty entry_frontier then
            let mod_state_opt =
              Game_sevpas. Call_trans_map.fold
                (fun call (_, _, _, _, call_front) mod_state_opt ->
                  (match mod_state_opt with
                      Some(_) -> mod_state_opt
                    | None ->
                      let non_empty_front =
                        not
                          (Game_sevpas.Def_states.is_empty call_front) in
                      if non_empty_front then
                        Some((call,
                              Game_sevpas.Def_states.choose call_front))
                      else None
                  )
                )
                call_mods
                None in
            (match mod_state_opt with
                Some((call, state)) -> Call_front(call, state)
              | None -> No_front
            )
          else Entry_front(Game_sevpas.Def_states.choose entry_frontier) in

        (* upd_chosen_module: takes a game module, program module, and
         * chosen Defender state in the frontier of the module.
         * 
         * Updates the module with internal transitions out of the
         * chosen state and return transitions in which the chosen
         * state is the stack state. *)
        let upd_chosen_module
            call_to_callers
            (att_states, def_states, init, exit_states, frontier)
            mod_id
            chosen_state =

          (* no_choose_frontier: frontier with the chosen state removed. *)
          let no_choose_frontier = 
            Game_sevpas.Def_states.remove chosen_state frontier in

          (* succ_int_en: the enabled internals of the chosen
           * state. *)
          let chosen_int_en = cons_enabled_defs chosen_state in

          (* def_int_en': updated map of enabled Defender actions. *)
          let def_int_en' = 
            Game_sevpas.Def_state_map.add
              chosen_state chosen_int_en def_int_en in
          
          (* att_succs: Attacker-state successors along internal
           * transitions. *)
          let (att_succs, def_int_trans_map') =
            (match chosen_state with
                Game_non_acc(def_prog, def_trfrms) ->
                  (* For each primitive: *)
                  Hst.Prims.fold
                    (fun prim (succ_att_states, def_int_trans_map') ->
                      let att_succ =
                        (* prim_trfrms: the host transforms of prim. *)
                        let prim_trfrms =
                          host_monitor.Hst.prim_to_transforms prim in

                        (* def_trfrms': composed transforms. *)
                        let def_trfrms' =
                          (* For each original priv transform: *)
                          Priv_trfrms.fold
                            (fun (trfrm, post_state) pre_map front_acc ->
                              (* Compose the transform from the
                               * frontier priv transform with the
                               * transforms in the primitive
                               * transform. *)
                              let host_trfrms' =
                                compose_all_pairs
                                  host_monitor
                                  (Hst.Host_trfrms.singleton trfrm)
                                  prim_trfrms in

                              (* Lift each composed host transform to
                               * a privileged transform. *)
                              Hst.Host_trfrms.fold
                                (fun trfrm' acc' ->
                                  Priv_trfrms.add
                                    (trfrm', post_state) pre_map acc'
                                )
                                host_trfrms'
                                front_acc
                            )
                            def_trfrms
                            Priv_trfrms.empty in
                        canon_att_state (def_prog, def_trfrms') in
                      (Game_states.add att_succ succ_att_states,
                       Game_sevpas.Def_int_trans_map.add
                         (chosen_state, prim) att_succ def_int_trans_map')
                    )
                    chosen_int_en
                    (Game_states.empty, def_int_trans_map)
              | Game_acc ->
                (Game_sevpas.Att_states.empty, def_int_trans_map)
            ) in

          (* unseen_att_succs: Attacker successor states that have
           * never been seen. *)
          let unseen_att_succs = 
            Game_sevpas.Att_states.diff att_succs att_states in

          (* att_states': add all new Attacker states to the
           * current set of Attacker states. *)
          let att_states' =
            Game_sevpas.Att_states.union att_states unseen_att_succs in

          (* exits': updated set of exit states for the
           * module. *)
          let exits' =
            let unseen_exits =
              Game_sevpas.Att_states.filter
                (gm_state_is_exit mod_id) unseen_att_succs in
            Game_sevpas.Att_states.union
              exit_states unseen_exits in

          (* att_int_en': updated mapping from each Attacker
           * state to enabled internals. *)
          let att_int_en' =
            Game_sevpas.Att_states.fold
              (fun att_state att_int_en ->
                Game_sevpas.Att_state_map.add
                  att_state (cons_enabled_atts att_state) att_int_en
              )
              unseen_att_succs
              att_int_en in
          
          (* call_en': updated mapping from each Attacker state
           * to enabled calls. *)
          let call_en' =
            Game_sevpas.Att_states.fold
              (fun att_state ->
                let calls = cons_enabled_calls att_state in
                Game_sevpas.Att_state_map.add att_state calls 
              )
              unseen_att_succs
              call_en in

          (* call_to_callers': updated map from each call to
           * the states that act as its callers. *)
          let call_to_callers' =
            (* For each new Attacker state: *)
            Game_sevpas.Att_states.fold
              (fun att_state call_to_callers' ->
                 (* For each call enabled for the Attacker state: *)
                let en_calls = 
                  Game_sevpas.Att_state_map.find att_state call_en' in
                Game_sevpas.Calls.fold
                  (fun call call_to_callers' ->
                    let callers =
                      Game_sevpas.Call_trans_map.find
                        call call_to_callers' in
                    let callers' =
                      Callers.add
                        (att_state, mod_id) callers in
                    Game_sevpas.Call_trans_map.add
                      call callers' call_to_callers'
                  )
                  en_calls
                  call_to_callers'
              )
              unseen_att_succs
              call_to_callers in
          
          (* int_succs: the Defender states that are internal
           * successors of the Attacker succs. *)
          let (int_succs, att_int_trans_map') =
            (* For each Attacker successor state: *)
            Game_sevpas.Att_states.fold
              (fun ((att_prog, att_trfrms) as att_succ) succ_acc ->
                let state_en_int =
                  Game_sevpas.Att_state_map.find att_succ att_int_en' in
                (* For each program internal action: *)
                Prog_sevpa.Internals.fold
                  (fun instr (int_succs', att_int_trans_map') ->
                    (* def_succ: the successor Defender state on
                     * instr. *)
                    let def_succ =
                      (* def_prog: the successor program state on the
                       * instruction. *)
                      let def_prog =
                        prog.Prog_sevpa.sevpa_int_trans att_prog instr in

                      (* priv_trfrms: updated privilege transforms. *)
                      let priv_trfrms =
                        (* For each priv. transform in the game
                         * state: *)
                        Priv_trfrms.fold
                          (fun (trfrm, pol_state) pre_map priv_trfrms ->
                            let trans_lats = 
                              pol.Pol.pol_state_instr_lats pol_state instr in

                            (* post_to_lats: map each post of the
                             * current policy state to the set of
                             * lattices that must be satisfied for the
                             * state to be reached. *)
                            let post_to_lats =
                              Priv_lats.fold
                                (fun trans_lat trans_acc ->
                                  (* pol_state': the post state of the
                                   * current policy state. *)
                                  let pol_state' =
                                    pol_dfa.Pol.Dfa.en_trans
                                      pol_state (instr, trans_lat) in

                                  Pol_state_map.add
                                    pol_state'
                                    (Priv_lats.add
                                       trans_lat
                                       (Pol_state_map.find
                                          pol_state' trans_acc))
                                    trans_acc
                                )
                                trans_lats
                                (empty_pol_map pol) in

                            (* For each policy state, take the
                             * pre-image over the state transform. *)
                            Pol_state_map.fold
                              (fun post lats priv_trfrms ->
                                let w_lats =
                                  wp_lats
                                    host_monitor.Hst.wp_transform
                                    trfrm
                                    lats in
                                let pre_map' =
                                  Pol_state_map.map
                                    (Pol.Lat_ops.intersect_lat_sets w_lats)
                                    pre_map in
                                weak_upd_priv_trfrms
                                  pol (trfrm, post) pre_map' priv_trfrms
                              )
                              post_to_lats
                              priv_trfrms
                          )
                          att_trfrms
                          Priv_trfrms.empty in
                      
                      (* succ_trfrms: update the state of the host
                       * with the effect of the program instruction. *)
                      let succ_trfrms = 
                        let instr_trfrms =
                          host_monitor.Hst.instr_to_transforms instr in
                        (* For each transform with updated
                         * privileges: *)
                        Priv_trfrms.fold
                          (fun (trfrm, pol_state) pre_map full_trfrms ->
                            (* Compose transforms with the instruction
                             * transforms. *)
                            let comp_trfrms =
                              compose_all_pairs
                                host_monitor
                                (Hst.Host_trfrms.singleton trfrm)
                                instr_trfrms in

                            (* Construct all of the resulting
                             * privilege transforms. *)
                            Hst.Host_trfrms.fold
                              (fun comp_trfrm priv_trfrms ->
                                weak_upd_priv_trfrms
                                  pol
                                  (comp_trfrm, pol_state)
                                  pre_map
                                  priv_trfrms
                              )
                              comp_trfrms
                              full_trfrms
                          )
                          priv_trfrms
                          Priv_trfrms.empty in

                      let full_def_state =
                        Game_non_acc(def_prog, succ_trfrms) in
                      canon_def_state full_def_state in

                    (Game_sevpas.Def_states.add def_succ int_succs',
                     Game_sevpas.Att_int_trans_map.add
                       (att_succ, instr)
                       def_succ
                       att_int_trans_map')
                  )
                  state_en_int
                  succ_acc
              )
              unseen_att_succs
              (Game_sevpas.Def_states.empty, att_int_trans_map) in

          (* Extend the game with all transitions for which
           * the chosen state is stack state. *)
          let (stack_succs, ret_trans_map') =
            (* For each Attacker state: *)
            Game_sevpas.Att_states.fold
              (fun att_state state_acc ->
                (* For each call enabled for the Attacker
                 * state: *)
                Game_sevpas.Calls.fold
                  (fun call call_acc ->
                    let (_, _, _, exits, _) =
                      Game_sevpas.Call_trans_map.find call call_mods in
                    (* For each exit of the callee: *)
                    Game_sevpas.Att_states.fold
                      (fun exit_state
                        (stack_succs, ret_trans_map) ->
                          (* ret_succ: the return successor. *)
                          let ret_succ =
                            cons_ret_succ exit_state att_state in

                          (* dbg ret_succ; *)
                          let stack_succs' =
                            Game_sevpas.Def_states.add
                              ret_succ stack_succs in
                          let ret_trans_map' =
                            Game_sevpas.Return_trans_map.add
                              (exit_state, att_state)
                              ret_succ
                              ret_trans_map in
                          (stack_succs', ret_trans_map')
                      )
                      exits
                      call_acc
                  )
                  (Game_sevpas.Att_state_map.find att_state call_en')
                  state_acc
              )
              unseen_att_succs
              (Game_sevpas.Def_states.empty, ret_trans_map) in

          (* frontier': updated frontier: the old frontier and
           * all new states that haven't been seen. *)
          let frontier' =
            let def_succs = 
              Game_sevpas.Def_states.union int_succs stack_succs in
            Game_sevpas.Def_states.union
              no_choose_frontier
              (Game_sevpas.Def_states.diff def_succs def_states) in

          (* def_states': updated set of Defender states for
           * the module. *)
          let def_states' =
            Game_sevpas.Def_states.union def_states frontier' in

            (* Construct the updated module and friends. *)
          ((att_states', def_states', init, exits', frontier'),
           att_int_en',
           def_int_en',
           call_en',
           att_int_trans_map',
           def_int_trans_map',
           ret_trans_map',
           call_to_callers',
           unseen_att_succs) in

        (match chosen_state_opt with
            Entry_front(chosen_state) ->
              (* Update the entry module. *)
              let (entry_mod',
                   att_int_en',
                   def_int_en',
                   call_en',
                   att_int_trans_map',
                   def_int_trans_map',
                   ret_trans_map',
                   call_to_callers',
                   _) =
                upd_chosen_module
                  call_to_callers entry_mod Entry_mod chosen_state in

              (* Recurse. *)
              lazy_game_cons
                entry_mod'
                call_mods
                att_int_en'
                def_int_en'
                call_en'
                att_int_trans_map'
                def_int_trans_map'
                ret_trans_map'
                call_to_callers'
          | Call_front(chosen_call, chosen_state) ->
            (* Update the chosen call module. *)
            let ((att_states', def_states', init, exits', frontier'),
                 att_int_en',
                 def_int_en',
                 call_en',
                 att_int_trans_map',
                 def_int_trans_map',
                 ret_trans_map',
                 call_to_callers',
                 att_succs) =
              upd_chosen_module
                call_to_callers
                (Game_sevpas.Call_trans_map.find chosen_call call_mods)
                (Call_mod(chosen_call))
                chosen_state in

            (* intra_mods: update the module map to map to the updated
             * call module. *)
            let intra_mods =
              Game_sevpas.Call_trans_map.add
                chosen_call
                (att_states', def_states', init, exits', frontier')
                call_mods in
            
            (* exit_succs: Attacker successor states that are
             * exit states of the module. *)
            let exit_succs =
              Game_sevpas.Att_states.inter att_succs exits' in

            (* upd_ret_mod: update a game module with a return
             * transition. *)
            let upd_ret_mod
                (att_states, def_states, init, exits, frontier)
                pre_state
                stack_state =
              (* frontier': the updated frontier of the
               * caller. *)
              let ret_succ = cons_ret_succ pre_state stack_state in
              let frontier' =
                let succ_is_seen =
                  Game_sevpas.Def_states.mem ret_succ def_states in
                if succ_is_seen then frontier
                else Game_sevpas.Def_states.add ret_succ frontier in

              (* def_states': the new Defender states for
               * the caller module. *)
              let def_states' =
                Game_sevpas.Def_states.add ret_succ def_states in
              (att_states, def_states', init, exits, frontier') in

            (* entry_mod_to_mods: update the entry module. *)
            let entry_mod_to_mods
                entry_mod call_mods pre_state stack_state =
              let entry_mod' =
                upd_ret_mod entry_mod pre_state stack_state in
              (entry_mod', call_mods) in
            
            (* call_mod_to_mods: update the call modules. *)
            let call_mod_to_mods
                call entry_mod call_mods pre_state stack_state =
              (* Fetch and deconstruct the caller module. *)
              let caller_mod =
                Game_sevpas.Call_trans_map.find call call_mods in
              let caller_mod' =
                upd_ret_mod caller_mod pre_state stack_state in
              (entry_mod,
               Game_sevpas.Call_trans_map.add 
                 call caller_mod' call_mods) in

            let (entry_mod', call_mods', ret_trans_map') =
              (* For each Attacker-state successor that is an
               * exit state: *)
              Game_sevpas.Att_states.fold
                (fun exit_succ att_acc ->
                  (* For each caller: *)
                  Callers.fold
                    (fun (caller, caller_id)
                      (entry_mod, call_mods, pre_ret_trans_map) ->
                        let mods_to_mods =
                          (match caller_id with
                              Entry_mod -> entry_mod_to_mods
                            | Call_mod(call) -> call_mod_to_mods call
                          ) in
                        (* ret_succ: the return successor. *)
                        let ret_succ = cons_ret_succ exit_succ caller in

                        (* pre_ret_trans_map': update the
                         * return transition map. *)
                        let pre_ret_trans_map' =
                          Game_sevpas.Return_trans_map.add
                            (exit_succ, caller)
                            ret_succ
                            pre_ret_trans_map in

                        (* Update the entry module and call
                         * module map. *)
                        let (entry_mod', call_mods') =
                          mods_to_mods
                            entry_mod call_mods exit_succ caller in
                        (entry_mod', call_mods', pre_ret_trans_map')
                    )
                    (Game_sevpas.Call_trans_map.find
                       chosen_call call_to_callers')
                    att_acc
                )
                exit_succs
                (entry_mod, intra_mods, ret_trans_map') in

            (* Recursively apply lazy_game_cons to the updated
             * objects. *)
            lazy_game_cons
              entry_mod'
              call_mods'
              att_int_en'
              def_int_en'
              call_en'
              att_int_trans_map'
              def_int_trans_map'
              ret_trans_map'
              call_to_callers'
          | No_front ->
            (* No states left in the frontier. Lazy construction is
             * closed. *)
            (entry_mod,
             call_mods,
             att_int_en,
             def_int_en,
             call_en,
             att_int_trans_map,
             def_int_trans_map,
             ret_trans_map)
        ) in
      
      (* id_map_full_lat: map pol_state to a set of lattices
       * containing a full lattice, and map every other state to an empty
       * set of lattices. *)
      let id_map_full_lat pol_state =
        Pol_state_map.add
          pol_state
          (Priv_lats.singleton pol.Pol.full_lattice)
          (empty_pol_map pol) in

      (* cons_fst_mod: construct the first state of a game module. *)
      let cons_fst_mod (_, prog_init, _) host_inits pol_states init_lat =
        let call_init =
          let priv_trfrms =
            (* For each host transform: *)
            Hst.Host_trfrms.fold
              (fun host_init ->
                (* For each policy state: *)
                Pol.Dfa.States.fold
                  (fun pol_state ->
                    Priv_trfrms.add
                      (host_init, pol_state)
                      (id_map_full_lat pol_state)
                  )
                  pol_states
              )
              host_inits
              Priv_trfrms.empty in
          canon_def_state (Game_non_acc(prog_init, priv_trfrms)) in
        let call_init_set = Game_sevpas.Def_states.singleton call_init in
        (Game_sevpas.Att_states.empty,
         call_init_set,
         call_init,
         Game_sevpas.Att_states.empty,
         call_init_set) in

      (* fst_entry_mod: initial entry module. *)
      let fst_entry_mod =
        cons_fst_mod
          prog.Prog_sevpa.sevpa_entry_mod
          (Hst.Host_trfrms.singleton host_monitor.Hst.trans_init)
          (Pol.Dfa.States.singleton pol_dfa.Pol.Dfa.en_init)
          host_monitor.Hst.entry_priv_lat in
      
      (* fst_call_mods: initial map from calls to modules. *)
      let fst_call_mods =
        Game_sevpas.Calls.fold
          (fun call fst_call_mods ->
            let fst_mod =
              cons_fst_mod
                (prog.Prog_sevpa.sevpa_call_mod call)
                host_monitor.Hst.trans_id
                pol_dfa.Pol.Dfa.en_states
                pol.Pol.full_lattice in
            Game_sevpas.Call_trans_map.add call fst_mod fst_call_mods
          )
          gm_calls
          Game_sevpas.Call_trans_map.empty in
      
      let empty_call_to_callers =
        Game_sevpas.Calls.fold
          (fun call call_to_callers ->
            Game_sevpas.Call_trans_map.add call Callers.empty call_to_callers
          )
          gm_calls
          Game_sevpas.Call_trans_map.empty in
      
      (* Lazily construct the game. *)
      lazy_game_cons
        fst_entry_mod
        fst_call_mods
        Game_sevpas.Att_state_map.empty
        Game_sevpas.Def_state_map.empty
        Game_sevpas.Att_state_map.empty
        Game_sevpas.Att_int_trans_map.empty
        Game_sevpas.Def_int_trans_map.empty
        Game_sevpas.Return_trans_map.empty
        empty_call_to_callers in

    (* gm_entry_mod: the entry module of the game. *)
    let gm_entry_mod =
      let (att_states, def_states, init, exits, _) = gm_full_entry_mod in
      (att_states, def_states, init, exits) in

    let call_mods_map =
      Game_sevpas.Call_trans_map.fold
        (fun call (att_states, def_states, init, exits, _) gm_mods ->
          Game_sevpas.Call_trans_map.add
            call (att_states, def_states, init, exits) gm_mods
        )
        gm_full_call_mods
        Game_sevpas.Call_trans_map.empty in
    let gm_call_mods call = 
      Game_sevpas.Call_trans_map.find call call_mods_map in

    (* gm_att_states: all Attacker states in the game. *)
    let gm_att_states =
      Game_sevpas.Call_trans_map.fold
        (fun _ (mod_att_states, _, _, _) att_states ->
          Game_sevpas.Att_states.union att_states mod_att_states
        )
        call_mods_map
        (let (entry_att_states, _, _, _) = gm_entry_mod in entry_att_states) in

    (* gm_def_states: all Attacker states in the game. *)
    let gm_def_states =
      Game_sevpas.Call_trans_map.fold
        (fun _ (_, mod_def_states, _, _) def_states ->
          Game_sevpas.Def_states.union def_states mod_def_states
        )
        call_mods_map
        (let (_, entry_def_states, _, _) = gm_entry_mod in entry_def_states) in

    let gm_att_int_en att_state =
      Game_sevpas.Att_state_map.find att_state att_en_map in
    
    let gm_def_int_en def_state = 
      Game_sevpas.Def_state_map.find def_state def_en_map in

    let gm_call_en att_state =
      Game_sevpas.Att_state_map.find att_state call_en_map in

    (* Define transition functions from each of the transition maps. *)
    let gm_att_int_trans att_state att_int =
      Game_sevpas.Att_int_trans_map.find
        (att_state, att_int) gm_att_int_trans_map in
    
    let gm_def_int_trans def_state def_int =
      Game_sevpas.Def_int_trans_map.find
        (def_state, def_int) gm_def_int_trans_map in

    let gm_return_trans pre_state stack_state =
      Game_sevpas.Return_trans_map.find
        (pre_state, stack_state) gm_return_trans_map in

    (* DBG: *)
    let def_prog_states =
      Game_sevpas.Def_states.fold
        (fun def_state def_prog_states ->
          (match def_state with
              Game_non_acc(prog_state, _) -> 
                Prog_sevpa.States.add prog_state def_prog_states
            | Game_acc -> def_prog_states
          )
        )
        gm_def_states
        Prog_sevpa.States.empty in
    print_endline 
      ("prog states wo def states:\n" 
       ^ (Libext.set_to_string 
            Prog_sevpa.States.fold
            Prog_sevpa.state_to_string
            (Prog_sevpa.States.diff
               prog.Prog_sevpa.sevpa_states def_prog_states)));

    (* Construct the final game. *)
    { Game_sevpas.gm_nm = "game";
      gm_att_ints = gm_att_ints;
      gm_def_ints = gm_def_ints;
      gm_calls = gm_calls;
      gm_att_states = gm_att_states;
      gm_def_states = gm_def_states;
      gm_acc_state = Game_acc;
      gm_entry_mod = gm_entry_mod;
      gm_call_mods = gm_call_mods;
      gm_att_enabled = gm_att_int_en;
      gm_def_enabled = gm_def_int_en;
      gm_call_enabled = gm_call_en;
      gm_att_int_trans = gm_att_int_trans;
      gm_def_int_trans = gm_def_int_trans;
      gm_return_trans = gm_return_trans;
    }

  module Att_states_map = Map.Make(Game_sevpas.Att_states)
    
  (* TODO: update this. *)
  let is_trusted call = true

  (* cons_interproc_ctrs: constrain states of an isolated Defender
   * strategy according by interprocedural rules. *)
  let cons_interproc_ctrs game att_to_var def_to_var =
    (* For each caller (Attacker) state: *)
    let (caller_conjs, _) =
      Game_sevpas.Att_states.fold
        (fun caller (caller_conjs, exits_to_var) ->
           (* For each enabled call of the caller: *)
           let (part_conjs, ret_conjs, exits_to_var') =
             Game_sevpas.Calls.fold
               (fun call (part_conjs, ret_conjs, exits_to_var) ->
                  let (_, _, _, exits) = 
                    game.Game_sevpas.gm_call_mods call in

                  (* Partition the exits of the module according to
                   * which return state they go to under the caller. *)
                  let exit_parts =
                    Game_sevpas.Att_states.fold
                      (fun exit_state exit_acc ->
                         (* ret_state: the returned-to state. *)
                         let ret_state =
                           game.Game_sevpas.gm_return_trans
                             exit_state caller in

                         let ret_part =
                           let has_part =
                             Game_sevpas.Def_state_map.mem ret_state exit_acc in
                             if has_part then
                               Game_sevpas.Def_state_map.find ret_state exit_acc
                             else Game_sevpas.Att_states.empty in
                           Game_sevpas.Def_state_map.add
                             ret_state
                             (Game_sevpas.Att_states.add exit_state ret_part)
                             exit_acc
                      )
                      exits
                      Game_sevpas.Def_state_map.empty in

                  (* exits_to_var': map from a set of exit states to
                   * their partition variable. *)
                  let (exits_to_var', call_part_conjs, call_ret_conjs) =
                    Game_sevpas.Def_state_map.fold
                      (fun ret_state part
                         (exits_to_var, call_part_conjs, call_ret_conjs) ->
                         let (exits_to_var', ret_part_conjs) =
                           if Att_states_map.mem part exits_to_var then
                             (exits_to_var, [| |])
                           else
                             (* part_var: a predicate variable for the
                              * partition. *)
                             let part_var =
                               let map_size =
                                 Att_states_map.cardinal exits_to_var in
                                 Z3.mk_const
                                   z3_ctx
                                   (Z3.mk_string_symbol
                                      z3_ctx
                                      ("part_" ^ (string_of_int map_size)))
                                   (Z3.mk_bool_sort z3_ctx) in

                             (* some_in_part: disjunctions of exit
                              * states being in the partition. *)
                             let some_in_part =
                               Game_sevpas.Att_states.fold
                                 (fun exit_state out_disjs ->
                                    Array.append
                                      out_disjs [| att_to_var exit_state |]
                                 )
                                 part
                                 [| |] in
                               
                             (* exit_imp_part: if an exit state in the
                              * partition is in the strategy, then the
                              * partition variable holds. *)
                             let exit_imp_part = 
                               Z3.mk_implies
                                 z3_ctx
                                 (Z3.mk_or z3_ctx some_in_part)
                                 part_var in
                               (Att_states_map.add part part_var exits_to_var,
                                [| exit_imp_part |]) in

                         (* part_var: variable representing the
                          * partition. *)
                         let part_var =
                           Att_states_map.find part exits_to_var' in

                         (* part_imp_ret: if the caller and
                          * partition are enabled, then the return
                          * state is in the strategy. *)
                         let part_imp_ret = 
                           Z3.mk_implies
                             z3_ctx
                             part_var
                             (def_to_var ret_state) in
                           (exits_to_var',
                            Array.append call_part_conjs ret_part_conjs,
                            Array.append call_ret_conjs [| part_imp_ret |])
                      )
                      exit_parts
                      (exits_to_var, [| |], [| |]) in
                    
                  (*
                  let trust_ctr =
                    if is_trusted call then [| |]
                    else
                      let exits_to_var_fn exits =
                        Att_states_map.find exits exits_to_var' in
                        Game_sevpas.Def_state_map.fold
                          (fun fst_ret fst_part fst_acc ->
                             (* some_later_opt: all classes that follow
                              * fst_ret in the set ordering. *)
                             let some_later_opt =
                               Game_sevpas.Def_state_map.fold
                                 (fun sec_ret sec_part sec_acc ->
                                    (match sec_acc with
                                         Some(ctrs) -> 
                                           Some(
                                             Array.append
                                               ctrs
                                               [| exits_to_var_fn sec_part |])
                                       | None ->
                                           let ret_cmp =
                                             Game_sevpas.Def_state.compare
                                               fst_ret
                                               sec_ret in
                                             if ret_cmp = 0 then Some([| |])
                                             else None
                                    )
                                 )
                                 exit_parts
                                 None in
                               (match some_later_opt with
                                    Some(some_later_part) -> 
                                      (* dbg: *)
                                      let part_no_others =
                                        Z3.mk_implies
                                          z3_ctx
                                          (exits_to_var_fn fst_part)
                                          (Z3.mk_not
                                             z3_ctx
                                             (Z3.mk_or
                                                z3_ctx some_later_part)) in
                                        Array.append 
                                          fst_acc [| part_no_others |]
                                  | None -> failwith "partition not found"
                               )
                          )
                          exit_parts
                          [| |] in
                  *)

                  (* Constrain that if the partition variable holds,
                   * then the return state is in the strategy. *)
                  (Array.append part_conjs call_part_conjs,
                   Array.append ret_conjs call_ret_conjs,
                   exits_to_var')
               )
               (game.Game_sevpas.gm_call_enabled caller)
               ([| |], [| |], exits_to_var) in

           (* If the caller is in the strategy, constrain the exit
            * states of all modules that the caller calls. *)
           let caller_ctr =
             Z3.mk_implies
               z3_ctx (att_to_var caller) (Z3.mk_and z3_ctx ret_conjs) in
             (Array.concat [ caller_conjs; part_conjs; [| caller_ctr |] ],
              exits_to_var')
        )
        game.Game_sevpas.gm_att_states
        ([| |], Att_states_map.empty) in
      Z3.mk_and z3_ctx caller_conjs


  (* cons_intraproc_ctrs: constrain states of an isolated Defender
   * strategy according to intraprocedural rules. *)
  let cons_intraproc_ctrs game att_to_var def_to_var =
    (* For each Attacker state: *)
    let att_conjs =
      Game_sevpas.Att_states.fold
        (fun att_state state_acc ->
           (* Collect the set of all successors. *)
           let all_succs =
             Game_sevpas.Att_ints.fold
               (fun att_int int_acc ->
                  (* Get the intra-successor. *)
                  let intra_succ =
                    game.Game_sevpas.gm_att_int_trans att_state att_int in
                    Game_sevpas.Def_states.add intra_succ int_acc
               )
               (game.Game_sevpas.gm_att_enabled att_state)
               Game_sevpas.Def_states.empty in
             
           (* Constraint: all successors are in the strategy. *)
           let succs_conjs =
             Game_sevpas.Def_states.fold
               (fun succ succs_conjs ->
                  Array.append succs_conjs [| def_to_var succ |]
               )
               all_succs
               [| |] in
           let pre_then_all_succs =
             Z3.mk_implies
               z3_ctx (att_to_var att_state) (Z3.mk_and z3_ctx succs_conjs) in
             Array.append state_acc [| pre_then_all_succs |]
        )
        game.Game_sevpas.gm_att_states
        [| |] in
      
    (* For each Defender pre-state: *)
    let def_conjs =
      Game_sevpas.Def_states.fold
        (fun def_state state_acc ->
           (* Collect all successors of the Defender state. *)
           let all_succs =
             Game_sevpas.Def_ints.fold
               (fun def_int int_acc ->
                  let intra_succ =
                    game.Game_sevpas.gm_def_int_trans def_state def_int in
                    Game_sevpas.Att_states.add intra_succ int_acc
               )
               (game.Game_sevpas.gm_def_enabled def_state)
               Game_sevpas.Att_states.empty in

           (* Collect disjuncts that some successor is a state of the
            * strategy. *)
           let succs_disjs =
             Game_sevpas.Att_states.fold
               (fun succ succs_disjs ->
                  Array.append succs_disjs [| att_to_var succ |]
               )
               all_succs
               [| |] in

           (* Constrain that if the pre-state is in the strategy, then
            * some post-state is in the strategy. *)
           let pre_then_some_succ =
             Z3.mk_implies
               z3_ctx (def_to_var def_state) (Z3.mk_or z3_ctx succs_disjs) in
             Array.append state_acc [| pre_then_some_succ |]
        )
        game.Game_sevpas.gm_def_states
        [| |] in
      
      Z3.mk_and z3_ctx (Array.append att_conjs def_conjs)

  (* sat_model_to_strat: take a game and SAT model as
   * input. Construct a winning Defender strategy represented by the
   * model. *)
  let sat_model_to_strat host_monitor game att_to_var def_to_var m =
    (* strat_att_states: the attacker states of the strategy. *)
    let strat_att_states =
      Game_sevpas.Att_states.filter 
        (fun att_state ->
           let (succ_eval, mem_val) = 
             Z3.eval z3_ctx m (att_to_var att_state) in
             if succ_eval then Z3.get_bool_value z3_ctx mem_val = Z3.L_TRUE
             else failwith "Z3 constant not evaluated"
        )
        game.Game_sevpas.gm_att_states in

    (* Check that the SAT model denotes a well-formed strategy wrt
     * returns. *)
    let _ = 
      Game_sevpas.Att_states.iter
        (fun att_state ->
           Game_sevpas.Calls.iter
             (fun call ->
                let (_, _, _, exits) = game.Game_sevpas.gm_call_mods call in
                  Game_sevpas.Att_states.iter
                    (fun exit_state ->
                       let ret_state = 
                         game.Game_sevpas.gm_return_trans
                           exit_state att_state in
                       let (_, ret_val) = 
                         Z3.eval z3_ctx m (def_to_var ret_state) in
                         assert (Z3.get_bool_value z3_ctx ret_val = Z3.L_TRUE)
                    )
                    (Game_sevpas.Att_states.inter strat_att_states exits)
             )
             (game.Game_sevpas.gm_call_enabled att_state)
        )
        strat_att_states in

    (* is_strat_state: decide if an Attacker state is a strategy state. *)
    let is_strat_state att_state =
      Game_sevpas.Att_states.mem att_state strat_att_states in

    (* strat_att_ints: the Attacker actions of the strategy. *)
    let strat_att_ints =
      Game_sevpas.Att_states.fold
        (fun att_state att_ints ->
           Game_sevpas.Att_ints.union
             att_ints (game.Game_sevpas.gm_att_enabled att_state)
        )
        strat_att_states
        Game_sevpas.Att_ints.empty in

    (* strat_calls: the calls of the strategy. *)
    let strat_calls = 
      Game_sevpas.Att_states.fold
        (fun att_state calls ->
           Game_sevpas.Calls.union 
             calls (game.Game_sevpas.gm_call_enabled att_state)
        )
        strat_att_states
        Game_sevpas.Calls.empty in

    let choose_def_int def_state =
      let def_int_choices =
        Game_sevpas.Def_ints.filter
          (fun def_int ->
             is_strat_state
               (game.Game_sevpas.gm_def_int_trans def_state def_int)
          )
          (game.Game_sevpas.gm_def_enabled def_state) in
      Game_sevpas.Def_ints.fold
        (fun def_int chosen_int ->
          let is_lower_score =
            host_monitor.Hst.prim_score def_int
            < host_monitor.Hst.prim_score chosen_int in
          if is_lower_score then def_int else chosen_int
        )
        def_int_choices
        (Game_sevpas.Def_ints.choose def_int_choices) in

    (* strat_init_act: the initial primitive invoked by the
     * strategy. *)
    let (_, _, init_state, _) = game.Game_sevpas.gm_entry_mod in
    let strat_init_act = choose_def_int init_state in
    let strat_init_state =
      game.Game_sevpas.gm_def_int_trans init_state strat_init_act in

    (* strat_int_choice: choice of internal actions in the
     * strategy. *)
    let strat_int_act_choice att_state att_int =
      let def_state = game.Game_sevpas.gm_att_int_trans att_state att_int in
        choose_def_int def_state in

    let strat_int_state_choice att_state att_int =
      let def_state = game.Game_sevpas.gm_att_int_trans att_state att_int in
        game.Game_sevpas.gm_def_int_trans
          def_state (strat_int_act_choice att_state att_int) in

    let strat_ret_act pre stack =
      let def_state = game.Game_sevpas.gm_return_trans pre stack in
        choose_def_int def_state in

    let strat_ret_state pre stack =
      let def_state = game.Game_sevpas.gm_return_trans pre stack in
        game.Game_sevpas.gm_def_int_trans
          def_state (strat_ret_act pre stack) in

    let strat_mod_act_choice call =
      let (_, _, mod_init, _) = game.Game_sevpas.gm_call_mods call in
        choose_def_int mod_init in

    let strat_mod_state_choice call =
      let (_, _, mod_init, _) = game.Game_sevpas.gm_call_mods call in
        game.Game_sevpas.gm_def_int_trans
          mod_init (strat_mod_act_choice call) in

      { Game_sevpas.strat_nm = "strategy";
        att_ints = strat_att_ints;
        def_ints = game.Game_sevpas.gm_def_ints;
        calls = strat_calls;
        enabled_att_ints = game.Game_sevpas.gm_att_enabled;
        enabled_calls = game.Game_sevpas.gm_call_enabled;
        states = strat_att_states;
        init_act = strat_init_act;
        init_state = strat_init_state;
        int_action_choice = strat_int_act_choice;
        int_state_choice = strat_int_state_choice;
        ret_action_choice = strat_ret_act;
        ret_state_choice = strat_ret_state;
        mod_action_choice = strat_mod_act_choice;
        mod_state_choice = strat_mod_state_choice;
      }


  (* solve_game: given a game, construct:
   *
   * -a modular strategy that solves the game, or
   * 
   * -return that no such strategy exists.
   *)
  let solve_game host_monitor game =
    (* att_to_var, var_to_att: a map from each Attacker state to its
     * membership predicate variable, and vice versa. *)
    let (att_to_var, var_to_att) =
      (* Construct hash maps from states to pred vars. *)
      let (att_var_map, var_att_map) =
        Game_sevpas.Att_states.fold
          (fun att_state (att_var_map, var_att_map) ->
             let att_var =
               Z3.mk_const
                 z3_ctx
                 (Z3.mk_string_symbol 
                    z3_ctx
                    ("att_in_strat_"
                     ^ (Game_sevpas.att_state_to_string att_state)))
                 (Z3.mk_bool_sort z3_ctx) in
               (Game_sevpas.Att_state_map.add att_state att_var att_var_map,
                Ast_map.add att_var att_state var_att_map)
          )
          game.Game_sevpas.gm_att_states
          (Game_sevpas.Att_state_map.empty, Ast_map.empty) in

      (* Wrap hash maps in functions. *)
      let att_to_var att_state =
        Game_sevpas.Att_state_map.find att_state att_var_map in
      let var_to_att pred_var =
        Ast_map.find pred_var var_att_map in
        (att_to_var, var_to_att) in

    (* def_to_var, var_to_def: a map from each Defender state to its
     * membership predicate variable, and vice versa. *)
    let (def_to_var, var_to_def) =
      (* Construct hash maps from states to pred vars. *)
      let (def_var_map, var_def_map) =
        Game_sevpas.Def_states.fold
          (fun def_state (def_var_map, var_def_map) ->
             let def_var =
               Z3.mk_const
                 z3_ctx
                 (Z3.mk_string_symbol 
                    z3_ctx
                    ("def_in_strat_"
                     ^ (Game_sevpas.def_state_to_string def_state)))
                 (Z3.mk_bool_sort z3_ctx) in
               (Game_sevpas.Def_state_map.add def_state def_var def_var_map,
                Ast_map.add def_var def_state var_def_map)
          )
          game.Game_sevpas.gm_def_states
          (Game_sevpas.Def_state_map.empty, Ast_map.empty) in

      (* Wrap hash maps in functions. *)
      let def_to_var def_state =
        Game_sevpas.Def_state_map.find def_state def_var_map in
      let var_to_def pred_var =
        Ast_map.find pred_var var_def_map in
        (def_to_var, var_to_def) in

    (* Construct complete constraint set for strategies. *)
    let init_ctrs =
      let entry_ctr =
        let (_, _, entry_init, _) = game.Game_sevpas.gm_entry_mod in
          def_to_var entry_init in

      let call_ctrs =
        Game_sevpas.Calls.fold
          (fun call call_ctrs ->
             let (_, _, mod_init, _) = game.Game_sevpas.gm_call_mods call in
               Array.append call_ctrs [| def_to_var mod_init |]
          )
          game.Game_sevpas.gm_calls
          [| |] in
        Z3.mk_and z3_ctx (Array.append [| entry_ctr |] call_ctrs) in

    let strat_ctrs =
      Z3.mk_and
        z3_ctx
        [| init_ctrs;
           cons_interproc_ctrs game att_to_var def_to_var;
           cons_intraproc_ctrs game att_to_var def_to_var|] in
    dbg ("time to gen ctrs: " ^ (string_of_float (Sys.time ())));

    Z3.assert_cnstr z3_ctx strat_ctrs;
    (match Z3.check_and_get_model z3_ctx with
        (Z3.L_TRUE, m) ->
          dbg ("time to find strat: " ^ (string_of_float (Sys.time ())));
          Some(
            sat_model_to_strat host_monitor game att_to_var def_to_var m)
      | _ ->
        let _ =
          dbg
            ("time to rule out winning Defender strat: "
             ^ (string_of_float (Sys.time ()))) in
        failwith "game has no winning modular strategy"
    )

  (* gen_instrumentation: instrument a program. *)
  let gen_instrumentation hst_monitor strat prog_sevpa prog =
    (* internal_index: index of program internals. *)
    let internal_index = cons_internal_index strat.Game_sevpas.att_ints in

    (* call_index: index of calls in the strategy. *)
    let strat_mods = Prog_sevpa.mod_ids prog_sevpa in
    let mod_index = cons_mod_index strat_mods in

    (* Generate a bitcode module holding instrumentation state. *)
    let prog_nm = Program.prog_name prog in
    gen_instr_state hst_monitor strat internal_index mod_index prog_nm;

    (* Instrument the program libraries. *)
    Program.instr_prog
      prog strat.Game_sevpas.att_ints internal_index strat_mods mod_index

    
  (* readable_secs: pretty-print current system time in seconds. *)
  let readable_secs _ = (string_of_float (Sys.time ())) ^ "s"

  (* weave_driver: takes as input:
   * 
   * -prog: the program to model and weave.
   * 
   * -pol_text: text representation of the policy.
   * 
   * -functions for dumping debugging output, whose names should be
   * self-explanatory. 
   * 
   *)
  let weave_driver
      prog
      instr_prog
      pol_text
      dump_llvm
      dump_bin
      dump_prog
      dump_proj
      dump_proj_nwa
      dump_pol =

    (* key_prog_internals: internal actions for the projected
     * program. *)
    dbg "weave_driver: begin";

    (* proj_sevpa: a SEVPA representation of the projected program. *)
    dbg ("weave_driver: pre model program: " ^ (readable_secs ()));
    let proj_sevpa = Program.prog_to_vpa Hst.marker_names prog in

    dbg ("weave_driver: post model program: " ^ (readable_secs ()));
    dump_proj proj_sevpa;
    dump_proj_nwa proj_sevpa;

    (* pol: the policy of the program. *)
    dbg ("weave_driver: pre parse policy: " ^ (readable_secs ()));
    let pol = Pol.parse_policy proj_sevpa pol_text in
    dbg ("weave_driver: post parse policy: " ^ (readable_secs ()));

    (* hst_monitor: the host monitor for the projected program and its
     * policy. *)
    let hst_monitor = Hst.cons_host_monitor prog proj_sevpa pol in

    (* pol_weave_game: the policy-weaving game. *)
    dbg ("weave_driver: pre cons game: " ^ (readable_secs ()));
    let pol_weave_game = cons_game proj_sevpa pol hst_monitor in
    dbg ("weave_driver: game stats: " ^ (Game_sevpas.gm_stats pol_weave_game));

    (* Apply the game solver. *)
    dbg ("weave_driver: pre solve game: " ^ (readable_secs ()));
    let game_res = solve_game hst_monitor pol_weave_game in
    dbg ("weave_driver: post solve game: " ^ (readable_secs ()));

    (* Check the result of the game solver. *)
    (match game_res with
        None ->
        (* No winning strategy was found. Don't do anything. *)
        false
      | Some(strat) ->
        gen_instrumentation hst_monitor strat proj_sevpa instr_prog;
        true
    )
end

(* Instantiate the weaver generator to the Capsicum policy-weaver. *)
module Cap_weave = Weave_gen(Capsicum)

(* driver: entry point for WAG. Parses command-line arguments,
 * constructs a model of the program, and chooses a policy-weaver to do
 * the rest of the work. *)
let driver () =
  (* Get values of command-line options. *)
  let bin_entry_nm_cell = ref None in
  let bin_lib_nm_cell = ref None in
  let dump_bin_cell = ref false in
  let dump_llvm_cell = ref false in
  let dump_pol_cell = ref false in
  let dump_prog_cell = ref false in
  let dump_proj_cell = ref false in
  let dump_proj_nwa_cell = ref false in
  let host_nm_cell = ref None in
  let llvm_entry_nm_cell = ref None in
  let llvm_lib_nm_cell = ref None in
  let llvm_unmodeled_nm_cell = ref None in
  let pol_nm_cell = ref None in
  let set_opt store value = store := Some(value) in
  Arg.parse
    [ ("-bin_entry",
       Arg.String(set_opt bin_entry_nm_cell),
       "file containing OpenNWA representation of binary module"
       ^ " with the entry function of the whole program.");
      ("-bin_lib",
       Arg.String(set_opt bin_lib_nm_cell),
       "file containing OpenNWA representation of a binary library");
      ("-bin_to_dot",
       Arg.Set(dump_bin_cell),
       "set to dump the Binary SEVPA to a dot file");
      ("-host_name",
       Arg.String(set_opt host_nm_cell),
       "name of the target host");
      ("-llvm_entry",
       Arg.String(set_opt llvm_entry_nm_cell),
       "file containing an LLVM bitcode with the entry function"
       ^ " of the whole program");
      ("-llvm_lib",
       Arg.String(set_opt llvm_lib_nm_cell),
       "file containing an LLVM bitcode library");
      ("-llvm_to_dot",
       Arg.Set(dump_llvm_cell),
       "set to dump the LLVM SEVPA to a dot file");
      ("-llvm_unmodeled_lib",
       Arg.String(set_opt llvm_unmodeled_nm_cell),
       "set with the name of an LLVM to be instrumented, but not modeled");
      ("-noisy",
       Arg.Set(noisy_cell),
       "print debugging information to stdout");
      ("-pol_file",
       Arg.String(set_opt pol_nm_cell),
       "text file holding the policy");
      ("-pol_to_dot",
       Arg.Set(dump_pol_cell),
       "set to dump the policy SEVPA to a dot file");
      ("-prog_to_dot",
       Arg.Set(dump_prog_cell),
       "set to dump a model of the program VPA to a dot file");
      ("-proj_to_dot",
       Arg.Set(dump_proj_cell),
       "set to dump a model of the projected program VPA to a dot file");
      ("-proj_to_nwa",
       Arg.Set(dump_proj_nwa_cell),
       "set to dump a model of the projected program VPA to a NWA file");
    ]
    (fun arg -> ())
    "bad argument";

  (* prog: the program to be modeled. *)
  let prog = 
    Program.parse_prog
      !llvm_entry_nm_cell
      !bin_entry_nm_cell
      !llvm_lib_nm_cell
      !bin_lib_nm_cell in

  (* instr_prog: the program to be instrumented. *)
  let instr_prog =
    (match !llvm_unmodeled_nm_cell with
        Some(unmodeled_lib_nm) -> Program.append_llvm_lib prog unmodeled_lib_nm
      | None -> prog
    ) in

  (* host_nm: the name of the host. *)
  let host_nm =
    (match !host_nm_cell with
        Some(nm) -> nm
      | None ->
        invalid_arg ("WAG expected a host name given with key -host_name")
    ) in

  (* pol_nm: the name of the policy. *)
  let pol_nm =
    (match !pol_nm_cell with
        Some (nm) -> nm
      | None ->
        invalid_arg
          ("WAG expected a policy name given with key -pol_file")
    ) in

  (* Optionally dump the LLVM SEVPA to dot. *)
  let dump_llvm =
    if !dump_llvm_cell then
      dot_dump Llvm_sevpa.sevpa_to_dot "llvm_sevpa.dot" 
    else (fun _ -> ()) in

  (* Optionally dump the binary SEVPA to dot. *)
  let dump_bin =
    if !dump_bin_cell then dot_dump Bin_sevpa.sevpa_to_dot "bin_sevpa.dot"
    else (fun _ -> ()) in

  (* dump_prog: dump a program SEVPA. *)
  let dump_prog = dot_dump Prog_sevpa.sevpa_to_dot in

  (* dump_full: dump the full program. *)
  let dump_full =
    if !dump_prog_cell then dump_prog "full_prog.dot" else (fun _ -> ()) in

  (* proj_dump: optionally dump the projected SEVPA to dot. *)
  let dump_proj =
    if !dump_proj_cell then dump_prog "proj_prog.dot" else (fun _ -> ()) in

  let proj_dump_nwa = 
    (* dump_nwa: dump a program SEVPA in open_nwa format. *)
    let dump_nwa = dot_dump Prog_sevpa.sevpa_to_open_nwa in
    (* proj_dump_nwa: optionally dump the projected SEVPA to nwa. *)
    if !dump_proj_nwa_cell then dump_nwa "proj_prog_nwa.txt"
    else (fun _ -> ()) in

  (* pol_text: the text in the policy file. *)
  let pol_text =
    (* pol_chan: input channel for reading the text of the policy. *)
    let pol_chan = 
      try open_in pol_nm
      with Sys_error(err) -> failwith ("Failed to open policy file: " ^ err) in

    let rec read_file text = 
      try read_file (text ^ (input_line pol_chan) ^ "\n")
      with End_of_file -> text in

    let pol_text = read_file "" in

    (try close_in pol_chan
     with Sys_error(err) -> failwith ("Failed to close policy file: " ^ err));
    pol_text in

  let prog_is_weaved =
    if host_nm = "Capsicum" then
      Cap_weave.weave_driver
        prog
        instr_prog
        pol_text
        dump_llvm
        dump_bin
        dump_full
        dump_proj
        proj_dump_nwa
        (!dump_pol_cell)
    else failwith ("given host (" ^ host_nm ^ ") not supported") in
  if prog_is_weaved then ()
  else print_endline "no winning defender strategy found"

(* Alternate point of entry. For simple tests. *)
let test_bed () =
  let rec l = 0::l in
  ()
;;

(* Enter the driver. *)
driver ()

(* Enter the test bed. *)
(*
test_bed()
*)
