open Libext

(* LLVM: *)
open Llvm

(* Wag modules. *)
open Host
open Policy
open Program
open Vpa

(* Cappols modules. *)
open Cappol_regex_types

type desc = Llvm.llvalue desc_cons

val desc_to_string: desc -> string

module Descs: Set.S with type elt = desc

module Desc_map: Map.S with type key = desc

(* right: the fixed Capsicum rights. *)
type right = Cappol_regex_types.right

val right_to_string: right -> string

module Rights: Set.S with type elt = right

type cap_rights =
    Cap of Rights.t
  | Non_cap
  | Uninit

module Rights_set: Set.S with type elt = Rights.t

(* right_pset: takes a set of rights, constructs the power set of all
 * rights. *)
val right_pset: Rights.t -> Rights_set.t

(* cap_vector: a capability vector is a flag that denotes if the
 * process is in ambient mode, and a total map from each descriptor to
 * a set of rights. *)
type cap_vector =
    { amb: bool;
      desc_rights: cap_rights Desc_map.t;
      rights_ceiling: Rights.t Desc_map.t;
    }

type pol_info =
    { descs: Descs.t;
      desc_to_all: Rights.t Desc_map.t;
    }

module Lat_ops: LATTICE_OPS with type priv = cap_vector

type priv_lattice = Lat_ops.priv_lattice

module Dfa: DFA
  with type action = Program.Prog_sevpa.Internal.t * priv_lattice

type policy =
    { info: pol_info;

      full_lattice: priv_lattice;

      dfa: Dfa.enabled_dfa;
      
      pol_state_instr_lats: 
        Dfa.state -> Prog_sevpa.Internal.t -> Lat_ops.Priv_lats.t;
    }

val parse_policy: Program.Prog_sevpa.sevpa -> string -> policy
