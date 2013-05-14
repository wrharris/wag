(* Automata-based engine of the policy-weaving algorithm. *)
open Libext

(* df_lat: a dataflow lattice. *)
type 'a df_lat =
    { extend: 'a -> 'a -> 'a;
      id: 'a;
      merge: 'a -> 'a -> 'a;
      ordered: 'a -> 'a -> bool;
    }

(* regex_cons: a regex constructor. Can be used to construct regexes
 * over different subexpressions. *)
type ('act, 're) regex_cons =
    Action of 'act
  | Alt of 're * 're
  | Eps
  | Concat of 're * 're
  | Kleene of 're
  | Null

(* regex_cons_to_string: construct the string representation of a
 * regular expression construction. *)
val regex_cons_to_string: 
  ('act -> string) -> ('re -> string) -> ('act, 're) regex_cons -> string

(* REGEX: a regular expression. *)
module type REGEX =
sig
  type action
  module Action: Set.OrderedType with type t = action
  module Actions: Set.S with type elt = action
  module Action_map: Map.S with type key = action

  (* regex: type of a regular expression. *)
  type regex = Re of (action, regex) regex_cons

  (* regex_alpha: construct the alphabet of a given regex. *)
  val regex_alpha: regex -> Actions.t

  val action_to_string: action -> string
end

module Regex_abs: 
  functor (Action: STR_ORDERED) -> REGEX with type action = Action.Comp.t

type 'a eps_cons =
    Conc_action of 'a
  | Eps_action

(* NFA: non-deterministic finite automata. *)
module type NFA =
sig
  (* state: a state. *)
  type state
  module State: Set.OrderedType with type t = state
  module States: Set.S with type elt = state

  (* action: an action. *)
  type action
  module Action: Set.OrderedType with type t = action
  module Actions: Set.S with type elt = action
  module Action_map: Map.S with type key = action

  type eps_action = action eps_cons

  module Eps_action: Set.OrderedType with type t = eps_action
  module Eps_actions: Set.S with type elt = eps_action

  module State_act_map: Map.S with type key = state * action

  (* nfa: a non-deterministic finite automaton. *)
  type nfa =
      { nfa_states: States.t;
        nfa_init: state;
        nfa_accept: States.t;
        nfa_actions: Eps_actions.t;
        nfa_trans: state -> eps_action -> States.t;
      }

  val state_to_string: state -> string
    
  val action_to_string: action -> string
end

(* Iso_regex: a functor from a regex to an isometric regex over an
 * alphabet of integer symbols. *)
module Iso_regex: 
  functor (Struct_regex: REGEX) -> 
sig
  module Regex: REGEX
    
  (* iso_regex: given a regex, construct an isomorphic regex and a
   * pair of functions that represent the isomorphism. *)
  val iso_regex:
    Struct_regex.regex ->
    (Regex.regex
     * (Struct_regex.action -> Regex.action)
     * (Regex.action -> Struct_regex.action))
end

module type NFA_TO_NFA =
    functor (In_nfa: NFA) ->
sig
    module Nfa: NFA with type action = In_nfa.action

    val nfa_to_nfa: In_nfa.nfa -> Nfa.nfa
end

module Memoize_nfa: NFA_TO_NFA

(* REGEX_TO_NFA: type of a module that converts a regex to an NFA over
 * the same alphabet. *)
module type REGEX_TO_NFA =
    functor (Regex: REGEX) ->
sig
  module Nfa: NFA with type action = Regex.Action.t
    
  val regex_to_nfa: Regex.regex -> Nfa.nfa
end

module Class_re_to_nfa: REGEX_TO_NFA

