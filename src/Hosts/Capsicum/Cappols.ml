(* General modules: *)
open BatSet
open BatStd

(* LLVM modules: *)
open Llvm
open Llvm_prog

(* Wag modules. *)
open Bin_prog
open Libext
open Policy
open Program
open Vpa

(* Introduce policy regex modules. *)
open Cappol_regex_types
open Regex_lex
open Regex_parse

(* desc: a descriptor. *)
type desc = Llvm.llvalue desc_cons

module Desc =
struct
  type t = desc
  let compare = desc_cons_compare Llvm_value.compare
end

(* Descs: a set of descriptors. *)
module Descs = Set.Make(Desc)

(* Desc_map: a map keyed on descriptors. *)
module Desc_map = Map.Make(Desc)

(* desc_to_string: construct the string representation of a
 * descriptor. *)
let desc_to_string dsc =
  (match dsc with
    | Stdin -> "stdin"
    | Stdout -> "stdout"
    | Stderr -> "stderr"
    | Llvm_desc(dsc) -> "desc(" ^ (Llvm.print_value dsc) ^ ")"
  )

type right = Cappol_regex_types.right

(* Rights: a set of rights. *)
module Rights =
  Set.Make(
    struct
      type t = right
      let compare = compare
    end)

(* cap_rights: the state of a descriptor. Either a set of Capsicum
 * rights, an open descriptor that isn't a capability, or an
 * uninitialized file. *)
type cap_rights =
    Cap of Rights.t
  | Non_cap
  | Uninit

let cmp_cap_rights cap_rs_0 cap_rs_1 =
  (match cap_rs_0, cap_rs_1 with
      Cap(rs_0), Cap(rs_1) -> Rights.compare rs_0 rs_1
    | _ -> compare cap_rs_0 cap_rs_1
  )

module Cap_rights =
  Set.Make(
    struct
      type t = cap_rights
      let compare = cmp_cap_rights
    end)

let right_to_string = Cappol_regex_types.right_to_string

let cap_rights_to_string rs =
  (match rs with
      Cap(rs) -> 
        "cap(" ^ (Libext.set_to_string Rights.fold right_to_string rs) ^ ")"
    | Non_cap -> "non-cap"
    | Uninit -> "uninit"
  ) 

(* Rights_set: a set of sets of rights. *)
module Rights_set = Set.Make(Rights)

(* right_pset: takes a set of rights, construct the power set. *)
let right_pset rights =
  Rights.fold
    (fun right right_pset ->
       (* Add the current right to each set collected: *)
       Rights_set.fold
         (fun right_set added_sets ->
            Rights_set.add (Rights.add right right_set) added_sets
         )
         right_pset
         right_pset
    )
    rights
    (Rights_set.singleton (Rights.empty))

(* Common functions for constructing policies: *)
let desc_ls_to_set desc_ls =
  List.fold_left
    (fun descs desc -> Descs.add desc descs)
    Descs.empty
    desc_ls

let right_ls_to_set rights_ls =
  List.fold_left
    (fun rights right -> Rights.add right rights)
    Rights.empty
    rights_ls

let all_rights = 
  let right_ls =
    [ Accept;
      Acl_check;
      Acl_delete;
      Acl_get;
      Acl_set;
      Bind;
      Connect;
      Create;
      Delete;
      Fexecve;
      Extattr_delete;
      Extattr_get;
      Extattr_list;
      Extattr_set;
      Fchdir;
      Fchflags;
      Fchmod;
      Fchown;
      Fcntl;
      Flock;
      Fpathconf;
      Fsck;
      Fstat;
      Fstatfs;
      Fsync;
      Ftruncate;
      Futimes;
      Getpeername;
      Getsockname;
      Getsockopt;
      Ioctl;
      Listen;
      Lookup;
      Mac_get;
      Mac_set;
      Mapexec;
      Mkdir;
      Mkfifo;
      Mmap;
      Pdgetpid;
      Pdkill;
      Pdwait;
      Peeloff;
      Poll_event;
      Post_event;
      Read;
      Rmdir;
      Seek;
      Sem_getvalue;
      Sem_post;
      Sem_wait;
      Setsockopt;
      Shutdown;
      Ttyhook;
      Write;
    ] in
  right_ls_to_set right_ls

let rights_ls_to_map right_ls =
  List.fold_left
    (fun rights_map (desc, rights) -> Desc_map.add desc rights rights_map)
    Desc_map.empty
    right_ls

(* capability: a capability is a descriptor and a set of rights. *)
type capability =
    { desc: desc;
      rights: cap_rights;
    }

(* part_vector: a partial capability vector is an optional flag to
 * denote if the process is in ambient mode, and a partial map from
 * each descriptor to a set of rights. *)
type part_vector =
    { part_amb: bool option;
      part_desc_rights: cap_rights Desc_map.t;
    }

(* cap_vector: a capability vector is a flag that denotes if the
 * process is in ambient mode, and a total map from each descriptor to
 * a set of rights. *)
type cap_vector =
    { amb: bool;
      desc_rights: cap_rights Desc_map.t;
      rights_ceiling: Rights.t Desc_map.t;
    }

(* cap_vector_to_string: construct string representation of a
 * capability vector. *)
let cap_vector_to_string cap_vec =
  let env_string = if cap_vec.amb then "AMB" else "NO AMB" in
  let desc_map_string =
    map_to_string
      Desc_map.fold
      desc_to_string
      cap_rights_to_string 
      cap_vec.desc_rights in
  "env: " ^ env_string ^ "\nrights:\n" ^ desc_map_string

(* Cap_vector: ordered type of capability vectors. *)
module Cap_vector =
struct
  type t = cap_vector
  let compare u v = 
    let amb_cmp = compare u.amb v.amb in
    if amb_cmp != 0 then amb_cmp
    else Desc_map.compare cmp_cap_rights u.desc_rights v.desc_rights
end

(* Cap_vectors: a set of capability vectors. *)
module Cap_vectors = Set.Make(Cap_vector)

(* cap_vec_join: the join of two capability vectors. *)
let cap_vec_join vec_0 vec_1 =
  let cap_rights_join cap_rs_0 cap_rs_1 =
    (match cap_rs_0, cap_rs_1 with
        Non_cap, _
      | _, Non_cap -> Non_cap
      | Uninit, _ -> cap_rs_1
      | _, Uninit -> cap_rs_0
      | Cap(rs_0), Cap(rs_1) -> Cap(Rights.union rs_0 rs_1)
    ) in
  let join_amb = vec_0.amb || vec_1.amb in
  let join_rights = 
    Desc_map.fold
      (fun desc vec_0_rights ->
        Desc_map.add
          desc
          (cap_rights_join 
             vec_0_rights (Desc_map.find desc vec_1.desc_rights))
      )
      vec_0.desc_rights
      Desc_map.empty in
  { amb = join_amb;
    desc_rights = join_rights;
    rights_ceiling = vec_0.rights_ceiling;
  }

(* cap_vec_meet: the meet of two capability vectors. *)
let cap_vec_meet vec_0 vec_1 =
  let cap_rights_meet cap_rs_0 cap_rs_1 =
    (match cap_rs_0, cap_rs_1 with
        Non_cap, _ -> cap_rs_1
      | _, Non_cap -> cap_rs_0
      | Uninit, _
      | _, Uninit -> Uninit
      | Cap(rs_0), Cap(rs_1) -> Cap(Rights.inter rs_0 rs_1)
    ) in

  let meet_amb = vec_0.amb && vec_1.amb in
  let meet_rights =
    Desc_map.fold
      (fun desc vec_0_rights ->
        Desc_map.add
          desc
          (cap_rights_meet vec_0_rights (Desc_map.find desc vec_1.desc_rights))
      )
      vec_0.desc_rights
      Desc_map.empty in
  { amb = meet_amb;
    desc_rights = meet_rights;
    rights_ceiling = vec_0.rights_ceiling;
  }

