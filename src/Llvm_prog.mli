(* Llvm_prog.mli: interface for representing uninstrumented C
 * programs. *)
open Libext
open Llvm
open Vpa

(* Prog_sevpa: a program SEVPA. *)
module Llvm_sevpa: SEVPA

module Llvm_blocks: Set.S with type elt = Llvm.llbasicblock
module Llvm_posits: Set.S with type elt = (llmodule, llvalue) llpos
module Llvm_value: Set.OrderedType with type t = Llvm.llvalue
module Llvm_values: Set.S with type elt = Llvm.llvalue
module Llvm_value_map: Map.S with type key = Llvm.llvalue

type lib

val block_front: Llvm.llbasicblock -> Llvm.llvalue

val call_to_llvm_func: Llvm_sevpa.Call.t -> Llvm.llvalue

val callers: lib -> Strings.t -> String_pairs.t

val callee_name: Llvm.llvalue -> string option

(* fork_part_funcs: takes an LLVM module. Constructs the set of model
 * calls that can be executed in a fork. *)
(* val fork_part_funcs: Llvm.llmodule -> Llvm_sevpa.Calls.t *)

(* gen_index: from a set of internals, generate an index from
 * instruction to integer value. *)
val gen_index: Llvm_sevpa.Internals.t -> Llvm.llvalue -> int

(* gen_llvm_instr_store: generate a store that holds the LLVM-specific
 * instrumentation state. *)
val gen_llvm_instr_store:
  Llvm_sevpa.Internals.t ->
  (Llvm_sevpa.Internal.t -> int) ->
  (Llvm.llvalue -> int) -> 
  Llvm_sevpa.Mod_ids.t -> 
  (Llvm_sevpa.vpa_mod_id -> int) -> 
  string ->
  unit

type instr_func = 
    lib ->
    Llvm_sevpa.Internals.t ->
    (Llvm.llvalue -> int) ->
    Llvm_sevpa.Mod_ids.t ->
    (Llvm_sevpa.vpa_mod_id -> int) ->
    unit

val instr_entry: instr_func

val instr_lib: instr_func

val internal_stub_callee: Llvm_sevpa.Internal.t -> string option

(* is_fork_func: decide if a program function is forkable. *)
val is_fork_func: Llvm_sevpa.Call.t -> bool

(* is_part_func: decide if a program function is RPC-partitionable. *)
val is_part_func: Llvm_sevpa.Call.t -> bool

val lib_name: lib -> string

(* lib_to_sevpa: takes an Llvm_prog.lib, constructs a SEVPA from the
 * lib. *)
val lib_to_lib_sevpa:
  lib -> String_pairs.t -> Llvm_sevpa.sevpa_lib * Llvm_sevpa.Internals.t

val lib_to_sevpa:
  lib -> String_pairs.t -> Llvm_sevpa.sevpa * Llvm_sevpa.Internals.t

(* pad_prog: takes as input a program module and a set of key
 * instructions. Modifies the program to containing padding instructions
 * before the key instructions, and returns the padding instructions. *)
val pad_prog: Llvm.llmodule -> Llvm_values.t -> Llvm_values.t

val lib_cg: lib -> Strings.t String_map.t

(* load_lib: load a library from a filename. *)
val load_lib: string -> lib

(* rpc_part_funcs: functions that can be the site of partitions. *)
val rpc_part_funcs:
  Llvm.llmodule ->
  Llvm_sevpa.Calls.t Llvm_sevpa.Call_trans_map.t ->
  Llvm_sevpa.Calls.t

(* TODO: this is a hack. *)
val internal_instr: Llvm_sevpa.Internal.t -> Llvm.llvalue
