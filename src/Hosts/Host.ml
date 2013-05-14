open Program
open Vpa

(* HOST_COMPS: components of host modules. *)
module type HOST_COMPS =
sig
  module Comp_inner_state: Set.OrderedType

  module Comp_host_state: Set.OrderedType

  val comp_host_state_to_inner: Comp_host_state.t -> Comp_inner_state.t
  val comp_inner_state_to_host: Comp_inner_state.t -> Comp_host_state.t
  val comp_inner_state_to_string: Comp_inner_state.t -> string

  module Progrm: NWA
    with module Inner_state = Comp_inner_state
with type int_action = Program.internal
with type func = func
with type call = call
with type return = return
  
  module Policies: NWA
end

(* POL_COMPS: components a policy module. *)
module type POL_COMPS =
sig
  module Comp_inner_state: Set.OrderedType
  module Comp_pol_state: Set.OrderedType

  val comp_inner_state_to_pol: Comp_inner_state.t -> Comp_pol_state.t
  val comp_pol_state_to_inner: Comp_pol_state.t -> Comp_inner_state.t
  val comp_inner_state_to_string: Comp_inner_state.t -> string
    
  module Progrm: NWA
    with module Inner_state = Comp_inner_state
with type int_action = Program.internal
with type func = func
with type call = call
with type return = return
end

(* HOST_NWA_PAIR: type of an NWA acceptor for a Host and its
 * closure. *)
module type HOST_NWA_PAIR =
sig
  (* Input fields defined by input component structure: *)
  module Host_inner_state: Set.OrderedType

  type play
  type priv_ev
    
  (* Progrm: an NWA module of the program. *)
  module Progrm: NWA
    with module Inner_state = Host_inner_state
      with type int_action = Program.internal
  with type func = Program.func
    
  (* Host: an NWA module of the Host. *)
  module Host: NWA
    with module Inner_state = Host_inner_state
      with type int_action = play * priv_ev
with type func = Program.func
with type call = call
with type return = return
  
  (* Closed_host: an NWA module of the host over its closed alphabet. *)
  module Closed_host: NWA
    with module Inner_state = Host_inner_state
with type int_action = play * (priv_ev * priv_ev close_alpha)
with type func = func
with type call = call
with type return = return

  module Policies: NWA
    with type int_action = internal * priv_ev

  val closed_exp_host_of_prog:
    Llvm_data.modul -> Progrm.nwa_exp -> Closed_host.nwa_exp

  val closed_sym_host_of_prog:
    Llvm_data.modul -> Progrm.nwa_exp -> Closed_host.nwa_sym

  val exp_host_of_prog_pols:
    Progrm.nwa_exp -> Policies.nwa_exp -> Policies.nwa_exp -> Host.nwa_exp

  val key_host_calls: Progrm.nwa_exp -> Progrm.Call_alpha.t

  (* key_host_internals: takes as input:
   * 
   * -a program represented as an LLVM module
   * 
   * Constructs set of LLVM instructions that are relevant to execution
   * on the host.
   *)
  val key_host_internals: Progrm.nwa_exp -> Progrm.Int_alpha.t

  val key_host_returns: Progrm.nwa_exp -> Progrm.Return_alpha.t

  val sym_host_of_prog_pols:
    Progrm.nwa_exp -> Policies.nwa_exp -> Policies.nwa_exp -> Host.nwa_sym
end


(* HOST:
 *
 * -types that define types of primitive and privilege events
 * 
 * -functor that goes from a state type to Host NWAs.
 *)
module type HOST =
sig
  type prim
  type priv_event

  type closed_host_state
  module Host_state: Set.OrderedType

  module Host_nwa_abs:
    functor (Comps: HOST_COMPS 
             with module Comp_host_state = Host_state
  with type Policies.int_action = internal * priv_event) ->
      HOST_NWA_PAIR
    with module Host_inner_state = Comps.Comp_inner_state
with type play = internal * prim
with type priv_ev = priv_event
with module Progrm = Comps.Progrm
  with module Policies = Comps.Policies

  (* prim_to_llvm: takes as input:
   *
   * -a program represented as an LLVM module
   * 
   * -a host primitive
   * 
   * Constructs a pointer value to be called.
   *)
  val prim_to_llvm: Llvm_data.modul -> prim -> Llvm_data.constant

  val prim_to_string: prim -> string
end


(* POL_NWA_PAIR: a policy NWA and its closure. *)
module type POL_NWA_PAIR =
sig
  type priv_ev

  module Progrm: NWA
    with module Inner_state = Pol_inner_state
with type int_action = internal
with type func = func
with type call = call
with type return = return

  module Pol: NWA
    with module Inner_state = Pol_inner_state
with type int_action = internal * priv_ev
with type func = func
with type call = call
with type return = return
  
  module Closed_pol: NWA
    with module Inner_state = Pol_inner_state
with type int_action = internal * (priv_ev * priv_ev close_alpha)
with type func = func
with type call = call
with type return = return

  val nm_to_func_pol_exp: string -> Progrm.nwa_exp -> Pol.nwa_exp
    
  val nm_to_func_pol_sym: string -> Progrm.nwa_exp -> Pol.nwa_sym
    
  val nm_to_sec_pol_exp: string -> Progrm.nwa_exp -> Pol.nwa_exp

  val nm_to_sec_pol_sym: string -> Progrm.nwa_exp -> Pol.nwa_sym
    
  val key_sec_internals: string -> Progrm.nwa_exp -> Progrm.Int_alpha.t 

  val key_sec_calls: string -> Progrm.nwa_exp -> Progrm.Call_alpha.t
    
  val key_sec_returns: string -> Progrm.nwa_exp -> Progrm.Return_alpha.t

  val key_func_internals: string -> Progrm.nwa_exp -> Progrm.Int_alpha.t 

  val key_func_calls: string -> Progrm.nwa_exp -> Progrm.Call_alpha.t
    
  val key_func_returns: string -> Progrm.nwa_exp -> Progrm.Return_alpha.t
end  


(* POLS: indexes policies for a given host by name string. *)
module type POLS =
sig
  module Pol_state: Set.OrderedType
  type priv_event
    
  module Pol_nwa_abs:
    functor (Comps: POL_COMPS with module Comp_pol_state = Pol_state) ->
      POL_NWA_PAIR
    with module Pol_inner_state = Comps.Comp_inner_state
with type priv_ev = priv_event
with module Progrm = Comps.Progrm
  
end


let close_to_string base_to_string closed =
  (match closed with
       Pos(base) -> "Pos(" ^ (base_to_string base) ^ ")"
     | Neg(base) -> "Neg(" ^ (base_to_string base) ^ ")"
  )