(* DFA: module for implement a deterministic finite automaton. *)
module type DFA =
sig
  type state
  module State: Set.OrderedType with type t = state
  module States: Set.S with type elt = state
  module State_map: Map.S with type key = state

  type action
  module Action: Set.OrderedType with type t = action
  module Actions: Set.S with type elt = action

  module State_act_map: Map.S with type key = state * action

  (* dfa: a deterministic finite automaton. *)
  type dfa =
      { dfa_states: States.t;
        dfa_init: state;
        dfa_accept: States.t;
        dfa_actions: Actions.t;
        dfa_trans: state -> action -> state;
      }

  (* enabled_dfa: a DFA represented with enabled actions. *)
  type enabled_dfa =
      { en_states: States.t;
        en_sets: state -> Actions.t;
        en_init: state;
        en_trans: state -> action -> state;
      } 

  val state_to_string: state -> string

  val action_to_string: action -> string

  val dfa_to_string: dfa -> string
end

module type DFA_COMPS =
sig
  module State: Set.OrderedType
    
  module Action: Set.OrderedType

  val state_to_string: State.t -> string
  val action_to_string: Action.t -> string
end

(* Dfa_abs: DFA abstracted over states and actions. *)
module Dfa_abs:
  functor (Comps: DFA_COMPS) -> DFA
  with type state = Comps.State.t 
  with type action = Comps.Action.t

(* Flatten_dfa: module to a flatten a DFA with an arbitrary transition
 * function into one with opaque states and a transition function
 * represented by a map. *)
module Flatten_dfa:
  functor (Full_dfa: DFA) -> 
sig
  module Flat_dfa: DFA with type action = Full_dfa.action

  val flatten_dfa: Full_dfa.dfa -> Flat_dfa.dfa
end

(* NFA_TO_DFA: module to convert an NFA to a DFA. *)
module type NFA_TO_DFA =
    functor (Nfa: NFA) ->
sig
  module Dfa: DFA with type action = Nfa.action

  (* nfa_to_dfa: takes an NFA, constructs a DFA. *)
  val nfa_to_dfa: Nfa.nfa -> Dfa.dfa
end

module Nfa_to_dfa: NFA_TO_DFA

