(* Program.mli: interface for representing uninstrumented C programs. *)
open Libext
open Vpa
open Llvm_prog
open Bin_prog

(* Prog_sevpa: a program SEVPA. *)
module Prog_sevpa: SEVPA

(* prog_acts: program actions. *)
type prog_acts

(* prog: a program. *)
type prog

(* append_llvm_lib: takes a program and an LLVM library name. Adds the
 * LLVM library to the program. *)
val append_llvm_lib: prog -> string -> prog

(* call_to_llvm_func: takes a call, generates an LLVM function
 * representation. *)
val call_to_llvm_func: Prog_sevpa.Call.t -> Llvm.llvalue

(* fork_part_funcs: takes a program and constructs the set of program
 * functions that are forkable. *)
val fork_part_funcs: Prog_sevpa.Calls.t -> prog -> Prog_sevpa.Calls.t

(* instr_prog: instrument the program. *)
val instr_prog:
  prog ->
  Prog_sevpa.Internals.t ->
  (Prog_sevpa.Internal.t -> int) -> 
  Prog_sevpa.Mod_ids.t ->
  (Prog_sevpa.vpa_mod_id -> int) ->
  unit

(* lookup_call: takes a program SEVPA, function name, and integer
 * code, and returns the internal action that corresponds to calling the
 * function with the integer code. *)
val lookup_call: Prog_sevpa.sevpa -> string -> int -> Prog_sevpa.internal

(* parse_prog: take optional names of modules and parse them into a
 * program. *)
val parse_prog:
  string option -> string option -> string option -> string option -> prog

val prog_name: prog -> string

(* prog_to_vpa: take a program as input, construct the program
 * SEVPA. *)
val prog_to_vpa: Strings.t -> prog -> Prog_sevpa.sevpa

(* rpc_part_funcs: takes a program and returns the set of program
 * functions that are RPC-partitionable.  *)
val rpc_part_funcs: Prog_sevpa.Calls.t -> prog -> Prog_sevpa.Calls.t

(* TODO: this is a hack. *)
val llvm_inst: Prog_sevpa.Internal.t -> Llvm.llvalue option
