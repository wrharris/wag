open Libext

(* open LLVM modules. *)
open Llvm
open Llvm_prog

type prog_action =
    Conc_act of Llvm.llvalue
  | Any_prog_act

module Prog_actions =
  Set.Make(
    struct
      type t = prog_action
      let compare = compare
    end)

(* action: an action for a regular expression is an LLVM instruction
 * paired with a set of capabilities. *)
type action = Llvm.llvalue * Vector_lattice.t

module Actions =
  Set.Make(
    struct
      type t = action
      let compare = compare
    end)

(* regex: type of a regular expression. *)
type regex =
    Action of action
  | Inter of regex * regex
  | Compl of regex
  | Concat of regex * regex
  | Kleene of action
  | Union of regex * regex

(* amb_vec: takes a flag for ambient capability, constructs a
 * capability vector from it. *)
let amb_vec amb_flag = 
  { amb = Some(amb_flag);
    desc_rights = Desc_map.empty;
  }

let bounded_vectors def_amb def_rights chk rights vector =
  (* amb_vecs: vectors that have all possible values of the ambient
   * flag. *)
  let amb_vecs =
    (match vector.amb with
        Some(amb_flag) ->
          let exact =
            { amb = amb_flag;
              desc_rights = Desc_map.empty;
            } in
          let approx =
            if implies def_amb amb_flag then
              Cap_vector.singleton
                { amb = def_amb;
                  desc_rights = Desc_map.empty;
                }
            else Cap_vectors.empty
      | None -> 
        Cap_vectors.add
          { amb = true;
            desc_rights = Desc_map.empty;
          }
          (Cap_vectors.singleton
             { amb = false;
               desc_rights = Desc_map.empty;
             }
          )
    ) in

  (* Extend result vectors by all possible sets of rights for each
   * descriptor. *)
  let rights_ps = rights_pset rights in
  Descs.fold
    (fun desc vectors ->
      let rights_bound =
        try Desc_map.find desc vector.desc_rights in
        with Not_found -> def_rights in

      let bounded_rights = Rights_set.filter (chk rights_bound) rights_ps in
      Cap_vectors.fold
        (fun vector vectors ->
          Rights_set.fold
            (fun rights vectors ->
              Cap_vectors.add
                { amb = vector.amb_flag;
                  desc_rights = Right_map.add desc rights vector.desc_rights;
                }
                vectors
            )
            bounded_rights
            vectors
        )
        vectors
        Cap_vectors.empty
    )
    descs
    amb_vecs

(* cap_vec: takes a capability, constructs a partial capability vector
 * from it. *)
let cap_vec cap = 
  { amb = None;
    desc_rights = Desc_map.singleton cap.desc cap.rights;
  }

(* lookup_blk: takes a program and a basic block, looks up the first
 * instruction in the block. *)
let lookup_blk prog blk_nm =
  let found_opt =
    Llvm.fold_left_function
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

(* lower_bound: takes a set of rights as input, constructs the set of
 * all sets of rights that are lower-bounded by the input. *)
let lower_bound descs rights vector =
  bounded_rights false Rights.empty Rights.subset descs rights vector

