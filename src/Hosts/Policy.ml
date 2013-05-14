open Libext
open Vpa
open Program

(* ne_lattice: a non-empty lattice of privileges. *)
type 'priv ne_lattice =
    { lower_bound: 'priv;
      upper_bound: 'priv;
    }

let ne_lat_to_string priv_to_string lat =
  "lower bound: " ^ (priv_to_string lat.lower_bound)
  ^ "\nupper bound: " ^ (priv_to_string lat.upper_bound)

let lat_compare cmp lat_0 lat_1 =
  let cmp_0 = cmp lat_0.lower_bound lat_1.lower_bound in
  if cmp_0 != 0 then cmp_0 else cmp lat_0.upper_bound lat_1.upper_bound

(* priv_lattice: a potentially empty lattice of privileges. *)
type 'priv priv_lattice_cons =
    Non_empty_lat of 'priv ne_lattice
  | Empty_lat

module type PRIV_LAT =
sig
  (* priv: the privilege ordered by the lattice. *)
  type priv
  module Priv: Set.OrderedType with type t = priv
  module Privs: Set.S with type elt = priv

  val join: priv -> priv -> priv
  val meet: priv -> priv -> priv

  (* lower_neighbors: all elements in the lattice that are
   * immediately lower than a given privilege. *)
  val lower_neighbors: priv -> Privs.t 

  (* upper_neighbors: all elements in the lattice that are
   * immediately higher than the given privilege. *)
  val upper_neighbors: priv -> Privs.t

  (* priv_to_string: construct the string representation of a
   * privilege. *)
  val priv_to_string: priv -> string
end

module type LATTICE_OPS =
sig
  (* priv: an ordered privilege. *)
  type priv

  (* priv_lattice: a potentially empty lattice of privileges. *)
  type priv_lattice = priv priv_lattice_cons

  module Priv_lat: Set.OrderedType with type t = priv_lattice

  (* Priv_lats: a set of privilege lattices. *)
  module Priv_lats: Set.S with type elt = priv_lattice

  (* diff_lats: construct the difference of two lattices. *)
  val diff_lats: priv_lattice -> priv_lattice -> Priv_lats.t

  (* diff_lat_sets: difference over sets of lattices. *)
  val diff_lat_sets: Priv_lats.t -> Priv_lats.t -> Priv_lats.t

  (* intersect_lattices: construct the intersection of two
   * lattices. *)
  val intersect_lats: priv_lattice -> priv_lattice -> priv_lattice

  (* intersect_lat_sets: intersect clauses of lattices. *)
  val intersect_lat_sets: Priv_lats.t -> Priv_lats.t -> Priv_lats.t

  (* is_sub_lat: decide if the first lattice is a subset of the
   * second lattice. *)
  val is_sub_lat: priv_lattice -> priv_lattice -> bool

  (* merge_lats: merge a set of lattices into maximal components. *)
  val merge_lats: Priv_lats.t -> Priv_lats.t

  (* priv_lattice_is_empty: decide if a lattice of privileges is
   * empty. *)
  val lat_is_empty: priv_lattice -> bool

  (* lat_to_string: construct the string representation of a
   * lattice. *)
  val lat_to_string: priv_lattice -> string

  (* union_lats: from two lattices, construct a set of lattices that
   * holds the union of the clauses. *)
  val union_lats: priv_lattice -> priv_lattice -> Priv_lats.t

  (* union_lat_sets: extend the union operation to sets of lattices. *)
  val union_lat_sets: Priv_lats.t -> Priv_lats.t -> Priv_lats.t
end

(* Lat_ops_abs: functor for creating a module of operations over a
 * lattice. *)
module Lat_ops_abs =
  functor (Lat_comps: PRIV_LAT) ->
