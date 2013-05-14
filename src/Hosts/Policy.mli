open Vpa
open Program

(* ne_lattice: a non-empty lattice of privileges. *)
type 'priv ne_lattice =
    { lower_bound: 'priv;
      upper_bound: 'priv;
    }

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

  (* Priv_lat: ordered type of privilege lattices. *)
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

  (* lattice_to_string: construct the string representation of a
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
module Lat_ops_abs:
  functor (Priv_lat: PRIV_LAT) -> LATTICE_OPS with type priv = Priv_lat.priv

(* POLICY: a module of policy stuff. *)
module type POLICY =
sig
  (* pol_info: type of a record of host-specific policy
   * information. *)
  type pol_info

  (* Lat_ops: a module of lattice operations. *)
  module Lat_ops: LATTICE_OPS
  type priv_lattice = Lat_ops.priv_lattice

  (* Dfa: a policy DFA. *)
  module Dfa: DFA
    with type action = Program.Prog_sevpa.Internal.t * priv_lattice

  (* policy: everything you could want to know about a policy. *)
  type policy =
      { (* info: a host-dependent type of policy information. *)
        info: pol_info;

        (* full_lattice: the lattice of all privileges. *)
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