let non_cap_map descs =
  Descs.fold (fun desc -> Desc_map.add desc Non_cap) descs Desc_map.empty

(* cap_vec_lower_neighbors: vectors immediately below a given
 * capability vector. *)
let cap_vec_lower_neighbors cap_vec =
  (* non_cap_map: maps every descriptor to the non-capability set of
   * rights. *)
  let non_cap_desc_map = 
    let descs = 
      Desc_map.fold
        (fun desc _ -> Descs.add desc) cap_vec.desc_rights Descs.empty in
    non_cap_map descs in

  (* env_vecs: vectors with less ambient capability than the given
   * vector. *)
  let env_vecs =
    (* If every vector in lattice has ambience: *)
    if cap_vec.amb then
      let vec =
        { amb = false;
          desc_rights = non_cap_desc_map;
          rights_ceiling = cap_vec.rights_ceiling;
        } in
      Cap_vectors.singleton vec
    else Cap_vectors.empty in

  (* no_desc_vecs: vectors that are missing some right that's in the
   * given capability vector. *)
  let no_desc_vecs =
    Desc_map.fold
      (fun desc cap_rights ->
        (* all_rights: all rights relevant to the current
         * descriptor. *)
        let all_rights = Desc_map.find desc cap_vec.rights_ceiling in
        let diff_cap_rights =
          (match cap_rights with
              Non_cap -> Cap_rights.singleton (Cap(all_rights))
            | Cap(desc_rights) ->
              if Rights.is_empty desc_rights then 
                Cap_rights.singleton Uninit
              else 
                Rights.fold
                  (fun compl_right ->
                    let held_rights =
                      Rights.remove compl_right all_rights in
                    Cap_rights.add (Cap(held_rights))
                  )
                  desc_rights
                  Cap_rights.empty
            | Uninit -> Cap_rights.empty
          ) in
        let desc_vecs =
          Cap_rights.fold
            (fun cap_rights ->
              let diff_top_rights = 
                Desc_map.add desc cap_rights non_cap_desc_map in
              let diff_vec =
                { amb = true;
                  desc_rights = diff_top_rights;
                  rights_ceiling = cap_vec.rights_ceiling;
                } in
              Cap_vectors.add diff_vec
            )
            diff_cap_rights
            Cap_vectors.empty in
        Cap_vectors.union desc_vecs
      )
      cap_vec.desc_rights
      Cap_vectors.empty in
  Cap_vectors.union env_vecs no_desc_vecs

(* uninit_map: given a set of descriptors, map each descriptor in the
 * set to uninit. *)
let uninit_map descs = 
  Descs.fold (fun desc -> Desc_map.add desc Uninit) descs Desc_map.empty

(* cap_vec_upper_neighbors: vectors immediately above a given
 * capability vector. *)
let cap_vec_upper_neighbors cap_vec =
  (* uninit_map: map from every descriptor to Uninit. *)
  let descs = 
    Desc_map.fold
      (fun desc _ -> Descs.add desc) cap_vec.desc_rights Descs.empty in

  let uninit_desc_map = uninit_map descs in

  (* env_lats: lattices with more ambient capability. *)
  let env_lats =
    if cap_vec.amb then Cap_vectors.empty
    else 
      let more_amb =
        { amb = true;
          desc_rights = uninit_desc_map;
          rights_ceiling = cap_vec.rights_ceiling;
        } in
      Cap_vectors.singleton more_amb in
  
  (* some_right_lats: immediate neighbors that have more rights than
   * the given lattice. *)
  let some_right_lats =
    Desc_map.fold
      (fun desc vec_rights ->
        let diff_cap_rights =
          (match vec_rights with
              Non_cap -> Cap_rights.empty
            | Cap(desc_rights_1) ->
              let all_rights = Desc_map.find desc cap_vec.rights_ceiling in
              let diff_rights = Rights.diff all_rights desc_rights_1 in
              if Rights.is_empty diff_rights then 
                Cap_rights.singleton Non_cap
              else 
                Rights.fold
                  (fun compl_right ->
                    Cap_rights.add (Cap(Rights.singleton compl_right))
                  )
                  diff_rights
                  Cap_rights.empty
            | Uninit -> Cap_rights.singleton (Cap(Rights.empty))
          ) in
        let desc_vecs =
          Cap_rights.fold
            (fun diff_rights ->
              let diff_bot_rights = 
                Desc_map.add desc diff_rights uninit_desc_map in
              let diff_vec =
                { amb = false;
                  desc_rights = diff_bot_rights;
                  rights_ceiling = cap_vec.rights_ceiling;
                } in
              Cap_vectors.add diff_vec
            )
            diff_cap_rights
            Cap_vectors.empty in
        Cap_vectors.union desc_vecs
      )
      cap_vec.desc_rights
      Cap_vectors.empty in
  Cap_vectors.union env_lats some_right_lats

(* Cap_lat: a lattice of capability vectors. *)
module Cap_vec_lat =
  struct
    type priv = cap_vector
    module Priv = Cap_vector
    module Privs = Cap_vectors
    
    let join = cap_vec_join
    let meet = cap_vec_meet

    let lower_neighbors = cap_vec_lower_neighbors
    let upper_neighbors = cap_vec_upper_neighbors

    let priv_to_string = cap_vector_to_string
  end

(* Lat_ops: set of lattice operations. *)
module Lat_ops = Lat_ops_abs(Cap_vec_lat)

type priv_lattice = Lat_ops.priv_lattice

(* Priv_lats: a set of privilege lattices. *)
module Priv_lat = Lat_ops.Priv_lat
module Priv_lats = Lat_ops.Priv_lats

(* prog_pol_internal: a program-policy internal. *)
type prog_pol_internal = Prog_sevpa.internal * priv_lattice

(* Prog_pol_internal: ordering over program-policy internals. *)
module Prog_pol_internal =
  struct
    type t = prog_pol_internal
    let compare (pp_int_0, lat_0) (pp_int_1, lat_1) =
      let int_cmp = compare pp_int_0 pp_int_1 in
      if int_cmp != 0 then int_cmp else Priv_lat.compare lat_0 lat_1
  end

(* Prog_pol_regex: finite automata representations of
 * program-policies. *)
module Prog_pol_regex =
  Regex_abs(
    struct
      module Comp = Prog_pol_internal
        
      let to_string (prog_int, priv_lat) =
        "(" ^ (Prog_sevpa.internal_to_string prog_int) ^ ",\n"
        ^ (Lat_ops.lat_to_string priv_lat) ^ "\n)"
    end
  )

(* amb_vec: takes a flag for ambient capability, constructs a
 * capability vector from it. *)
let amb_vec amb_flag = 
  { part_amb = Some(amb_flag);
    part_desc_rights = Desc_map.empty;
  }

(* cap_vec: takes a capability, constructs a partial capability vector
 * from it. *)
let cap_vec cap = 
  { part_amb = None;
    part_desc_rights = Desc_map.singleton cap.desc cap.rights;
  }

(* lookup_blk: takes a program and a basic block, looks up the first
 * instruction in the block. *)
