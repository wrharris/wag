(* Capsicum.mli: interface for the module that contains the Capsicum
 * model. Module should be of module type HOST. *)
open Libext

open Z3

(* Open weaver-generator libs: *)
open Program
open Host
open Policy

(* Open the Capsicum policy module: *)
open Cappols

module Policy: POLICY

val marker_names: Strings.t

type prim

module Prim: Set.OrderedType with type t = prim
module Prims: Set.S with type elt = prim

module Host_trfrm: Set.OrderedType
module Host_trfrms: Set.S with type elt = Host_trfrm.t

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

      entry_priv_lat: Policy.priv_lattice;

      instr_to_transforms: Program.Prog_sevpa.Internal.t -> Host_trfrms.t;

      is_entry_trfrm: Host_trfrm.t -> bool;

      is_entry_priv_lats: Policy.Lat_ops.Priv_lats.t -> bool;

      prim_score: prim -> int;

      prims: Prims.t;

      prim_to_transforms: Prim.t -> Host_trfrms.t;

      stack_wp_transform: 
        Host_trfrm.t -> Policy.priv_lattice -> Policy.priv_lattice;

      wp_transform:
        Host_trfrm.t -> Policy.priv_lattice -> Policy.priv_lattice;
    }

val cons_host_monitor:
  Program.prog -> Program.Prog_sevpa.sevpa -> Policy.policy -> host_monitor

val cons_code_gen: host_monitor -> Llvm.llmodule -> Prim.t -> Llvm.llvalue

val key_host_internals: 
    Program.Prog_sevpa.Internals.t ->
    Program.Prog_sevpa.Internals.t ->
    Program.Prog_sevpa.Internals.t

val prim_to_string: Prim.t -> string

val trfrm_to_string: Host_trfrm.t -> string