struct
  type priv = Lat_comps.priv
  module Priv = Lat_comps.Priv
  module Privs = Lat_comps.Privs
  type priv_lattice = priv priv_lattice_cons

  module Priv_lat = 
  struct
    type t = priv_lattice
    let compare lat_0 lat_1 = 
      (match lat_0, lat_1 with
          Non_empty_lat(ne_0), Non_empty_lat(ne_1) -> 
            lat_compare Priv.compare ne_0 ne_1
        | _ -> compare lat_0 lat_1
      )
  end

  (* Priv_lats: a set of lattices. *)
  module Priv_lats = Set.Make(Priv_lat)

  (* lat_is_empty: lattice is empty. *)
  let lat_is_empty lat =
    (match lat with
        Non_empty_lat(_) -> false
      | Empty_lat -> true
    )

  (* lat_order: decide if priv_0 is below priv_1 in the lattice
   * ordering. *)
  let lat_order priv_0 priv_1 =
    (Priv.compare (Lat_comps.meet priv_0 priv_1) priv_0 = 0)

  (* is_sub_lat: decide if lat_0 is a sub-lattice of lat_1. *)
  let is_sub_lat lat_0 lat_1 =
    (match lat_0, lat_1 with
        Non_empty_lat(ne_lat_0), Non_empty_lat(ne_lat_1) -> 
          (lat_order ne_lat_1.lower_bound ne_lat_0.lower_bound)
          && (lat_order ne_lat_0.upper_bound ne_lat_1.upper_bound)
      | Empty_lat, _ -> true
      | Non_empty_lat(_), Empty_lat -> false
    )

  (* intersect_lats: intersect two lattices. *)
  let intersect_lats lat_0 lat_1 =
    (match lat_0, lat_1 with
        Non_empty_lat(ne_lat_0), Non_empty_lat(ne_lat_1) ->
          let lb = Lat_comps.join ne_lat_0.lower_bound ne_lat_1.lower_bound in
          let ub = Lat_comps.meet ne_lat_0.upper_bound ne_lat_1.upper_bound in
          if lat_order lb ub then 
            let ne_inter =
              { lower_bound = lb;
                upper_bound = ub;
              } in
            Non_empty_lat(ne_inter)
          else Empty_lat
      | Empty_lat, _
      | _, Empty_lat -> Empty_lat
    )

  (* intersect_lat_sets: intersect clauses of lattices. *)
  let intersect_lat_sets_unmerged clause_0 clause_1 =
    (* For each lattice in the first clause: *)
    Priv_lats.fold
      (fun lat_0 inter_0 ->
        (* For each lattice in the second clause: *)
        Priv_lats.fold
          (fun lat_1 inter_1 ->
            let inter_lat = intersect_lats lat_0 lat_1 in
            if lat_is_empty inter_lat then inter_1
            else Priv_lats.add inter_lat inter_1
          )
          clause_1
          inter_0
      )
      clause_0
      Priv_lats.empty

  (* diff_lats: construct the difference of two lattices. *)
  let diff_lats lat_0 lat_1 =
    (match lat_0, lat_1 with
        Non_empty_lat(vecs_0), Non_empty_lat(vecs_1) ->
          (* lower_bounds: vectors that are higher than the upper
           * bound of lat_0. *)
          let lower_bounded =
            Privs.fold
              (fun lower_bound lower_bounded -> 
                if lat_order lower_bound vecs_0.upper_bound then
                  let lat_core =
                    { lower_bound = lower_bound;
                      upper_bound = vecs_0.upper_bound;
                    } in
                  Priv_lats.add (Non_empty_lat(lat_core)) lower_bounded
                else lower_bounded
              )
              (Lat_comps.upper_neighbors vecs_1.upper_bound) 
              Priv_lats.empty in

          (* upper_bounds: vectors that are the lower than the lower
           * bound of lat_0. *)
          let upper_bounded =
            Privs.fold
              (fun upper_bound upper_bounded ->
                if lat_order vecs_0.lower_bound upper_bound then
                  let lat_core =
                    { lower_bound = vecs_0.lower_bound;
                      upper_bound = upper_bound;
                    } in
                  Priv_lats.add (Non_empty_lat(lat_core)) upper_bounded
                else upper_bounded
              )
              (Lat_comps.lower_neighbors vecs_1.lower_bound)
              Priv_lats.empty in
          intersect_lat_sets_unmerged
            (Priv_lats.union lower_bounded upper_bounded) 
            (Priv_lats.singleton lat_0)
      | Empty_lat, _ -> Priv_lats.empty
      | Non_empty_lat(_), Empty_lat -> Priv_lats.singleton lat_0
    )

  (* Take the difference of two clauses of lattices. *)
  let diff_lat_sets_unmerged clause_0 clause_1 =
    (* For each lattice in the first clause. *)
    Priv_lats.fold
      (fun lat_0 ->
        let cur_diff =
            (* For each lattice in the differencing clause: *)
          Priv_lats.fold
            (fun lat_1 cur_diff ->
              Priv_lats.fold
                (fun diff_lat ->
                  Priv_lats.union (diff_lats diff_lat lat_1)
                )
                cur_diff
                Priv_lats.empty
            )
            clause_1
            (Priv_lats.singleton lat_0) in
        Priv_lats.union cur_diff
      )
      clause_0
      Priv_lats.empty

  (* choose_max_lats: choose a maximal subset of lattices. *)
  let choose_max_lats lats =
    let rec choose_max_lats_ind max_lats unchecked =
      if Priv_lats.is_empty unchecked then max_lats
      else
        let chosen = Priv_lats.choose unchecked in
        let unchecked' = Priv_lats.remove chosen unchecked in

        (* uncovered_subs: sublattices of the chosen lattice that
         * aren't covered by either max lattices of unchecked
         * lattices. *)
        let uncovered_subs =
          (* For each max or unchecked lattice: *)
          Priv_lats.fold
            (fun tile uncovered_subs ->
              (* For each uncovered sublattice of the chosen
               * lattice: *)
              Priv_lats.fold
                (fun uncovered_sub ->
                  Priv_lats.union (diff_lats uncovered_sub tile)
                )
                uncovered_subs
                Priv_lats.empty
            )
            (Priv_lats.union max_lats unchecked')
            (Priv_lats.singleton chosen) in

        let max_lats' =
          if Priv_lats.is_empty uncovered_subs then max_lats
          else Priv_lats.add chosen max_lats in
        choose_max_lats_ind max_lats' unchecked' in
    choose_max_lats_ind Priv_lats.empty lats

  (* merge_lats: merge a set of lattices. *)
  let merge_lats lats =
    (* ext_lats: lattices constructed from extreme points. *)
    let ext_lats =
      let (bots, tops) =
        Priv_lats.fold
          (fun lat (bots, tops) ->
            (match lat with
                Non_empty_lat(lat) ->
                  (Privs.add lat.lower_bound bots,
                   Privs.add lat.upper_bound tops)
              | Empty_lat -> (tops, bots)
            )
          )
          lats
          (Privs.empty, Privs.empty) in
      Privs.fold
        (fun bot ->
          Privs.fold
            (fun top ->
              let core_lat =
                { lower_bound = bot;
                  upper_bound = top;
                } in
              Priv_lats.add (Non_empty_lat(core_lat))
            )
            tops
        )
        bots
        Priv_lats.empty in
    
    (* covered_lats: lattices that are a subset of the union of the
     * original set of lattices. *)
    let covered_lats =
      Priv_lats.filter
        (fun priv_lat ->
          let all_diff =
            diff_lat_sets_unmerged (Priv_lats.singleton priv_lat) lats in
          let ne_diff =
            Priv_lats.filter
              (fun raw_diff -> not (lat_is_empty raw_diff)) all_diff in
          Priv_lats.is_empty ne_diff
        )
        ext_lats in

    (* uncontained_lats: lattices that are not contained by any other
     * lattices. *)
    let uncontained_lats =
      Priv_lats.filter
        (fun cand -> 
          Priv_lats.for_all 
            (fun cover -> not (is_sub_lat cand cover))
            (Priv_lats.remove cand covered_lats)
        )
        covered_lats in
    choose_max_lats uncontained_lats

  (* diff_lat_sets: take difference of two sets of lattices and merge
   * the result. *)
  let diff_lat_sets clause_0 clause_1 =
    merge_lats (diff_lat_sets_unmerged clause_0 clause_1)

  (* intersect_lat_sets: intersect clauses of lattices. *)
  let intersect_lat_sets clause_0 clause_1 =
    merge_lats (intersect_lat_sets_unmerged clause_0 clause_1)

  (* union_lat_sets: extend the union operation to sets of lattices. *)
  let union_lat_sets lats_0 lats_1 =
    merge_lats (Priv_lats.union lats_0 lats_1)

  (* union_lats: from two lattices, construct a set of lattices that
   * holds the union of the clauses. *)
  let union_lats lat_0 lat_1 =
    union_lat_sets (Priv_lats.singleton lat_0) (Priv_lats.singleton lat_1)

  (* lattice_to_string: construct the string representation of a
   * lattice. *)
  let lat_to_string lat =
    (match lat with
        Non_empty_lat(ne_lat) -> 
          ne_lat_to_string Lat_comps.priv_to_string ne_lat
      | Empty_lat -> "Empty"
    )

end

(* POLICY: a module of policy stuff. *)
module type POLICY =
sig

  (* pol_info: type of a record of host-specific policy
   * information. *)
  type pol_info

  (* Lat_ops: a module of lattice operations. *)
  (* TODO: type error, pick up from here. *)
  module Lat_ops: LATTICE_OPS

  (* priv: a policy privilege. *)
  type priv_lattice = Lat_ops.priv_lattice

  (* Dfa: a policy DFA. *)
  module Dfa: DFA
    with type action = Program.Prog_sevpa.Internal.t * priv_lattice

  (* policy: everything you could want to know about a policy. *)
  type policy =
      { (* info: a host-dependent type of policy information. *)
        info: pol_info;

        full_lattice: priv_lattice;

        (* dfa: the policy automaton. *)
        dfa: Dfa.enabled_dfa;

        pol_state_instr_lats: 
          Dfa.state -> Prog_sevpa.Internal.t -> Lat_ops.Priv_lats.t;
      }

  (* program_policy: takes a policy text and a program SEVPA, and
   * constructs a policy. *)
  val parse_policy: Program.Prog_sevpa.sevpa -> string -> policy
end