let lookup_blk prog blk_nm =
  let found_opt =
    Llvm.fold_left_functions
      (fun found_opt func ->
        Llvm.fold_left_blocks
          (fun found_opt blk ->
            (match found_opt with
                Some(_) -> found_opt
              | None ->
                if Llvm.value_name (Llvm.value_of_block blk) = blk_nm then
                  Some(Llvm_prog.block_front blk)
                else None
            )
          )
          found_opt
          func
      )
      None
      prog in
  (match found_opt with
      Some(found_instr) -> found_instr
    | None -> failwith ("lookup_blk: block with label " ^ blk_nm ^ " not found")
  )

(* pol_info: struct of important policy information that doesn't fit
 * anywhere else. *)
type pol_info =
    { descs: Descs.t;
      desc_to_all: Rights.t Desc_map.t;
    }

(* complete_lattice: takes a full lattice and a partial capability
 * vector. Updated the full lattice with any values bound in the partial
 * vector. *)
let complete_lattice def part_vector =
  (* upd_amb: the updated ambient flag. *)
  let upd_amb =
    (match part_vector.part_amb with
        Some(amb) -> amb
      | None -> def.amb
    ) in

  (* upd_desc_rights: the updated capability map. *)
  let upd_desc_rights =
    Desc_map.fold Desc_map.add part_vector.part_desc_rights def.desc_rights in
  { amb = upd_amb;
    desc_rights = upd_desc_rights;
    rights_ceiling = def.rights_ceiling;
  }

(* lat_lower_bound: construct the sub lattice of (bot, top) that is
 * lower_bounded by part_vector. *)
let lat_lower_bound bot top part_vector =
  (* Construct the full lattice. *)
  let lat =
    { lower_bound = complete_lattice bot part_vector;
      upper_bound = top;
    } in
  Non_empty_lat(lat)

(* lat_upper_bound: construct the sub lattice of (bot, top) that is
 * upper-bounded by part_vector. *)
let lat_upper_bound bot top part_vector =
  let lat =
    { lower_bound = bot;
      upper_bound = complete_lattice top part_vector;
    } in
  Non_empty_lat(lat)

