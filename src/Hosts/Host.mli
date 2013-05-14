open Libext

open Llvm

(* open WAG modules. *)
open Program
open Policy

module type HOST =
sig
  module Policy: POLICY

  val marker_names: Strings.t

  (* prim: a host primitive. *)
  type prim
  module Prim: Set.OrderedType with type t = prim
  module Prims: Set.S with type elt = prim

  (* Host_trfrm: a function over host states. *)
  module Host_trfrm: Set.OrderedType
  module Host_trfrms: Set.S with type elt = Host_trfrm.t

  type host_monitor =
      {
        (* int_compose_transforms: compose two transforms over an
         * internal transition. *)
        int_compose_transforms:
          Host_trfrm.t -> Host_trfrm.t -> Host_trfrm.t option;
        
        (* ret_compose_transforms: compose transforms over a return
           transition. *)
        ret_compose_transforms:
          Host_trfrm.t -> Host_trfrm.t -> Host_trfrm.t option;

        (* trans_id: the identity transformation over host states. *)
        trans_id: Host_trfrms.t;

        (* trans_init: the initial transformation over host states. *)
        trans_init: Host_trfrm.t;

        (* enabled_prims: the set of primitives enabled for a host
         * transform. *)
        enabled_prims: 
          Prog_sevpa.state -> Policy.Dfa.state -> Host_trfrm.t -> Prims.t;

        entry_priv_lat: Policy.priv_lattice;

        (* inst_to_transform: takes a program internal action and
         * constructs the resulting Host_trfrm. *)
        instr_to_transforms: Program.Prog_sevpa.Internal.t -> Host_trfrms.t;

        (* is_entry_trfrm: decide if the transform is a transform of
         * the entry module. *)
        is_entry_trfrm: Host_trfrm.t -> bool;

        (* is_entry_priv_lattice: decide if a lattice of privileges
         * contains the privileges that the program has at the
         * beginning of execution. *)
        is_entry_priv_lats: Policy.Lat_ops.Priv_lats.t -> bool;

        (* prim_score: the numeric score of a primitive. Higher is
         * more expensive. *)
        prim_score: prim -> int;

        (* prims: the set of primitives. *)
        prims: Prims.t;
        
        (* prim_to_transforms: takes a primitive and constructs the
         * corresponding Host transforms. *)
        prim_to_transforms: Prim.t -> Host_trfrms.t;
          
        stack_wp_transform:
          Host_trfrm.t -> Policy.priv_lattice -> Policy.priv_lattice;

        (* wp_transform: for a given host transform and result privilege
         * lattice, get the weakest lattice of privileges that cause the
         * result privilege lattice. *)
        wp_transform:
          Host_trfrm.t -> Policy.priv_lattice -> Policy.priv_lattice;
      }

  (* cons_host_monitor: from a program SEVPA and a policy SEVPA,
   * construct the host monitor for the program and policy. *)
  val cons_host_monitor: 
    Program.prog -> Program.Prog_sevpa.sevpa -> Policy.policy -> host_monitor

  (* cons_code_gen: takes as input:
   * 
   * -a host monitor
   * 
   * -an LLVM module acting as instrumentation store
   * 
   * Mutates the LLVM store and produces a map from each primitive
   * defined by the host monitor to its LLVM representation.
   *)
  val cons_code_gen: host_monitor -> Llvm.llmodule -> Prim.t -> Llvm.llvalue

  (* key_host_internals: takes a set of program internal instructions
   * and finds the instructions that are relevant to the execution of
   * the host. *)
  val key_host_internals:
    Program.Prog_sevpa.Internals.t ->
    Program.Prog_sevpa.Internals.t ->
    Program.Prog_sevpa.Internals.t

  (* prim_to_string: get the string representation of a primitive. *)
  val prim_to_string: Prim.t -> string

  (* trfrm_to_string: construct string represention of a Host
   * transform. *)
  val trfrm_to_string: Host_trfrm.t -> string
end