(* DFA_MIN: module for minimizing DFA's. *)
module type DFA_MIN =
  functor (Dfa: DFA) ->
sig
  module Min_dfa: DFA with type action = Dfa.action

  val min_dfa: Dfa.dfa -> Min_dfa.dfa
end

(* Dfa_min: abstract conversion module. *)
module Min_dfa: DFA_MIN

(* mod_id: a module ID. *)
type 'c mod_id =
    Entry_mod
  | Call_mod of 'c

(* SEVPA: type of SEVPA-based non-game automata. *)
module type SEVPA =
sig
  module State: Set.OrderedType
  type state = State.t

  module Internal: Set.OrderedType
  type internal = Internal.t

  module Call: Set.OrderedType
  type call = Call.t
  type vpa_mod_id = call mod_id

  module Mod_ids: Set.S with type elt = vpa_mod_id
  module Mod_id_map: Map.S with type key = vpa_mod_id

  val id_to_string: vpa_mod_id -> string

  val state_to_string: state -> string
  val internal_to_string: internal -> string
  val call_to_string: call -> string

  module States: Set.S with type elt = state
  module State_map: Map.S with type key = state
  module State_pairs: Set.S with type elt = state * state
  module State_pair_map: Map.S with type key = state * state

  module Internals: Set.S with type elt = internal
  module Internal_map: Map.S with type key = internal

  module Calls: Set.S with type elt = call

  module Internal_trans_map: Map.S with type key = state * internal
  module Call_trans_map: Map.S with type key = call
  module Return_trans_map: Map.S with type key = state * state

  (* vpa: a visibly pushdown automaton. *)
  type vpa =
      { (* vpa_ints: the internal actions of the VPA. *)
        vpa_ints: Internals.t;

        (* vpa_calls: the call actions of the VPA. *)
        vpa_calls: Calls.t;
        
        (* vpa_states: the states of the VPA. *)
        vpa_states: States.t;

        (* vpa_init: the initial state of the VPA. *)
        vpa_init: state;

        (* vpa_acc: the accepting states of the VPA. *)
        vpa_acc: States.t;

        (* vpa_internal_trans: the internal transition function. *)
        vpa_internal_trans: state -> internal -> state;

        (* vpa_call_trans: the call transition function. *)
        vpa_call_trans: state -> call -> state;

        (* vpa_return_trans: the return transition function. *)
        vpa_return_trans: state -> state -> state;
      }

  (* sevpa_module: a set of states, an initial state, and a set of
   * exit states. *)
  type sevpa_module = States.t * state * States.t

  type sevpa_lib =
      {
        lib_nm: string;

        lib_ints: Internals.t;
        
        lib_calls: Calls.t;
        
        lib_states: States.t;

        lib_acc: States.t;

        lib_call_mod: call -> sevpa_module;

        (* functions defined sets of enabled actions. *)
        lib_int_enabled: state -> Internals.t;

        lib_call_enabled: state -> Calls.t;

        (* transition functions *)
        lib_int_trans: state -> internal -> state;

        lib_return_trans: state -> state -> state;
      }

  type sevpa =
      {
        sevpa_nm: string;

        sevpa_ints: Internals.t;
        
        sevpa_calls: Calls.t;
        
        sevpa_states: States.t;

        sevpa_acc: States.t;

        sevpa_entry_mod: sevpa_module;

        sevpa_call_mod: call -> sevpa_module;

        (* functions defined sets of enabled actions. *)
        sevpa_int_enabled: state -> Internals.t;

        sevpa_call_enabled: state -> Calls.t;

        (* transition functions *)
        sevpa_int_trans: state -> internal -> state;

        sevpa_return_trans: state -> state -> state;
      }


  (* df_problem: a dataflow problem. *)
  type 'a df_problem = sevpa * (state -> state -> 'a)
      
  type 'a df_soln = state -> state -> 'a

  val call_graph: sevpa -> Calls.t Mod_id_map.t

  val id_mod: sevpa -> vpa_mod_id -> sevpa_module

  (* interproc_df: interprocedural dataflow analysis. *)
  val interproc_df: 'a df_lat -> 'a df_problem -> 'a df_soln

  (* is_well_formed: a well-formedness check. Useful for
   * debugging. *)
  val is_well_formed: sevpa -> bool

  (* memoize_sevpa: memoize all functions into maps. *)
  val memoize_sevpa: sevpa -> sevpa

  (* mod_ids: module IDs. *)
  val mod_ids: sevpa -> Mod_ids.t

  (* sevpa_to_dot: construct the dot representation of a SEVPA. *)
  val sevpa_to_dot: sevpa -> string

  (* sevpa_to_open_nwa: construct the open_nwa representation of a SEVPA. *)
  val sevpa_to_open_nwa: sevpa -> string

  (* sevpa_stats: construct a report of statistics about a SEVPA. *)
  val sevpa_stats: sevpa -> string
end

(* SEVPA_COMPS: the type of a structure of base automaton component
 * types. *)
module type SEVPA_COMPS =
sig
  (* comp_state: type of states in the VPA. *)
  module Comp_state: Set.OrderedType
  module Comp_states: Set.S with type elt = Comp_state.t

  (* comp_int_action: a component internal action. *)
  module Comp_int: Set.OrderedType
  module Comp_ints: Set.S with type elt = Comp_int.t

  (* comp_call: type of call. *)
  module Comp_call: Set.OrderedType
  module Comp_calls: Set.S with type elt = Comp_call.t

  module Comp_mod_ids: Set.S with type elt = Comp_call.t mod_id
  module Comp_id_map: Map.S with type key = Comp_call.t mod_id

  val comp_state_to_string: Comp_state.t -> string
  val comp_internal_to_string: Comp_int.t -> string
  val comp_call_to_string: Comp_call.t -> string
end

(* Sevpa_abs: a functor that takes a state-space and alphabets, and
 * produces a SEVPA module. *)
module Sevpa_abs: functor (Comps: SEVPA_COMPS) ->
  (SEVPA
   with module State = Comps.Comp_state
     with module States = Comps.Comp_states
       with module Internal = Comps.Comp_int
         with module Internals = Comps.Comp_ints
           with module Call = Comps.Comp_call
             with module Calls = Comps.Comp_calls
               with module Mod_ids = Comps.Comp_mod_ids)