(* part_vec_join: join two partial vectors into a partial vector. *)
let part_vec_join vec_0 vec_1 = 
  (* amb': the ambient flag of the join. *)
  let amb' =
    (match vec_0.part_amb, vec_1.part_amb with
        Some(_), None -> vec_0.part_amb
      | _ -> vec_1.part_amb
    ) in

  (* desc_rights': the descriptor-rights map of the join. *)
  let desc_rights' =
    Desc_map.merge
      (fun desc rights_0_opt rights_1_opt ->
        (match rights_0_opt, rights_1_opt with
            Some(_), _ -> rights_0_opt
          | _ -> rights_1_opt
        )
      )
      vec_0.part_desc_rights
      vec_1.part_desc_rights in
  { part_amb = amb';
    part_desc_rights = desc_rights';
  }

(* pure_expr: an expression tree with no variables. *)
type pure_expr = Pure of pure_expr pure_cons

(* conc_set: a set expression for a particular type. 
 * 'e: type of element
 * 's: type of concrete set constructor
 *)
type ('e, 's) conc_set =
    Conc of 's
  | Set_alg of ('e, ('e, 's) conc_set) set_alg

(* Types of well-formed syntactic policy expressions. *)
type wf_prog_act = Prog_sevpa.internal

(* wf_prog_acts: a well-formed set of program actions. *)
type wf_prog_acts = (wf_prog_act, prog_acts_cons) conc_set

(* wf_amb: a well-formed ambient expression. *)
type wf_amb = Wf_amb of wf_amb amb_cons

(* wf_desc: a well-formed descriptor. *)
type wf_desc = desc

(* wf_right: a well-formed right. *)
type wf_right = right_cons

(* wf_rights: well-formed set of rights. *)
type wf_rights = (wf_right, rights_cons) conc_set

(* wf_cap_vec: a well-formed capability vector. *)
type wf_cap_vec = 
    Wf_cap_vec of (wf_amb, wf_desc, wf_rights, wf_cap_vec) cap_vec_cons

(* wf_cap_vecs: well-formed capability vectors. *)
type wf_cap_vecs = (wf_cap_vec, wf_cap_vec cap_vecs_cons) conc_set

(* wf_pol_act: a well-formed policy action. *)
type wf_pol_act = (wf_prog_act, wf_cap_vec) pol_act_cons

(* wf_pol_acts: a well_formed set of policy actions. *)
type wf_pol_acts = 
    (wf_pol_act, (wf_prog_acts, wf_cap_vecs) pol_acts_cons) conc_set

(* wf_regex: a well-formed policy regex. *)
type wf_regex = Wf_regex of (wf_pol_acts, wf_regex) regex_cons

(* context: a map from a string to a pure expression. *)
type context = string -> pure_expr

(* Iso_cons: functor that constructs a regex isomorphic to a prog-pol
 * NFA. *)
module Iso_cons = Iso_regex(Prog_pol_regex)

(* Isom_nfa: module of regex's isometric to the policy NFA. *)
module Isom_regex = Iso_cons.Regex

module Isom_re_to_nfa = Class_re_to_nfa(Isom_regex)

module Isom_nfa = Isom_re_to_nfa.Nfa

module Memo_isom = Memoize_nfa(Isom_nfa)

(* Isom_nfa_to_dfa: convert NFA to DFA. *)
module Isom_nfa_to_dfa = Nfa_to_dfa(Memo_isom.Nfa)

(* Isom_dfa: DFA module. *)
module Isom_dfa = Isom_nfa_to_dfa.Dfa

(* Isom_flatten: functor for memoizing transition function of DFA. *)
module Isom_flatten = Flatten_dfa(Isom_dfa)

(* Isom_min_dfa: minimize an isometric DFA. *)
module Isom_min_dfa = Min_dfa(Isom_flatten.Flat_dfa)

(* Isom_flatten_min: flatten a minimized isometric DFA. *)
module Isom_flatten_min = Flatten_dfa(Isom_min_dfa.Min_dfa)

module Flat_dfa = Isom_flatten_min.Flat_dfa
module Flat_state_map = Map.Make(Flat_dfa.State)

(* Dfa: the DFA policy module. *)
module Dfa = 
  Dfa_abs(
    struct 
      module State = Flat_dfa.State
      module Action = Prog_pol_regex.Action

      let state_to_string = Flat_dfa.state_to_string
      let action_to_string = Prog_pol_regex.action_to_string
    end
  )

(* policy: a Capsicum policy structure. *)
type policy =
    { info: pol_info;

      full_lattice: priv_lattice;
      
      dfa: Dfa.enabled_dfa;

      pol_state_instr_lats: Dfa.state -> Prog_sevpa.Internal.t -> Priv_lats.t;
    }

(* distinct_alpha: take an alphabet and refine it to a set of
 * non-overlapping actions. *)
let distinct_alpha pol full_lat actions = 
  (* prog_to_lats: a map from each program action to the set of all
   * lattices associated with it in policy actions. *)
  let prog_to_lats = 
    (* empty_map: map from each program action to an empty set of
     * lattices. *)
    let empty_map = 
      Prog_pol_regex.Actions.fold
        (fun (prog_act, _) -> 
          Prog_sevpa.Internal_map.add prog_act Priv_lats.empty
        )
        actions
        Prog_sevpa.Internal_map.empty in
    Prog_pol_regex.Actions.fold
      (fun (prog_act, lat) prog_lat_map -> 
        Prog_sevpa.Internal_map.add 
          prog_act
          (Priv_lats.add
             lat (Prog_sevpa.Internal_map.find prog_act prog_lat_map))
          prog_lat_map
      )
      actions
      empty_map in

  (* max_lats: from a given set of lattices, pick a set of maximal
   * covering lattices. *)
  let max_lats lats = 
    Priv_lats.fold
      (fun lat max_lats ->
        let ne_diff =
          let diff = Lat_ops.diff_lat_sets (Priv_lats.singleton lat) max_lats in
          Priv_lats.filter
            (fun lat -> not (Lat_ops.lat_is_empty lat)) diff in
        if not (Priv_lats.is_empty ne_diff) then Priv_lats.add lat max_lats
        else max_lats
      )
      lats
      Priv_lats.empty in

  (* For each program action and its lattices: *)
  Prog_sevpa.Internal_map.fold
    (fun prog_act lats ->
      (* ref_lats: refinement of lattices associated with the program
       * action. *)
      let ref_lats = 
        Priv_lats.fold
          (fun lat ref_lats ->
            (* print_endline ("refining lat: " ^ (priv_lat_to_string lat)); *)
            let ref_lats = 
              Priv_lats.fold
                (fun ref_lat ->
                  Priv_lats.union
                    (Priv_lats.add
                       (Lat_ops.intersect_lats ref_lat lat) 
                       (Lat_ops.diff_lats ref_lat lat))
                )
                ref_lats
                Priv_lats.empty in
            (* opt_lats: an optimal subset of the refinement. *)
            let opt_lats = max_lats ref_lats in
            opt_lats
          )
          lats
          (Priv_lats.singleton full_lat) in

      (* ref_acts: policy actions constructed from the refined
       * lattices. *)
      let ref_acts =
        Priv_lats.fold
          (fun lat -> Prog_pol_regex.Actions.add (prog_act, lat))
          ref_lats
          Prog_pol_regex.Actions.empty in
      Prog_pol_regex.Actions.union ref_acts
    )
    prog_to_lats
    Prog_pol_regex.Actions.empty

(* parse_policy: takes as input a program SEVPA and the text of a
 * policy. Parses the policy into a policy object for the program. *)
let parse_policy prog_sevpa pol_txt =
  (* wf_pol: chk that the policy syntactic expression is
   * well-formed, and strengthen it into a well-formed expression. *)
  let wf_pol =
    (* expanded: expand the sugared regular expression so that
     * it doesn't contain any let bindings or variables. *)
    let expanded =
      (* sugared_re: the policy regular expression with all syntactic
       * sugar (let expressions). *)
      let sugared_re =
        Regex_parse.policy Regex_lex.token (Lexing.from_string pol_txt) in

      (* upd_ctx: update a context with a new domain-range mapping. *)
      let upd_ctx dom rng ctx x = if x = dom then rng else ctx x in

      (* expand: expand an expression so that it contains no
       * variables. *)
      let expand e =
        let rec expand_h ctx e = 
          (match e with
              Pure_var(pure) ->
                let pure' =
                  (match pure with
                      Amb_expr(a) ->
                        let amb' =
                          (match a with
                              Amb -> Amb
                            | Neg(base) -> Neg(expand_h ctx base)
                          ) in
                        Amb_expr(amb')
                    | Rights_expr(All_rights) -> Rights_expr(All_rights)
                    | Vec_expr(v) ->
                      let v' =
                        (match v with
                            Amb_vec(a) -> Amb_vec(expand_h ctx a)
                          | Desc_rights_vec(d, rs) ->
                            Desc_rights_vec(
                              expand_h ctx d, expand_h ctx rs)
                          | Join(lhs, rhs) -> 
                            Join(expand_h ctx lhs, expand_h ctx rhs)
                        ) in
                      Vec_expr(v')
                    | Vecs_expr(vs) ->
                      let vs' =
                        (match vs with
                            Lower_bound(lb) -> 
                              Lower_bound(expand_h ctx lb)
                          | Upper_bound(ub) -> 
                            Upper_bound(expand_h ctx ub)
                          | All_vecs -> All_vecs
                        ) in
                      Vecs_expr(vs')
                    | Pol_action(prog, vec) -> 
                      Pol_action(expand_h ctx prog, expand_h ctx vec)
                    | Pol_actions(pol_acts) -> 
                      let acts' =
                        (match pol_acts with
                            Prod(prog_acts, priv_lats) -> 
                              Prod(
                                expand_h ctx prog_acts, expand_h ctx priv_lats)
                          | All_pol_acts -> All_pol_acts
                        ) in
                      Pol_actions(acts')
                    | Regex(re) ->
                      let re' =
                        (match re with
                            Action(pol_act) ->
                              Action(expand_h ctx pol_act)
                          | Alt(lhs, rhs) ->
                            Alt(expand_h ctx lhs, expand_h ctx rhs)
                          | Concat(fst, sec) ->
                            Concat(expand_h ctx fst, expand_h ctx sec)
                          | Eps -> Eps
                          | Kleene(body) -> Kleene(expand_h ctx body)
                          | Null -> Null
                        ) in
                      Regex(re')
                    | Prog_action(act) ->
                      let act' =
                        (match act with
                            Llvm_act(i) -> Llvm_act(expand_h ctx i)
                          | Llvm_desc_alloc(i) ->
                            Llvm_desc_alloc(expand_h ctx i)
                        ) in
                      Prog_action(act')
                    | Prog_actions(All_prog_acts) -> Prog_actions(All_prog_acts)
                    | Desc_expr(desc) ->
                      let desc' =
                        (match desc with
                            Llvm_desc(d) -> Llvm_desc(expand_h ctx d)
                          | Stdin -> Stdin
                          | Stdout -> Stdout
                          | Stderr -> Stderr
                        ) in
                      Desc_expr(desc')
                    | Right_expr(r) -> Right_expr(r)
                    | Int_const(c) -> Int_const(c)
                    | Set(s) ->
                      let s' =
                        (match s with
                            Empty -> Empty
                          | Diff(t, u) -> Diff(expand_h ctx t, expand_h ctx u)
                          | Intersect(t, u) -> 
                            Intersect(expand_h ctx t, expand_h ctx u)
                          | Single(elt) -> Single(expand_h ctx elt)
                          | Union(t, u) -> Union(expand_h ctx t, expand_h ctx u)
                        ) in
                      Set(s')
                  ) in
                Pure(pure')
            | Let(v, rhs, base) -> 
              expand_h (upd_ctx v (expand_h ctx rhs) ctx) base
            | Var(v) -> ctx v
          ) in
        expand_h (fun v -> failwith ("expand: var " ^ v ^ " not found")) e in
      expand sugared_re in

    (* expanded_to_string: construct the string representation of an
     * expanded expression. *)
    let rec expanded_to_string (Pure(exp)) = 
      pure_to_string expanded_to_string exp in

    (* chk_set: construct a well-formed set expression over a concrete
     * type. *)
    let chk_set 
        elt_chkr
        set_chkr
        s =
      (match s with
          Union(t, u) -> Union(set_chkr t, set_chkr u)
        | Intersect(t, u) -> Intersect(set_chkr t, set_chkr u)
        | Diff(t, u) -> Diff(set_chkr t, set_chkr u)
        | Single(e) -> Single(elt_chkr e)
        | Empty -> Empty
      ) in

    (* report_ill_typed: report a type error in the policy compiler. *)
    let report_ill_typed big_expr type_str =
      print_endline
        ("In policy expression:\n" 
         ^ (expanded_to_string big_expr) ^ " should be a " ^ type_str) in

    (* chk_int: check and extract an integer constant. *)
    let chk_int (Pure(indx)) =
      (match indx with
          Int_const(i) -> i
        | _ -> 
          report_ill_typed (Pure(indx)) "integer constant";
          failwith "ill-typed policy expression"
      ) in

    (* chk_prog_act: evaluate a syntactic set of program actions to
     * an actual set of program internals. *)
    let rec chk_prog_act (Pure(act)) = 
      (match act with
          Prog_action(prog_act) ->
            (match prog_act with
                Llvm_act(i) ->
                  Program.lookup_call
                    prog_sevpa "cw_act" (chk_int i)
              | Llvm_desc_alloc(i) -> 
                Program.lookup_call
                  prog_sevpa "cw_desc" (chk_int i)
            )
        | _ -> 
          report_ill_typed (Pure(act)) "program action";
          failwith "ill-typed policy expression"
      ) in

    (* chk_prog_acts: contruct a well-formed set of program actions. *)
    let rec chk_prog_acts (Pure(prog_acts)) =
      (match prog_acts with
          Set(s) -> Set_alg(chk_set chk_prog_act chk_prog_acts s)
        | Prog_actions(All_prog_acts) -> Conc(All_prog_acts)
        | _ ->
          report_ill_typed (Pure(prog_acts)) "set of program actions";
          failwith "ill-typed policy expression"
      ) in

    (* chk_amb: strengthen a pure expression that should be an
     * ambience expression into an ambience expression. *)
    let rec chk_amb (Pure(amb)) =
      let amb' =
        (match amb with
            Amb_expr(a) ->
              (match a with
                  Amb -> Amb
                | Neg(inner) -> Neg(chk_amb inner)
              )
          | _ -> 
            report_ill_typed (Pure(amb)) "ambient flag expression";
            failwith "ill-typed policy expression"
        ) in
      Wf_amb(amb') in
    
    (* chk_desc: check a descriptor expression. *)
    let chk_desc (Pure(desc)) =
      (match desc with
          Desc_expr(dsc) ->
            (match dsc with
                Llvm_desc(indx) -> 
                  let desc_intrnal = 
                    Program.lookup_call
                      prog_sevpa "cw_desc" (chk_int indx) in
                  (match Program.llvm_inst desc_intrnal with
                      Some(inst) -> Llvm_desc(inst)
                    | None -> failwith "desc inst not found"
                  ) 
              | Stdin -> Stdin
              | Stdout -> Stdout
              | Stderr -> Stderr
            ) 
        | _ -> 
          report_ill_typed (Pure(desc)) "descriptor expression";
          failwith "ill-typed policy expression"
      ) in
    
    (* chk_right: check a right expression. *)
    let chk_right (Pure(right)) =
      (match right with
          Right_expr(r) -> r
        | _ -> 
          report_ill_typed (Pure(right)) "right expression";
          failwith "ill-typed policy expression"
      ) in

    (* chk_rights: construct a well-formed set of rights. *)
    let rec chk_rights (Pure(rights)) =
      (match rights with
          Set(s) -> Set_alg(chk_set chk_right chk_rights s)
        | Rights_expr(All_rights) -> Conc(All_rights)
        | _ -> 
          report_ill_typed (Pure(rights)) "set of rights";
          failwith "ill-typed policy expression"
      ) in

    (* chk_cap_vec: check a capability vector. *)
    let rec chk_cap_vec (Pure(vec)) =
      let vec' =
        (match vec with
            Vec_expr(v) ->
              (match v with
                  Amb_vec(a) -> Amb_vec(chk_amb a)
                | Desc_rights_vec(d, rs) ->
                  Desc_rights_vec(chk_desc d, chk_rights rs)
                | Join(lhs, rhs) -> 
                  Join(chk_cap_vec lhs, chk_cap_vec rhs)
              )
          | _ -> 
            report_ill_typed (Pure(vec)) "capability vector";
            failwith "ill-typed policy expression"
        ) in
      Wf_cap_vec(vec') in

    (* chk_cap_vecs: construct a well-formed set of capability
     * vectors. *)
    let rec chk_cap_vecs (Pure(vecs)) =
      (match vecs with
          Set(s) -> Set_alg(chk_set chk_cap_vec chk_cap_vecs s)
        | Vecs_expr(vec_expr) ->
          let chked_expr =
            (match vec_expr with
                Lower_bound(v) -> Lower_bound(chk_cap_vec v)
              | Upper_bound(v) -> Upper_bound(chk_cap_vec v)
              | All_vecs -> All_vecs
            ) in
          Conc(chked_expr)
        | _ -> 
          report_ill_typed (Pure(vecs)) "capability vectors";
          failwith "ill-typed policy expression"
      ) in

    (* chk_pol_act: construct a well-formed policy action. *)
    let chk_pol_act (Pure(act)) =
      (match act with
          Pol_action(prog_act, vec) -> (chk_prog_act prog_act, chk_cap_vec vec)
        | _ -> 
          report_ill_typed (Pure(act)) "capability action";
          failwith "ill-typed policy action"
      ) in

    (* chk_pol_acts: construct a well-formed set of policy actions. *)
    let rec chk_pol_acts (Pure(acts)) = 
      (match acts with
          Pol_actions(pol_acts) ->
            let conc_core =
              (match pol_acts with 
                  All_pol_acts -> All_pol_acts
                | Prod(prog_acts, cap_vecs) -> 
                  Prod(chk_prog_acts prog_acts, chk_cap_vecs cap_vecs)
              ) in
            Conc(conc_core)
        | Set(s) -> Set_alg(chk_set chk_pol_act chk_pol_acts s)
        | _ -> 
          report_ill_typed (Pure(acts)) "set of capability actions";
          failwith "ill-typed policy expression"
      ) in

    (* TODO: refactor this to evaluating set of policy
     * actions. *)
    (*
      let chk_vec = chk_cap_vecs cap_vecs in
      Prog_sevpa.Internals.fold
      (fun prog_act pol_re ->
      Wf_regex(
      Alt(Wf_regex(Action(prog_act, chk_vec)), pol_re))
      )
      (chk_prog_act syn_prog_act)
      (Wf_regex(Null))
    *)

    (* chk_re: from an expanded policy expression, construct a
     * well-formed regular expression. *)
    let rec chk_re (Pure(e)) =
      let regex_core =
        (match e with
            Regex(re) ->
              (match re with
                  Action(pol_acts) -> Action(chk_pol_acts pol_acts)
                | Alt(lhs, rhs) -> Alt(chk_re lhs, chk_re rhs)
                | Concat(fst, sec) -> 
                  Concat(chk_re fst, chk_re sec)
                | Eps -> Eps
                | Kleene(body) -> Kleene(chk_re body)
                | Null -> Null
            )
        | _ -> 
          report_ill_typed (Pure(e)) "regular expression";
          failwith "ill-typed policy expression"
      ) in
      Wf_regex(regex_core) in

    (* Construct a well-formed policy regex. *)
    chk_re expanded in

  (* desc_rights: map from each descriptor to the set of all
   * rights that are relevant to it in the policy. *)
  let desc_rights =
    let union_rights_maps map_0 map_1 =
      Desc_map.merge
        (fun desc rights_0_opt rights_1_opt ->
          (match rights_0_opt, rights_1_opt with
              Some(rights_0), Some(rights_1) ->
                Some(Rights.union rights_0 rights_1)
            | None, _ -> rights_1_opt
            | _, None -> rights_0_opt
          )
        )
        map_0
        map_1 in

    (* syn_rights_rights: the relevant rights of a syntactic
     * expression. *)
    let rec syn_rights_rights syn_rights =
      (match syn_rights with
          Conc(All_rights) -> all_rights
        | Set_alg(s) ->
          (match s with 
              Empty -> Rights.empty
            | Diff(t, u)
            | Intersect(t, u)
            | Union(t, u) ->
              Rights.union (syn_rights_rights t) (syn_rights_rights u)
            | Single(r) -> Rights.singleton r
          )
      ) in

    (* syn_vec_rights_map: given a capability vector, construct a map
       from each descriptor to the set of rights relevant to the
       descriptor. *)
    let rec syn_vec_rights_map (Wf_cap_vec(syn_vec)) =
      (match syn_vec with
          Amb_vec(_) -> Desc_map.empty
        | Desc_rights_vec(desc, rights) -> 
          Desc_map.singleton desc (syn_rights_rights rights)
        | Join(lhs, rhs) -> 
          union_rights_maps
            (syn_vec_rights_map lhs) (syn_vec_rights_map rhs)
      ) in

     (* syn_vecs_rights_map: given a set of capability vectors, construct
      * a map from each descriptor to the set of rights relevant to the
      * descriptor. *)
    let rec syn_vecs_rights_map syn_vecs =
      (match syn_vecs with
          Conc(core_vecs) ->
            (match core_vecs with
                Lower_bound(syn_vec)
              | Upper_bound(syn_vec) -> syn_vec_rights_map syn_vec
              | All_vecs -> Desc_map.empty
            )
        | Set_alg(s) ->
          (match s with
              Empty -> Desc_map.empty
            | Single(syn_vec) -> syn_vec_rights_map syn_vec
            | Diff(s, t)
            | Intersect(s, t)
            | Union(s, t) ->
              union_rights_maps
                (syn_vecs_rights_map s) (syn_vecs_rights_map t)
          )
      ) in

    (* pol_act_rights: construct a relevant rights map over a
     * capability vector. *)
    let pol_act_rights (_, vec) = syn_vec_rights_map vec in

    (* pol_acts_rights: construct a relevant rights map over a set of
     * policy actions. *)
    let rec pol_acts_rights syn_pol_acts =
      (match syn_pol_acts with
          Conc(All_pol_acts) -> Desc_map.empty
        | Conc(Prod(_, vecs)) -> syn_vecs_rights_map vecs
        | Set_alg(s) ->
          (match s with
              Empty -> Desc_map.empty
            | Single(pol_act) -> pol_act_rights pol_act
            | Diff(t, u)
            | Intersect(t, u)
            | Union(t, u) ->
              union_rights_maps (pol_acts_rights t) (pol_acts_rights u)
          )
      ) in

    (* pol_rights: given a regular expression, construct a map from
     * each descriptor to the set of rights relevant to the descriptor in
     * the policy. *)
    let rec pol_rights (Wf_regex(re)) =
      (match re with
          Action(pol_acts) -> pol_acts_rights pol_acts
        | Alt(fst, sec)
        | Concat(fst, sec) -> 
          union_rights_maps (pol_rights fst) (pol_rights sec)
        | Eps -> Desc_map.empty
        | Kleene(body) -> pol_rights body
        | Null -> Desc_map.empty
      ) in
    pol_rights wf_pol in

  (* descs: the universe of all descritors discussed in the policy. *)
  let descs_uni =
    Desc_map.fold (fun desc _ -> Descs.add desc) desc_rights Descs.empty in

  (* pol_info: information about the policy not captured in the
   * regular expression itself. *)
  let pol_info =
    { descs = descs_uni;
      desc_to_all = desc_rights;
    } in

  (* Privilege lattice. *)
  let lat_bot = 
    { amb = false;
      desc_rights = uninit_map descs_uni;
      rights_ceiling = desc_rights;
    } in
  let lat_top =
    { amb = true;
      desc_rights = non_cap_map descs_uni;
      rights_ceiling = desc_rights;
    } in
  let full_lat = 
    let ne_lat =
      { lower_bound = lat_bot;
        upper_bound = lat_top;
      } in
    Non_empty_lat(ne_lat) in

  (* Construct the policy automaton. *)
  let pol_en_dfa =
    (* distinct_regex: translate the policy regex to a regex over an
     * alphabet with non-overlapping lattices. *)
    let distinct_regex = 
      (* compl_regex: a regex defined over an alphabet with at least
       * one action for every program action. *)
      let compl_regex =
        (* prog_pol_regex: regex defined over program actions. *)
        let prog_pol_regex =
          let lower_bound = lat_lower_bound lat_bot lat_top in
          let upper_bound = lat_upper_bound lat_bot lat_top in

          (* eval_prog_acts: evaluate a set of program actions. *)
          let rec eval_prog_acts prog_acts =
            (match prog_acts with
                Conc(All_prog_acts) -> prog_sevpa.Prog_sevpa.sevpa_ints
              | Set_alg(s) ->
                (match s with
                    Diff(t, u) -> 
                      Prog_sevpa.Internals.diff 
                        (eval_prog_acts t) (eval_prog_acts u)
                  | Empty -> Prog_sevpa.Internals.empty
                  | Intersect(t, u) -> 
                      Prog_sevpa.Internals.inter
                        (eval_prog_acts t) (eval_prog_acts u)
                  | Single(elt) -> Prog_sevpa.Internals.singleton elt
                  | Union(t, u) ->
                    Prog_sevpa.Internals.union 
                      (eval_prog_acts t) (eval_prog_acts u)
                )
            ) in

          (* eval_amb_expr: evaluate an ambience expression to a Boolean
           * flag. *)
          let rec eval_amb_expr (Wf_amb(amb)) =
            (match amb with
                Amb -> true
              | Neg(inner_amb) -> not (eval_amb_expr inner_amb)
            ) in

          (* eval_rights: evaluate a set of rights. *)
          let rec eval_rights rs =
            (match rs with
                Conc(All_rights) -> all_rights
              | Set_alg(s) ->
                (match s with
                    Diff(t, u) -> Rights.diff (eval_rights t) (eval_rights u)
                  | Empty -> Rights.empty
                  | Intersect(t, u) -> 
                    Rights.diff (eval_rights t) (eval_rights u)
                  | Single(elt) -> Rights.singleton elt
                  | Union(t, u) -> Rights.union (eval_rights t) (eval_rights u)
                )
            ) in

          (* eval_vec: evaluate a capability vector. *)
          let rec eval_vec (Wf_cap_vec(syn_vec)) =
            (match syn_vec with
                Amb_vec(amb_exp) ->
                  { part_amb = Some(eval_amb_expr amb_exp);
                    part_desc_rights = Desc_map.empty;
                  }
              | Desc_rights_vec(desc, rights) ->
                { part_amb = None;
                  part_desc_rights = 
                    Desc_map.singleton desc (Cap(eval_rights rights));
                }
              | Join(fst, sec) ->
                part_vec_join (eval_vec fst) (eval_vec sec)
            ) in

          (* eval_vecs: evaluate a set of capability vectors. *)
          let rec eval_vecs syn_vecs =
            (match syn_vecs with
                Conc(bound) ->
                  (match bound with
                      Lower_bound(syn_vec) ->
                        Priv_lats.singleton (lower_bound (eval_vec syn_vec))
                    | Upper_bound(syn_vec) -> 
                      Priv_lats.singleton (upper_bound (eval_vec syn_vec))
                    | All_vecs -> Priv_lats.singleton full_lat
                  )
              | Set_alg(s) ->
                (match s with
                    Diff(t, u) -> 
                      Lat_ops.diff_lat_sets (eval_vecs t) (eval_vecs u)
                  | Empty -> Priv_lats.empty
                  | Intersect(t, u) ->
                    Lat_ops.intersect_lat_sets (eval_vecs t) (eval_vecs u)
                  | Single(elt) -> 
                    let point_lat =
                      let vec_val = eval_vec elt in
                      Lat_ops.intersect_lats
                        (lower_bound vec_val) (upper_bound vec_val) in
                    Priv_lats.singleton point_lat
                  | Union(t, u) -> 
                    Lat_ops.union_lat_sets (eval_vecs t) (eval_vecs u)
                )
            ) in

          (* eval_pol_act: evaluate a policy action. *)
          let eval_pol_act (prog_act, vec) = 
            let bounded_vecs =
              let part_vec = eval_vec vec in
              Lat_ops.intersect_lats
                (lower_bound part_vec) (upper_bound part_vec) in
            (prog_act, bounded_vecs) in

          (* eval_pol_acts: evaluate a set of policy actions. *)
          let rec eval_pol_acts pol_acts =
            (match pol_acts with
                Conc(conc_set) ->
                  (match conc_set with
                      All_pol_acts ->
                        eval_pol_acts 
                          (Conc(Prod(Conc(All_prog_acts), Conc(All_vecs))))
                    | Prod(prog_acts, priv_lats) ->
                      let priv_lat_vals = eval_vecs priv_lats in
                      Prog_sevpa.Internals.fold
                        (fun prog_act -> 
                          Priv_lats.fold
                            (fun priv_lat ->
                              Prog_pol_regex.Actions.add (prog_act, priv_lat)
                            )
                            priv_lat_vals
                        )
                        (eval_prog_acts prog_acts)
                        Prog_pol_regex.Actions.empty
                  )
              | Set_alg(s) -> 
                (* merge_pol_acts: given a set of policy actions, merge 
                 * capability lattices on common program internals. *)
                let merge_pol_acts op acts_0 acts_1 =
                  (* prog_acts: the set of program actions in at least
                   * one of the set of policy actions. *)
                  let prog_acts =
                    Prog_pol_regex.Actions.fold
                      (fun (prog_act, _) -> Prog_sevpa.Internals.add prog_act)
                      (Prog_pol_regex.Actions.union acts_0 acts_1) 
                      Prog_sevpa.Internals.empty in
                  
                  (* empty_map: a map from each program internal to
                   * the empty set of capability lattices. *)
                  let empty_map =
                    Prog_sevpa.Internals.fold
                      (fun prog_act ->
                        Prog_sevpa.Internal_map.add prog_act Priv_lats.empty
                      )
                      prog_acts
                      Prog_sevpa.Internal_map.empty in
                  
                  (* index_pol_acts: takes a set of policy actions,
                   * constructs an index from each program actions to the
                   * set of all capability lattices to which it is
                   * bound. *)
                  let index_pol_acts acts = 
                    let index_map =
                      Prog_pol_regex.Actions.fold
                        (fun (prog_act, lat) index -> 
                          Prog_sevpa.Internal_map.add
                            prog_act
                            (Priv_lats.add
                               lat
                               (Prog_sevpa.Internal_map.find prog_act index))
                            index
                        )
                        acts
                        empty_map in
                    (fun act -> Prog_sevpa.Internal_map.find act index_map) in

                  (* Indices for the two sets of policy actions. *)
                  let index_0 = index_pol_acts acts_0 in
                  let index_1 = index_pol_acts acts_1 in

                  (* For each program internal action: *)
                  Prog_sevpa.Internals.fold
                    (fun prog_act ->
                      Priv_lats.fold
                        (fun lat -> 
                          Prog_pol_regex.Actions.add (prog_act, lat)
                        )
                        (op (index_0 prog_act) (index_1 prog_act))
                    )
                    prog_acts
                    Prog_pol_regex.Actions.empty in

                (match s with
                    Diff(t, u) ->
                      merge_pol_acts 
                        Lat_ops.diff_lat_sets
                        (eval_pol_acts t)
                        (eval_pol_acts u)
                  | Empty -> Prog_pol_regex.Actions.empty
                  | Intersect(t, u) ->
                    merge_pol_acts
                      Lat_ops.intersect_lat_sets
                      (eval_pol_acts t)
                      (eval_pol_acts u)
                  | Single(act) -> 
                    Prog_pol_regex.Actions.singleton (eval_pol_act act)
                  | Union(t, u) ->
                    merge_pol_acts
                      Lat_ops.union_lat_sets
                      (eval_pol_acts t)
                      (eval_pol_acts u)
                )
            ) in

          (* eval_re_h: evaluate a regex. *)
          let rec eval_re_h (Wf_regex(re)) =
            let re_core =
              (match re with
                  Action(pol_acts) -> 
                    Prog_pol_regex.Actions.fold
                      (fun pol_act acts_re_core ->
                        Alt(Prog_pol_regex.Re(Action(pol_act)),
                            Prog_pol_regex.Re(acts_re_core))
                      )
                      (eval_pol_acts pol_acts)
                      Null
                | Alt(fst, sec) -> Alt(eval_re_h fst, eval_re_h sec)
                | Concat(fst, sec) -> Concat(eval_re_h fst, eval_re_h sec)
                | Eps -> Eps
                | Kleene(body) -> Kleene(eval_re_h body)
                | Null -> Null
              ) in
            Prog_pol_regex.Re(re_core) in
          eval_re_h wf_pol in

        (* Complete the alphabet of the regex. *)
        let full_acts =
          Prog_sevpa.Internals.fold
            (fun prog_act full_acts ->
              Prog_pol_regex.Re(
                Alt(full_acts, Prog_pol_regex.Re(Action(prog_act, full_lat))))
            )
            prog_sevpa.Prog_sevpa.sevpa_ints
            (Prog_pol_regex.Re(Null)) in
        Prog_pol_regex.Re(
          Concat(prog_pol_regex, Prog_pol_regex.Re(Kleene(full_acts)))) in

      (* dist_alpha: alphabet with distinct lattices. *)
      let dist_alpha = 
        let regex_alpha = Prog_pol_regex.regex_alpha compl_regex in
        distinct_alpha pol_info full_lat regex_alpha in

      (* dist_regex: regex with a non-overlapping alphabet. *)
      let rec dist_regex (Prog_pol_regex.Re(re)) =
        (match re with
            Action((instr, lat)) ->
              let sub_acts =
                Prog_pol_regex.Actions.filter
                  (fun (cand_instr, cand_lat) ->
                    (cand_instr = instr) && (Lat_ops.is_sub_lat cand_lat lat)
                  )
                  dist_alpha in
              Prog_pol_regex.Actions.fold
                (fun act actions ->
                  Prog_pol_regex.Re(
                    Alt(Prog_pol_regex.Re(Action(act)), actions))
                )
                sub_acts
                (Prog_pol_regex.Re(Null))
          | Alt(r_0, r_1) -> 
            Prog_pol_regex.Re(Alt(dist_regex r_0, dist_regex r_1))
          | Concat(r_0, r_1) -> 
            Prog_pol_regex.Re(Concat(dist_regex r_0, dist_regex r_1))
          | Eps -> Prog_pol_regex.Re(Eps)
          | Kleene(r_0) -> Prog_pol_regex.Re(Kleene(dist_regex r_0))
          | Null -> Prog_pol_regex.Re(Null)
        ) in
      dist_regex compl_regex in

    (* en_pol_auto: construct a policy automata with enabled
     * sets. *)
    let en_pol_auto pol_dfa =
      (* non_acc_states: the non-accepting states of the automaton. *)
      let non_acc_states = 
        Dfa.States.diff pol_dfa.Dfa.dfa_states pol_dfa.Dfa.dfa_accept in 

      dbg 
        ("en_pol_auto: pre construct pre_instr_post_lats: " 
         ^ (string_of_float (Sys.time())));

      (* pre_instr_post_lats: map from pre state to instruction to
       * post-state to merged lattices. *)
      let pre_instr_post_lats =
        (* For each pre-state: *)
        Dfa.States.fold
          (fun pre ->
            (* instr_post_map: a map from each instruction and
             * post-state to the set of all lattices that transition
             * from pre on the action to the post-state. *)
            let instr_post_map =
              (* empty_map: map every program instruction and post
               * state to an empty set of lattices. *)
              let empty_map =
                Prog_sevpa.Internals.fold
                  (fun instr ->
                    let post_map = 
                      Dfa.States.fold
                        (fun post ->
                          Dfa.State_map.add post Priv_lats.empty
                        )
                        pol_dfa.Dfa.dfa_states 
                        Dfa.State_map.empty in
                    Prog_sevpa.Internal_map.add instr post_map
                  )
                  prog_sevpa.Prog_sevpa.sevpa_ints
                  Prog_sevpa.Internal_map.empty in
              
              (* For each policy action: *)
              Dfa.Actions.fold
                (fun ((instr, dist_lat) as act) instr_map ->
                  let post = pol_dfa.Dfa.dfa_trans pre act in
                  let post_map = 
                    Prog_sevpa.Internal_map.find instr instr_map in
                  let post_map' =
                    Dfa.State_map.add 
                      post 
                      (Priv_lats.add
                         dist_lat (Dfa.State_map.find post post_map))
                      post_map in
                  Prog_sevpa.Internal_map.add instr post_map' instr_map
                )
                pol_dfa.Dfa.dfa_actions
                empty_map in
            Dfa.State_map.add 
              pre
              (Prog_sevpa.Internal_map.map
                 (Dfa.State_map.map Lat_ops.merge_lats) instr_post_map)
          )
          pol_dfa.Dfa.dfa_states
          Dfa.State_map.empty in

      (* en_fn: a function from each policy state to its set of
       * enabled actions. *)
      dbg 
        ("en_pol_auto: pre construct en_fn: " 
         ^ (string_of_float (Sys.time())));
      let en_fn =
        (* no_acc_posts: transition relation with no accepting
         * post-states. *)
        let no_acc_posts =
          Dfa.State_map.map
            (Prog_sevpa.Internal_map.map
               (Dfa.State_map.filter 
                  (fun post _ -> Dfa.States.mem post non_acc_states)))
            pre_instr_post_lats in

        (* en_map: the enabled map. *)
        let en_map =
          Dfa.State_map.map
            (fun instr_map ->
              Prog_sevpa.Internal_map.fold
                (fun instr post_map -> 
                  let instr_lats = 
                    Dfa.State_map.fold
                      (fun _ lats -> Priv_lats.union lats)
                      post_map
                      Priv_lats.empty in
                  Priv_lats.fold
                    (fun lat -> Dfa.Actions.add (instr, lat)) instr_lats
                )
                instr_map
                Dfa.Actions.empty
            )
            no_acc_posts in
        (fun pre -> Dfa.State_map.find pre en_map) in
      dbg 
        ("en_pol_auto: post construct en_fn: " 
         ^ (string_of_float (Sys.time())));
      
      (* en_trans_func: transition function for the new alphabet. *)
      let en_trans_func pre (instr, lat) =
        let post_map = 
          Prog_sevpa.Internal_map.find
            instr (Dfa.State_map.find pre pre_instr_post_lats) in
        let post_opt =
          Dfa.State_map.fold
            (fun post lats post_opt ->
              (match post_opt with
                  Some(_) -> post_opt
                | None -> if Priv_lats.mem lat lats then Some(post) else None
              )
            )
            post_map
            None in
        (match post_opt with
            Some(post) -> post
          | None -> failwith "en_trans_func: not defined on input"
        ) in
      { Dfa.en_states = non_acc_states;
        en_sets = en_fn;
        en_init = pol_dfa.Dfa.dfa_init;
        en_trans = en_trans_func;
      } in

    (* Construct a regex isomorphic to the regex over
     * non-overlapping symbols. *)
    let (iso_regex, struct_to_flat, flat_to_struct) = 
      Iso_cons.iso_regex distinct_regex in
    let isom_nfa = Isom_re_to_nfa.regex_to_nfa iso_regex in
    let memo_isom = Memo_isom.nfa_to_nfa isom_nfa in
    let isom_dfa = Isom_nfa_to_dfa.nfa_to_dfa memo_isom in
    let flat_dfa = Isom_flatten.flatten_dfa isom_dfa in
    let min_dfa = Isom_min_dfa.min_dfa flat_dfa in
    let flat_min_dfa = Isom_flatten_min.flatten_dfa min_dfa in

    (* Construct the isomorphism of the minimized DFA in the
     * alphabet of the policy language. *)
    let translit_states min_states = 
      Flat_dfa.States.fold
        (fun flat_state -> Dfa.States.add flat_state) 
        min_states 
        Dfa.States.empty in
    let pol_actions = 
      Flat_dfa.Actions.fold
        (fun flat_act -> Dfa.Actions.add (flat_to_struct flat_act))
        flat_min_dfa.Flat_dfa.dfa_actions
        Dfa.Actions.empty in
    let pol_trans pre pol_act = 
      flat_min_dfa.Flat_dfa.dfa_trans pre (struct_to_flat pol_act) in
    let pol_dfa = 
      { Dfa.dfa_states = translit_states flat_min_dfa.Flat_dfa.dfa_states;
        dfa_init = flat_min_dfa.Flat_dfa.dfa_init;
        dfa_accept = translit_states flat_min_dfa.Flat_dfa.dfa_accept;
        dfa_actions = pol_actions;
        dfa_trans = pol_trans;
      } in
    dbg 
      ("parse_policy: pre construct enabled-set policy: " 
       ^ (string_of_float (Sys.time())));
    en_pol_auto pol_dfa in

  dbg 
    ("parse_policy: post construct enabled-set policy: " 
     ^ (string_of_float (Sys.time())));
  
  (* state_instr_lats: given a policy state and program instruction,
   * construct the set of all lattices on which the state transitions
   * on the instruction. *)
  let state_instr_lats =
    let instr_lats_map =
      let empty_int_map = 
        Prog_sevpa.Internals.fold
          (fun instr -> Prog_sevpa.Internal_map.add instr Priv_lats.empty)
          prog_sevpa.Prog_sevpa.sevpa_ints 
          Prog_sevpa.Internal_map.empty in
      (* For each policy state: *)
      Dfa.States.fold
        (fun pre ->
          (* For each policy action enabled in the state: *)
          let state_map = 
            Dfa.Actions.fold
              (fun (instr, lat) instr_map -> 
                Prog_sevpa.Internal_map.add
                  instr 
                  (Priv_lats.add
                     lat (Prog_sevpa.Internal_map.find instr instr_map))
                  instr_map
              )
              (pol_en_dfa.Dfa.en_sets pre)
              empty_int_map in
          Dfa.State_map.add pre state_map
        )
        pol_en_dfa.Dfa.en_states
        Dfa.State_map.empty in
    (fun state instr -> 
      Prog_sevpa.Internal_map.find
        instr (Dfa.State_map.find state instr_lats_map) 
    ) in

  (* Construct the policy object. *)
  { full_lattice = full_lat;
    info = pol_info;
    dfa = pol_en_dfa;
    pol_state_instr_lats = state_instr_lats;
  }