(* part_vec_join: join two partial vectors into a partial vector. *)
let part_vec_join vec_0 vec_1 = 
  (* amb': the ambient flag of the join. *)
  let amb' =
    (match vec_0.amb, vec_1.amb with
        Some(_), None -> vec_0.amb
      | _ -> vec_1.amb
    ) in

  (* desc_rights': the descriptor-rights map of the join. *)
  let desc_rights' =
    Desc_map.merge
      (fun desc rights_0_opt rights_1_opt ->
        (match rights_0_opt, rights_1_opt with
            Some(_), _ -> rights_0
          | _ -> rights_1_opt
        )
      )
      vec_0.desc_rights
      vec_1.desc_rights in
  { amb = amb';
    desc_rights = desc_rights';
  }

(* prod_acts: takes a set of program actions and a set of sets of
 * capability. Constructs the set of all policy actions in the product of
 * the two. *)
let prod_acts prog_acts vectors =
  Prog_acts.fold
    (fun prog_act acts ->
      Cap_vectors.fold
        (fun vector acts ->
          Pol_acts.add (prog_acts, Lattice(vector, vector)) acts
        )
        vectors
        acts
    )
    prog_acts
    Pol_acts.empty

(* upper_bound: takes a capability vector as input, constructs the set
 * of all vectors upper-bounded by the vector. *)
let upper_bound descs rights vector =
  bounded_vectors
    true rights (fun bound rs -> Rights.subset rs bound) descs rights vector


(* hand_gzip_regex: a policy regex for gzip, constructed by hand. *)
let hand_gzip_regex prog =
  (* Front matter. The policy compiler should infer this automatically. *)
  let open_ifd = lookup_blk prog "openifd" in
  let open_ofd = lookup_blk prog "openofd" in

  (* vecs_uni: the universe of all capability vectors. *)
  let vecs_uni =
    (* descs_uni: the universe of all descriptors. *)
    let descs_uni =
      let ifd = Llvm_desc(open_ifd) in
      let ofd = Llvm_desc(open_ofd) in
      desc_ls_to_set [ ifd; ofd ] in

    (* rights_uni: the universe of all rights referred to in the policy. *)
    let rights_uni = right_ls_to_set [ Init; Ioctl; Read; Seek; Write ] in
    vectors_uni descs_uni rights_uni in

  let compl_vectors = complement_vectors vecs_uni in
  
  (* any_act: any policy action. *)
  let any_act = prod_acts (Prog_acts.singleton Any_prog_act) vecs_uni in

  (* The proper policy. *)

  (* insuf_rd: executions in which gzip reads without sufficient
   * capability. *)
  let insuf_rd =
    (* open_ifd_acts: gzip opens the input file descriptor with any
     * set of capabilities. *)
    let open_ifd_acts = prod_acts (Prog_acts.singleton open_ifd) vecs_uni in

    (* insuff_rd_acts: gzip executes with insufficient read
     * capability. *)
    let insuff_rd_acts =
      let rd_cap_vec = 
        let rd_cap = Cap(ifd, right_ls_to_set [ Read ]) in
        cap_vec rd_cap in
      let insuff_rd_vecs = 
        let suff_rd_vecs = lower_bound descs rights rd_cap_vec in
        compl_vectors suff_rd_vecs in
      prod_acts (Prog_acts.singleton open_ifd) insuff_rd_vecs in
    Concat(Kleene(any_act),
           Concat(open_ifd_acts,
                  Concat(Kleene(any_act),
                         insuff_rd_acts))) in

  (* insuf_wr: executions in which gzip writes without sufficient
   * capability. *)
  let insuf_wr = 
    let open_ofd_acts = prod_acts (Prog_acts.singleton open_ofd) vecs_uni in

    (* insuff_wr_act: gzip executes with insufficient write
     * capability. *)
    let insuff_wr_acts =
      let wr_cap = Cap(ofd, right_ls_to_set [ Write ]) in
      let wr_cap_vec = cap_vec rd_cap in
      let suff_wr_vecs = lower_bound descs rights wr_cap_vec in
      let insuff_wr_vecs = compl_vectors suff_wr_vecs in
      prod_acts (Prog_acts.singleton open_ofd) insuff_wr_vecs in
    Concat(Kleene(any_act),
           Concat(open_ofd_acts,
                  Concat(Kleene(any_act),
                         insuff_wr_acts))) in

  (* insec: executions in which gzip allows a security violation. *)
  let insec =
    let insec_acts = 
      (* begin_vuln: instruction at which the vulnerability begins. *)
      let begin_vuln = lookup_blk prog "vuln" in
      let insec_vecs =
        let sec_vecs =
          let cap_vec =
            let sec_rd_cap = Cap(ifd, rights_ls_to_set [ Read ]) in
            let sec_wr_cap = Cap(ofd, rights_ls_to_set [ Write ]) in
            vec_join (vec_join (amb_vec true) sec_rd_cap) sec_wr_cap in
          upper_bound descs rights cap_vec in
        compl_vectors sec_vecs in
      prod_acts (Prog_acts.singleton begin_vuln) insec_vecs in
    Concat(Kleene(any_act), insec_acts) in

  (* All of the bad executions. *)
  Union(insuf_rd, Union(insuf_wr, insec))