(* Vpa_to_sevpa: a module for converting a VPA to a minimal SEVPA. *)
module Vpa_to_sevpa: functor (Vpa: SEVPA) ->
sig
  module Sevpa: SEVPA
    with type Internal.t = Vpa.internal
      with type Call.t = Vpa.call

  (* vpa_to_sevpa: take a VPA and construct its minimal
   * call-SEVPA. *)
  val vpa_to_sevpa: Vpa.vpa -> Sevpa.sevpa
end


(* FA_TO_VPA_CONV: components for converting a finite automaton to a
 * VPA. *)
module type DFA_TO_VPA_CONV =
sig
  (* Finite_auto: the class of finite automata. *)
  module Dfa: DFA
  
  (* Internals: an alphabet of internal actions. *)
  module Internal: Set.OrderedType

  (* Calls: an alphabet of call actions. *)
  module Call: Set.OrderedType

  val comp_target_internal_to_string: Internal.t -> string
  val comp_target_call_to_string: Call.t -> string
end

(* FA_TO_SEVPA: convert a finite automaton to a VPA and friends. *)
module Dfa_to_vpa_abs:
  functor (Conv_mod: DFA_TO_VPA_CONV) ->
sig
  module Vpa: SEVPA
    with module Internal = Conv_mod.Internal
      with module Call = Conv_mod.Call

  (* visible_action: classification of action as visibly internal or
   * call. *)
  type visible_action =
      Vis_internal of Vpa.internal
    | Vis_call of Vpa.call

  (* dfa_to_vpa: takes as input:
   *
   * -a function from each flat action to its visible action
   * 
   * -a DFA over the flat actions
   * 
   * Constructs a VPA over the visible actions.
   *)
  val dfa_to_vpa:
    (Conv_mod.Dfa.action -> visible_action) -> Conv_mod.Dfa.dfa -> Vpa.vpa
end

(* GAME: type of game SEVPA. *)
module type GAME =
sig
  module Att_int: Set.OrderedType
  type att_int = Att_int.t
  module Att_ints: Set.S with type elt = att_int

  module Def_int: Set.OrderedType
  type def_int = Def_int.t
  module Def_ints: Set.S with type elt = def_int

  module Call: Set.OrderedType
  type call = Call.t
  module Calls: Set.S with type elt = call
  type vpa_mod_id = call mod_id

  module Mod_ids: Set.S with type elt = vpa_mod_id
  module Mod_id_map: Map.S with type key = vpa_mod_id

  module Att_state: Set.OrderedType
  type att_state = Att_state.t
  module Att_states: Set.S with type elt = att_state

  module Def_state: Set.OrderedType
  type def_state = Def_state.t
  module Def_states: Set.S with type elt = def_state

  module Att_state_map: Map.S with type key = att_state
  module Def_state_map: Map.S with type key = def_state

  module Att_int_trans_map: Map.S with type key = att_state * att_int
  module Def_int_trans_map: Map.S with type key = def_state * def_int
  module Call_trans_map: Map.S with type key = call
  module Return_trans_map: Map.S with type key = att_state * att_state

  (* gm_module: a module of the game. Defined by:
   * 
   * -a set of Attacker states
   * 
   * -a set of Defender states
   * 
   * -an initial state
   * 
   * -a set of exit states
   *)
  type gm_module = Att_states.t * Def_states.t * def_state * Att_states.t

  (* game: type of a SEVPA turn-based safety game. *)
  type game =
      {
        gm_nm: string;

        (* Define the alphabets. *)
        gm_att_ints: Att_ints.t;

        gm_def_ints: Def_ints.t;

        gm_calls: Calls.t;

        (* Define states in the entry module. *)
        gm_att_states: Att_states.t;

        gm_def_states: Def_states.t;

        (* gm_acc_state: the accepting state of the game. *)
        gm_acc_state: def_state;

        (* gm_entry_mod: the game entry module. *)
        gm_entry_mod: gm_module;

        (* gm_call_mod: map from each call to its module. *)
        gm_call_mods: call -> gm_module;

        (* gm_*_enabled: functions from states to the actions that can be
         * chosen by an agent in each state. *)
        gm_att_enabled: att_state -> Att_ints.t;

        gm_def_enabled: def_state -> Def_ints.t;

        gm_call_enabled: att_state -> Calls.t;

        gm_att_int_trans: att_state -> att_int -> def_state;

        gm_def_int_trans: def_state -> def_int -> att_state;

        gm_return_trans: att_state -> att_state -> def_state;
      }

  val gm_stats: game -> string

  type strat_state = att_state
  module Strat_state: Set.OrderedType with type t = Att_state.t 
  module Strat_states: Set.S
    with type elt = strat_state
      with type t = Att_states.t
  module Strat_state_map: Map.S with type key = strat_state
  module Strat_int_map: Map.S with type key = att_int
  module Strat_int_trans_map: Map.S with type key = Att_int_trans_map.key

  (* def_strategy: a Defender strategy. *)
  type def_strategy =
      {
        (* Strategy name. *)
        strat_nm: string;

        (* Action sets. *)
        att_ints: Att_ints.t;

        def_ints: Def_ints.t;

        calls: Calls.t;

        enabled_att_ints: strat_state -> Att_ints.t;

        enabled_calls: strat_state -> Calls.t;

        (* Choice functions. *)
        states: Strat_states.t;

        init_act: def_int;

        init_state: strat_state;

        int_action_choice: strat_state -> att_int -> def_int;

        int_state_choice: strat_state -> att_int -> strat_state;

        ret_action_choice: strat_state -> strat_state -> def_int;
        
        ret_state_choice: strat_state -> strat_state -> strat_state;

        mod_action_choice: call -> def_int;
        
        mod_state_choice: call -> strat_state;
      }

  val strat_mod_ids: def_strategy -> Mod_ids.t
  val strat_stats: game -> def_strategy -> string

  val att_int_to_string: att_int -> string
  val def_int_to_string: def_int -> string
  val call_to_string: call -> string
  val att_state_to_string: att_state -> string
  val def_state_to_string: def_state -> string
end

(* GAME_COMPS: state and alphabet modules. *)
module type GAME_COMPS =
sig
  module Comp_att_int: Set.OrderedType
  module Comp_att_ints: Set.S with type elt = Comp_att_int.t

  module Comp_def_int: Set.OrderedType
  module Comp_def_ints: Set.S with type elt = Comp_def_int.t

  module Comp_call: Set.OrderedType
  module Comp_calls: Set.S with type elt = Comp_call.t

  module Comp_mod_ids: Set.S with type elt = Comp_call.t mod_id
  module Comp_mod_map: Map.S with type key = Comp_call.t mod_id

  module Comp_att_state: Set.OrderedType
  module Comp_att_states: Set.S with type elt = Comp_att_state.t

  module Comp_def_state: Set.OrderedType
  module Comp_def_states: Set.S with type elt = Comp_def_state.t

  val comp_att_int_to_string: Comp_att_int.t -> string
  val comp_def_int_to_string: Comp_def_int.t -> string
  val comp_call_to_string: Comp_call.t -> string
  val comp_att_state_to_string: Comp_att_state.t -> string
  val comp_def_state_to_string: Comp_def_state.t -> string
end


(* Game_abs: a functor that takes a state-space and alphabets, and
 * produces a game module. *)
module Game_abs: functor (Comps: GAME_COMPS) ->
  (GAME
   with module Att_int = Comps.Comp_att_int
     with module Att_ints = Comps.Comp_att_ints
       with module Def_int = Comps.Comp_def_int
         with module Def_ints = Comps.Comp_def_ints
           with module Call = Comps.Comp_call
             with module Calls = Comps.Comp_calls
               with module Mod_ids = Comps.Comp_mod_ids
                 with module Mod_id_map = Comps.Comp_mod_map
                   with module Att_state = Comps.Comp_att_state
                     with module Att_states = Comps.Comp_att_states
                       with module Def_state = Comps.Comp_def_state
                         with module Def_states = Comps.Comp_def_states)
