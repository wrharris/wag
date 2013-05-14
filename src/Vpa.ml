open Sys

(* Automata-based engine of the policy-weaving algorithm. *)
open Libext

type 'a df_lat =
    { extend: 'a -> 'a -> 'a;
      id: 'a;
      merge: 'a -> 'a -> 'a;
      ordered: 'a -> 'a -> bool;
    }

type ('act, 're) regex_cons =
    Action of 'act
  | Alt of 're * 're
  | Eps
  | Concat of 're * 're
  | Kleene of 're
  | Null

let regex_cons_to_string act_to_string re_to_string re_cons =
  (match re_cons with
      Action(act) -> "[ " ^ (act_to_string act) ^ " ]"
    | Alt(lhs, rhs) -> (re_to_string lhs) ^ " | " ^ (re_to_string rhs)
    | Eps -> "e"
    | Concat(first, sec) -> (re_to_string first) ^ " . " ^ (re_to_string sec)
    | Kleene(body) -> (re_to_string body) ^ "*"
    | Null -> "0"
  )

type 'c mod_id = 
    Entry_mod
  | Call_mod of 'c

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

module Regex_abs =
  functor (Action_str: STR_ORDERED) ->
struct
  module Action = Action_str.Comp
  type action = Action.t
  module Actions = Set.Make(Action)
  module Action_map = Map.Make(Action)
      
  type regex = Re of (action, regex) regex_cons

  let rec regex_alpha (Re(re)) =
    (match re with
        Action(act) -> Actions.singleton act
      | Alt(choice_0, choice_1) -> 
        Actions.union (regex_alpha choice_0) (regex_alpha choice_1)
      | Eps -> Actions.empty
      | Concat(first, second) -> 
        Actions.union (regex_alpha first) (regex_alpha second)
      | Kleene(body) -> regex_alpha body
      | Null -> Actions.empty
    )
      
  let action_to_string = Action_str.to_string
end

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

module Nfa_abs =
  functor (State_str: STR_ORDERED) ->
    functor (Action_str: STR_ORDERED) ->
struct
  module State = State_str.Comp
  type state = State.t
  module States = Set.Make(State)

  module Action = Action_str.Comp
  type action = Action.t
  module Actions = Set.Make(Action)
  module Action_map = Map.Make(Action)

  type eps_action = action eps_cons
  module Eps_action =
    struct
      type t = eps_action
      let compare a b =
        (match a, b with
            Conc_action(c), Conc_action(d) -> Action.compare c d
          | _ -> compare a b
        )
    end

  module Eps_actions = Set.Make(Eps_action)

  module State_act_map =
    Map.Make(
      struct
        type t = state * action
        let compare (post_0, act_0) (post_1, act_1) =
          let post_cmp = State.compare post_0 post_1 in
          if post_cmp != 0 then post_cmp
          else Action.compare act_0 act_1
      end)

  (* nfa: a non-deterministic finite automaton. *)
  type nfa =
      { nfa_states: States.t;
        nfa_init: state;
        nfa_accept: States.t;
        nfa_actions: Eps_actions.t;
        nfa_trans: state -> eps_action -> States.t;
      }

  let state_to_string = State_str.to_string

  let action_to_string = Action_str.to_string
end

module type NFA_TO_NFA =
    functor (In_nfa: NFA) ->
sig
    module Nfa: NFA with type action = In_nfa.action

    val nfa_to_nfa: In_nfa.nfa -> Nfa.nfa
end

module Memoize_nfa =
  functor (In_nfa: NFA) ->
struct
  type state = Flat_state of int
  module State_str =
  struct
    module Comp =
    struct
      type t = state
      let compare = compare
    end

    let to_string (Flat_state(indx)) = 
      "(" ^ (string_of_int indx) ^ ")"
  end

  module Action_str = 
  struct
    module Comp = In_nfa.Action
    let to_string = In_nfa.action_to_string
  end

  module Nfa = Nfa_abs(State_str)(Action_str)
          
  module In_state_map = Map.Make(In_nfa.State)

  module State_eps_map =
    Map.Make(
        struct
          type t = Nfa.state * Nfa.eps_action
          let compare (q_0, a_0) (q_1, a_1) =
            let cmp_state = Nfa.State.compare q_0 q_1 in
            if cmp_state != 0 then cmp_state
            else Nfa.Eps_action.compare a_0 a_1
        end
    )

  (* nfa_to_nfa: convert an NFA to an NFA. *)
  let nfa_to_nfa in_nfa =
    let state_indx =
      let (state_indx_map, _) =
        In_nfa.States.fold
          (fun state (state_indx_map, fresh_indx) ->
            (In_state_map.add
               state (Flat_state(fresh_indx)) state_indx_map,
             fresh_indx + 1)
          )
          in_nfa.In_nfa.nfa_states 
          (In_state_map.empty, 0) in
      (fun state -> In_state_map.find state state_indx_map) in

    let translit_states states =
      In_nfa.States.fold
        (fun state -> Nfa.States.add (state_indx state))
        states
        Nfa.States.empty in
      
    let memo_states = translit_states in_nfa.In_nfa.nfa_states in

    let memo_init = state_indx in_nfa.In_nfa.nfa_init in

    let memo_actions = 
      In_nfa.Eps_actions.fold
        Nfa.Eps_actions.add
        in_nfa.In_nfa.nfa_actions 
        Nfa.Eps_actions.empty in

    let memo_accs = translit_states in_nfa.In_nfa.nfa_accept in

    let memo_trans =
      let memo_trans_map =
        In_nfa.States.fold
          (fun pre ->
            In_nfa.Eps_actions.fold
              (fun action ->
                State_eps_map.add
                  (state_indx pre, action)
                  (translit_states (in_nfa.In_nfa.nfa_trans pre action))
              )
              in_nfa.In_nfa.nfa_actions
          )
          in_nfa.In_nfa.nfa_states
          State_eps_map.empty in
      (fun pre action -> 
        State_eps_map.find (pre, action) memo_trans_map
      ) in

    { Nfa.nfa_states = memo_states;
      nfa_init = memo_init;
      nfa_accept = memo_accs;
      nfa_actions = memo_actions;
      nfa_trans = memo_trans;
    }
end

module Iso_regex = 
  functor (Struct_regex: REGEX) ->
struct
  type flat_act = Flat_act of int

  module Regex = 
    Regex_abs(
      struct
        module Comp = 
        struct
          type t = flat_act
          let compare = compare
        end
        let to_string (Flat_act(i)) = "iso(" ^ (string_of_int i) ^ ")"
      end)

  let iso_regex struct_re = 
    (* struct_alpha: the alphabet of the structured regex. *)
    let struct_alpha = Struct_regex.regex_alpha struct_re in

    (* struct_to_flat, flat_to_struct: maps to and from the structured
     * alphabet and flat alphabet. *)
    let (struct_to_flat, flat_to_struct) = 
      let (struct_to_flat_map, flat_to_struct_map ) =
        Struct_regex.Actions.fold
          (fun struct_act (struct_to_flat_map, flat_to_struct_map) -> 
            let fresh_action = 
              Flat_act(Struct_regex.Action_map.cardinal struct_to_flat_map) in
            (Struct_regex.Action_map.add
               struct_act fresh_action struct_to_flat_map, 
             Regex.Action_map.add fresh_action struct_act flat_to_struct_map)
          )
          struct_alpha
          (Struct_regex.Action_map.empty, Regex.Action_map.empty) in
      ((fun s -> Struct_regex.Action_map.find s struct_to_flat_map),
       (fun f -> Regex.Action_map.find f flat_to_struct_map)) in

    (* iso_re: construct the isomorphic regex. *)
    let rec iso_re (Struct_regex.Re(struct_regex)) = 
      let re_core =
        (match struct_regex with 
            Action(a) -> Action(struct_to_flat a)
          | Alt(re_0, re_1) -> Alt(iso_re re_0, iso_re re_1)
          | Eps -> Eps
          | Concat(re_0, re_1) ->
            Concat(iso_re re_0, iso_re re_1)
          | Kleene(body) -> Kleene(iso_re body)
          | Null -> Null
        ) in
      Regex.Re(re_core) in
    (iso_re struct_re, struct_to_flat, flat_to_struct)
end

(* REGEX_TO_NFA: type of a module that converts a regex to an NFA over
 * the same alphabet. *)
module type REGEX_TO_NFA =
    functor (Regex: REGEX) ->
sig
  module Nfa: NFA with type action = Regex.action
    
  val regex_to_nfa: Regex.regex -> Nfa.nfa
end

(* First_follow: a module for converting a regex to an NFA over the
 * same alphabet. *)
module First_follow = 
  functor (Regex: REGEX) ->
struct
  (* Define the space of distinct actions, used by the algorithm. *)
  type action = Regex.action
  module Action = Regex.Action
  type dist_action = action * int

  module Dist_action =
  struct
    type t = dist_action
    let compare (act_0, i_0) (act_1, i_1) =
      let act_cmp = Action.compare act_0 act_1 in
      if act_cmp != 0 then act_cmp else compare i_0 i_1
  end

  let dist_action_to_string (act, i) =
    "read(" ^ (Regex.action_to_string act) ^ ", " ^ (string_of_int i) ^ ")"

  module Dist_action_str =
  struct
    module Comp = Dist_action
    let to_string = dist_action_to_string
  end

  (* Dist_regex: a regex over a distinct action. *)
  module Dist_regex = Regex_abs(Dist_action_str)
  type dist_regex = Dist_regex.regex

  (* marked_action: either a distinct action or the End action. *)
  type marked_action = 
      Marked of dist_action
    | End

  module Marked_action =
  struct
    type t = marked_action
    let compare marked_0 marked_1 =
      (match marked_0, marked_1 with
          Marked(dist_0), Marked(dist_1) -> 
            Dist_regex.Action.compare dist_0 dist_1
        | _ -> compare marked_0 marked_1
      )
  end    

  (* Marked_actions: a space of marked actions. *)
  module Marked_actions = Set.Make(Marked_action)

  (* state: state of the NFA constructed using the first-follow
   * algorithm. *)
  type state = 
      Start
    | Read_dist of dist_action
    | Stuck

  module State =
  struct
    type t = state
    let compare = compare
  end

  let state_to_string state =
    (match state with
        Start -> "start"
      | Stuck -> "stuck"
      | Read_dist(dist_act) -> dist_action_to_string dist_act
    ) 

  module State_str =
  struct
    module Comp = State
    let to_string = state_to_string
  end

  module Action_str =
  struct
    module Comp = Regex.Action
    let to_string = Regex.action_to_string
  end

  (* Nfa: module of NFA constructed from regex. *)
  module Nfa = Nfa_abs(State_str)(Action_str)

  (* first_follow: given a regular expression, construct a NFA
   * using first and follow sets. *)
  let regex_to_nfa re =
    (* distinct: a regular expression in which alphabet symbol is
     * distinct. *)
    let distinct = 
      let rec mark_re (Regex.Re(re)) indx =
        let (core_re, indx') =
          (match re with
              Action(act) -> (Action(act, indx), indx + 1)
            | Alt(choice_0, choice_1) -> 
              let (marked_0, indx_0) = mark_re choice_0 indx in
              let (marked_1, indx_1) = mark_re choice_1 indx_0 in
              (Alt(marked_0, marked_1), indx_1)
            | Eps -> (Eps, indx)
            | Concat(fst, sec) ->
              let (marked_fst, indx_fst) = mark_re fst indx in
              let (marked_sec, indx_sec) = mark_re sec indx_fst in
              (Concat(marked_fst, marked_sec), indx_sec)
            | Kleene(body) ->
              let (marked_body, body_indx) = mark_re body indx in
              (Kleene(marked_body), body_indx)
            | Null -> (Null, indx)
          ) in
        (Dist_regex.Re(core_re), indx') in
      let (marked, _) = mark_re re 0 in
      marked in

    (* accepts_eps: decides if a regular expression accepts the
     * epsilon string. *)
    let rec accepts_eps (Dist_regex.Re(re)) =
      (match re with
          Action(_) -> false
        | Alt(choice_0, choice_1) ->
          (accepts_eps choice_0) || (accepts_eps choice_1)
        | Eps -> true
        | Concat(fst, sec) -> (accepts_eps fst) && (accepts_eps sec)
        | Kleene(_) -> true
        | Null -> false
      ) in

    (* first: compute the first set of a regular expression over the
     * marked alphabet. *)
    let rec first (Dist_regex.Re(re)) = 
      (match re with
          Action(act) -> Dist_regex.Actions.singleton act
        | Alt(choice_0, choice_1) ->
          Dist_regex.Actions.union (first choice_0) (first choice_1)
        | Eps -> Dist_regex.Actions.empty
        | Concat(fst, sec) ->
          Dist_regex.Actions.union
            (first fst)
            (if accepts_eps fst then first sec else Dist_regex.Actions.empty)
        | Kleene(body) -> first body
        | Null -> Dist_regex.Actions.empty
      ) in

    (* follow: compute a map from each regex symbol to the follow set
     * of the symbol. *)
    let rec follow re =
      let follow_map =
        let union_follow_maps map_0 map_1 =
          Dist_regex.Action_map.merge
            (fun act fol_opt_0 fol_opt_1 ->
              (match fol_opt_0, fol_opt_1 with
                  Some(_), None -> fol_opt_0
                | None, Some(_) -> fol_opt_1
                | _ -> failwith "follow_h: unexpected case"
              )
            )
            map_0
            map_1 in

        let dist_to_marked dists =
          Dist_regex.Actions.fold
            (fun dist -> Marked_actions.add (Marked(dist)))
            dists
            Marked_actions.empty in

        let rec follow_h (Dist_regex.Re(re)) fol =
          (match re with
              Action(act) -> Dist_regex.Action_map.singleton act fol
            | Alt(choice_0, choice_1) ->
              union_follow_maps (follow_h choice_0 fol) (follow_h choice_1 fol)
            | Eps -> Dist_regex.Action_map.empty
            | Concat(fst, sec) ->
              let fst_follow =
                follow_h
                  fst
                  (Marked_actions.union
                     (dist_to_marked (first sec))
                     (if accepts_eps sec then fol else Marked_actions.empty)) in
              let sec_follow = follow_h sec fol in
              union_follow_maps fst_follow sec_follow
            | Kleene(body) -> 
              follow_h
                body (Marked_actions.union fol (dist_to_marked (first body)))
            | Null -> Dist_regex.Action_map.empty
          ) in
        follow_h re (Marked_actions.singleton End) in
      (fun act -> Dist_regex.Action_map.find act follow_map) in

    (* follow_sets: the follow sets for the regex. *)
    let follow_sets = follow distinct in

    (* dist_acts: actions that appear in the distinct regex. *)
    let dist_acts = Dist_regex.regex_alpha distinct in

    (* states: a start state, a stuck state, and a state for each
     * distinct symbol. *)
    let states = 
      let dist_states =
        Dist_regex.Actions.fold
          (fun dist_act -> Nfa.States.add (Read_dist(dist_act)))
          dist_acts 
          Nfa.States.empty in
      Nfa.States.add Start (Nfa.States.add Stuck dist_states) in

    (* accept_states: the accepting states of the automaton. *)
    let accept_states =
      Nfa.States.filter
        (fun state ->
          (match state with
              Start -> accepts_eps distinct
            | Read_dist(a) -> Marked_actions.mem End (follow_sets a)
            | Stuck -> false
          )
        ) 
        states in

    (* conc_actions: of the regular expression. *)
    let conc_actions = Regex.regex_alpha re in

    (* actions: the alphabet of actions. *)
    let actions =
      Regex.Actions.fold
        (fun conc_act -> Nfa.Eps_actions.add (Conc_action(conc_act)))
        conc_actions
        (Nfa.Eps_actions.singleton Eps_action) in

    (* index_dists: from a set of marked actions, build an index
     * from each action to the distinct actions that contain it. *)
    let empty_map = 
      Regex.Actions.fold
        (fun act -> Regex.Action_map.add act Dist_regex.Actions.empty)
        conc_actions
        Regex.Action_map.empty in

    let index_dists dists = 
      let index_map = 
        Marked_actions.fold
          (fun marked_act acc_map -> 
            (match marked_act with
                Marked(((act, _) as follow_act)) -> 
                  Regex.Action_map.add
                    act
                    (Dist_regex.Actions.add
                       follow_act (Regex.Action_map.find act acc_map))
                    acc_map
              | End -> acc_map
            )
          )
          dists
          empty_map in
      (fun act -> Regex.Action_map.find act index_map) in

    (* dist_act_succs: function from every distinct action and action
     * to the set of distinct actions that follow the distinct action on
     * the action. *)
    let dist_act_succs = 
      let dist_act_map = 
        Dist_regex.Actions.fold
          (fun pre -> 
            Dist_regex.Action_map.add pre (index_dists (follow_sets pre))
          )
          dist_acts
          Dist_regex.Action_map.empty in
      (fun pre_act act -> 
        (Dist_regex.Action_map.find pre_act dist_act_map) act
      ) in

    (* trans_fn: transition function. *)
    let firsts_index = 
      let marked_firsts = 
        Dist_regex.Actions.fold
          (fun dist -> Marked_actions.add (Marked(dist)))
          (first distinct)
          Marked_actions.empty in
      index_dists marked_firsts in
    let trans_fn pre nd_act =
      (match nd_act with
          Conc_action(act) ->
            let succ dists = 
              if Dist_regex.Actions.is_empty dists then 
                Nfa.States.singleton Stuck
              else 
                Dist_regex.Actions.fold
                  (fun dist_act -> Nfa.States.add (Read_dist(dist_act)))
                  dists
                  Nfa.States.empty in
            (match pre with
                Start -> succ (firsts_index act)
              | Stuck -> Nfa.States.singleton Stuck
              | Read_dist(state_act) -> succ (dist_act_succs state_act act)
            )
        | Eps_action -> Nfa.States.singleton pre
      ) in

    (* Construct the NFA of the regular expression. *)
    { Nfa.nfa_states = states;
      nfa_init = Start;
      nfa_accept = accept_states;
      nfa_actions = actions;
      nfa_trans = trans_fn;
    }

  let action_to_string = Action_str.to_string
end

(* Class_opt: module for collapsing character classes when
 * constructing an NFA. *)
module Class_opt =
  functor (Regex_to_nfa: REGEX_TO_NFA) -> functor (Regex: REGEX) ->
struct 
  (* Folded_regex: regex with character classes collapsed. *)
  module Folded_regex = 
    Regex_abs(
      struct
        module Comp = Regex.Actions
        let to_string = 
          Libext.set_to_string Regex.Actions.fold Regex.action_to_string
      end
    )

  (* Folded_nfa_to_re: module that converts a folded regex to an
   * NFA. *)
  module Folded_nfa_to_re = Regex_to_nfa(Folded_regex)
  module Folded_nfa = Folded_nfa_to_re.Nfa
    
  (* Nfa: the target NFA. *)
  module State_str =
    struct
      module Comp = Folded_nfa.State
      let to_string = Folded_nfa.state_to_string
    end

  module Action_str =
    struct
      module Comp = Regex.Action
      let to_string = Regex.action_to_string
    end

  module Nfa = Nfa_abs(State_str)(Action_str)

  let regex_to_nfa re = 
    let folded_re =
      (* Construct a regex in which all alternations of symbols are
       * collapsed into a single symbol. *)
      let rec fold_alts (Regex.Re(re_core)) =
        let folded_core =
          (match re_core with
              Action(act) -> Action(Regex.Actions.singleton act)
            | Alt(re_0, re_1) ->
              let folded_0 = fold_alts re_0 in
              let folded_1 = fold_alts re_1 in
              (match folded_0, folded_1 with
                  Folded_regex.Re(Action(acts_0)),
              Folded_regex.Re(Action(acts_1)) -> 
                Action(Regex.Actions.union acts_0 acts_1)
                | _ -> Alt(folded_0, folded_1)
              )
            | Eps -> Eps
            | Concat(first, sec) -> Concat(fold_alts first, fold_alts sec)
            | Kleene(body) -> Kleene(fold_alts body)
            | Null -> Action(Regex.Actions.empty)
          ) in
        Folded_regex.Re(folded_core) in
      fold_alts re in

    (* folded_nfa: NFA over folded alphabet symbols. *)
    let folded_nfa = Folded_nfa_to_re.regex_to_nfa folded_re in

    (* Report the transition function of the folded NFA. *)
    (*
    let eps_act_to_string eps_act =
      (match eps_act with 
          Conc_action(act) -> Folded_nfa.action_to_string act
        | Eps_action -> "eps"
      ) in

    Folded_nfa.States.iter
      (fun pre ->
        Folded_nfa.Eps_actions.iter
          (fun eps_act ->
            let post = folded_nfa.Folded_nfa.nfa_trans pre eps_act in
            print_endline 
              ((Folded_nfa.state_to_string pre) ^ ", " 
               ^ (eps_act_to_string eps_act) ^ ": " 
               ^ (string_of_int (Folded_nfa.States.cardinal post)))
          )
          folded_nfa.Folded_nfa.nfa_actions
      )
      folded_nfa.Folded_nfa.nfa_states;
    *)

    let translit_states states = 
      Folded_nfa.States.fold
        (fun state -> Nfa.States.add state) states Nfa.States.empty in

    (* exp_actions: alphabet of the expanded regex. *)
    let exp_actions = Regex.regex_alpha re in
    let nfa_actions = 
      Regex.Actions.fold
        (fun re_act -> Nfa.Eps_actions.add (Conc_action(re_act)))
        exp_actions
        (Nfa.Eps_actions.singleton Eps_action) in

    (* exp_trans: transition function for the expanded NFA. *)
    let exp_trans =
      (* action_index: an index from each expanded action to the folded
       * actions that contain it. *)
      let action_index = 
        let index_map = 
          let empty_index_map = 
            Regex.Actions.fold
              (fun act -> Regex.Action_map.add act Folded_nfa.Actions.empty)
              exp_actions
              Regex.Action_map.empty in
          Folded_nfa.Eps_actions.fold
            (fun fold_act_eps index_map ->
              (match fold_act_eps with
                  Conc_action(fold_act) ->
                    Regex.Actions.fold
                      (fun exp_act index_map ->
                        Regex.Action_map.add
                          exp_act
                          (Folded_nfa.Actions.add 
                             fold_act (Regex.Action_map.find exp_act index_map))
                          index_map
                      )
                      fold_act
                      index_map
                | Eps_action -> index_map
              )
            )
            folded_nfa.Folded_nfa.nfa_actions
            empty_index_map in
        (fun act -> Regex.Action_map.find act index_map) in
      (fun pre eps_act -> 
        (match eps_act with
            Conc_action(act) ->
              Folded_nfa.Actions.fold
                (fun fold_act -> 
                  Nfa.States.union
                    (translit_states
                       (folded_nfa.Folded_nfa.nfa_trans
                          pre (Conc_action(fold_act))))
                )
                (action_index act)
                Nfa.States.empty
          | Eps_action -> 
            translit_states
              (folded_nfa.Folded_nfa.nfa_trans pre Eps_action)
        )
      ) in

    (* Report the transition function of the folded NFA. *)
    (*
    let eps_act_to_string eps_act =
      (match eps_act with 
          Conc_action(act) -> Nfa.action_to_string act
        | Eps_action -> "eps"
      ) in
    Nfa.States.iter
      (fun pre ->
        Nfa.Eps_actions.iter
          (fun eps_act ->
            let post = exp_trans pre eps_act in
            print_endline 
              ((Nfa.state_to_string pre) ^ ", " 
               ^ (eps_act_to_string eps_act) ^ ": " 
               ^ (string_of_int (Nfa.States.cardinal post)))
          )
          nfa_actions
      )
      (translit_states folded_nfa.Folded_nfa.nfa_states);
    *)
    { Nfa.nfa_states = translit_states folded_nfa.Folded_nfa.nfa_states;
      nfa_init = folded_nfa.Folded_nfa.nfa_init;
      nfa_accept = translit_states folded_nfa.Folded_nfa.nfa_accept;
      nfa_actions = nfa_actions;
      nfa_trans = exp_trans;
    }
end

module Class_re_to_nfa = Class_opt(First_follow)

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

module Dfa_abs =
  functor (Comps: DFA_COMPS) ->
struct
  type state = Comps.State.t
  module State = Comps.State
  module States = Set.Make(State)
  module State_map = Map.Make(State)

  type action = Comps.Action.t
  module Action = Comps.Action
  module Actions = Set.Make(Action)

  module State_act_map =
    Map.Make(
      struct
        type t = state * action
        let compare (post_0, act_0) (post_1, act_1) =
          let post_cmp = State.compare post_0 post_1 in
          if post_cmp != 0 then post_cmp
          else Action.compare act_0 act_1
      end
    )

  type dfa =
      { dfa_states: States.t;
        dfa_init: state;
        dfa_accept: States.t;
        dfa_actions: Actions.t;
        dfa_trans: state -> action -> state;
      }

  type enabled_dfa =
      { en_states: States.t;
        en_sets: state -> Actions.t;
        en_init: state;
        en_trans: state -> action -> state;
      } 

  let state_to_string = Comps.state_to_string

  let action_to_string = Comps.action_to_string

  let dfa_to_string dfa = 
    let states_to_str = Libext.set_to_string States.fold state_to_string in
    let states_str = "states:\n" ^ (states_to_str dfa.dfa_states) ^ "\n" in

    let init_str = "init:\n" ^ (state_to_string dfa.dfa_init) ^ "\n" in

    let acc_str =
      "accepting states:\n" ^ (states_to_str dfa.dfa_accept) ^ "\n" in

    let actions_str =
      let elts_str =
        Libext.set_to_string Actions.fold action_to_string dfa.dfa_actions in
      "actions:\n" ^ elts_str ^ "\n" in

    let trans_str =
      let entries_str =
        States.fold
          (fun pre entries_str ->
            Actions.fold
              (fun action entries_str ->
                entries_str
                ^ (state_to_string pre) ^ ",\n" 
                ^ (action_to_string action) ^ " ->" 
                ^ (state_to_string (dfa.dfa_trans pre action)) ^ "\n"
              )
              dfa.dfa_actions
              entries_str
          )
          dfa.dfa_states
          "" in
      "transition function:\n" ^ entries_str in
    states_str ^ init_str ^ acc_str ^ actions_str ^ trans_str
end

module Flatten_dfa =
  functor (Full_dfa: DFA) ->
struct
  type state = Flat_state of int
  module State =
  struct
    type t = state
    let compare = compare
  end

  let flat_state_to_string (Flat_state(indx)) = "(" ^ (string_of_int indx) ^ ")"

  module Flat_dfa = 
    Dfa_abs(
      struct
        module State = State
        module Action = Full_dfa.Action

        let state_to_string = flat_state_to_string
        let action_to_string = Full_dfa.action_to_string
      end
    )
          
  module Full_state_map = Map.Make(Full_dfa.State)

  let flatten_dfa full_dfa =
    let state_indx =
      let (state_indx_map, _) =
        Full_dfa.States.fold
          (fun state (state_indx_map, fresh_indx) ->
            (Full_state_map.add
               state (Flat_state(fresh_indx)) state_indx_map,
             fresh_indx + 1)
          )
          full_dfa.Full_dfa.dfa_states 
          (Full_state_map.empty, 0) in
      (fun state -> Full_state_map.find state state_indx_map) in

    let flat_states =
      Full_dfa.States.fold
        (fun state -> Flat_dfa.States.add (state_indx state))
        full_dfa.Full_dfa.dfa_states
        Flat_dfa.States.empty in

    let flat_init = state_indx full_dfa.Full_dfa.dfa_init in

    let flat_actions = 
      Full_dfa.Actions.fold
        Flat_dfa.Actions.add
        full_dfa.Full_dfa.dfa_actions 
        Flat_dfa.Actions.empty in

    let flat_accs = 
      Full_dfa.States.fold
        (fun state -> Flat_dfa.States.add (state_indx state))
        full_dfa.Full_dfa.dfa_accept
        Flat_dfa.States.empty in

    let flat_trans =
      let flat_trans_map =
        Full_dfa.States.fold
          (fun pre trans_map ->
            Full_dfa.Actions.fold
              (fun action trans_map ->
                Flat_dfa.State_act_map.add
                  (state_indx pre, action)
                  (state_indx (full_dfa.Full_dfa.dfa_trans pre action))
                  trans_map
              )
              full_dfa.Full_dfa.dfa_actions
              trans_map
          )
          full_dfa.Full_dfa.dfa_states
          Flat_dfa.State_act_map.empty in
      (fun pre action -> 
        Flat_dfa.State_act_map.find (pre, action) flat_trans_map
      ) in

    { Flat_dfa.dfa_states = flat_states;
      dfa_init = flat_init;
      dfa_accept = flat_accs;
      dfa_actions = flat_actions;
      dfa_trans = flat_trans;
    } 
end

(* NFA_TO_DFA: module to convert an NFA to a DFA. *)
module type NFA_TO_DFA =
    functor (Nfa: NFA) ->
sig
  module Dfa: DFA with type action = Nfa.action

  (* nfa_to_dfa: takes an NFA, constructs a DFA. *)
  val nfa_to_dfa: Nfa.nfa -> Dfa.dfa
end

module Nfa_to_dfa =
  functor (Nfa: NFA) ->
struct
  module Dfa = 
    Dfa_abs(
      struct
        module State = Nfa.States
        module Action = Nfa.Action

        let state_to_string = 
          Libext.set_to_string Nfa.States.fold Nfa.state_to_string

        let action_to_string = Nfa.action_to_string
      end 
    )

  (* Shorthand for implementing the conversion function. *)
  type state = Dfa.state
  type action = Dfa.action
  module State = Dfa.State
  module States = Dfa.States
  module Action = Dfa.Action
  module State_act_map = Nfa.State_act_map

  module State_map = Map.Make(Nfa.State)
    
  let nfa_to_dfa n =
    dbg
      ("nfa_to_dfa: num. states: " 
       ^ (string_of_int (Nfa.States.cardinal n.Nfa.nfa_states))
       ^ "\nalphabet cardinality: " 
       ^ (string_of_int (Nfa.Eps_actions.cardinal n.Nfa.nfa_actions))
      );

    (* eps_class: takes a set of states "states," constructs the
     * epsilon class of states. *)
    let eps_class =
      (* back_ptr: map every state to the set of states that
       * eps-transition to it. *)
      let back_ptr =
        let back_map =
          let map_to_empty =
            Nfa.States.fold
              (fun state map_to_empty ->
                State_map.add state Nfa.States.empty map_to_empty
              )
              n.Nfa.nfa_states
              State_map.empty in
          Nfa.States.fold
            (fun pre back_map ->
              Nfa.States.fold
                (fun post back_map ->
                  State_map.add
                    post 
                    (Nfa.States.add pre (State_map.find post back_map)) 
                    back_map
                )
                (n.Nfa.nfa_trans pre Eps_action)
                back_map
            )
            n.Nfa.nfa_states
            map_to_empty in
        (fun state -> State_map.find state back_map) in
      
      (* id_eps_map: maps every state to an epsilon class that
       * includes only itself. *)
      let id_eps_map =
        Nfa.States.fold
          (fun state id_eps_map ->
            State_map.add state (Nfa.States.singleton state) id_eps_map
          )
          n.Nfa.nfa_states
          State_map.empty in

      let rec cons_eps_classes eps_map workset =
        if Nfa.States.is_empty workset then eps_map
        else
          let chosen = Nfa.States.choose workset in
          let chosen_eps = State_map.find chosen eps_map in
          
          (* For each state that eps-transitions to the chosen: *)
          let (eps_map', updated) =
            Nfa.States.fold
              (fun eps_pre (eps_map', updated) ->
                let old_eps = State_map.find eps_pre eps_map in
                let all_eps = Nfa.States.union old_eps chosen_eps in
                if not (Nfa.States.subset all_eps old_eps) then
                  (State_map.add eps_pre all_eps eps_map',
                   Nfa.States.add eps_pre updated)
                else (eps_map', updated)
              )
              (back_ptr chosen)
              (eps_map, Nfa.States.empty) in
          cons_eps_classes
            eps_map'
            (Nfa.States.union (Nfa.States.remove chosen workset) updated) in
      let eps_map = cons_eps_classes id_eps_map n.Nfa.nfa_states in
      (fun state -> State_map.find state eps_map) in

    (* closed_trans_func: transition function with epsilon removal. *)
    let closed_trans_func =
      let closed_trans_map =
        Nfa.States.fold
          (fun pre ->
            Nfa.Eps_actions.fold
              (fun act closed_map ->
                (match act with
                    Conc_action(a) ->
                      let post_closure = 
                        Nfa.States.fold
                          (fun post -> Nfa.States.union (eps_class post))
                          (n.Nfa.nfa_trans pre act)
                          Nfa.States.empty in
                      State_act_map.add (pre, a) post_closure closed_map
                  | Eps_action -> closed_map
                )
              )
              n.Nfa.nfa_actions
          )
          n.Nfa.nfa_states
          State_act_map.empty in
      (fun pre act -> State_act_map.find (pre, act) closed_trans_map) in
    (* det_init: the initial state of the determinization. *)
    let det_init = eps_class n.Nfa.nfa_init in
      
    (* det_trans: the transition function of the determinization. *)
    let det_trans =
      (fun pres action -> 
        Nfa.States.fold
          (fun pre -> Nfa.States.union (closed_trans_func pre action))
          pres
          Nfa.States.empty
      ) in

    (* det_actions: actions for the determinization. *)
    let det_actions =
      Nfa.Eps_actions.fold
        (fun eps_act det_actions ->
          (match eps_act with
              Conc_action(act) -> Dfa.Actions.add act det_actions
            | _ -> det_actions
          ) 
        )
        n.Nfa.nfa_actions
        Dfa.Actions.empty in

    (* det_states: the set of states in the determinization. *)
    let det_states =
      let rec lazy_cons det_states workset =
        if States.is_empty workset then det_states
        else
          let chosen = States.choose workset in
          let succs =
            (* For each action: *)
            Dfa.Actions.fold
              (fun act -> States.add (det_trans chosen act))
              det_actions
              States.empty in
          let det_states' = States.add chosen det_states in
          lazy_cons
            det_states'
            (States.union
               (States.remove chosen workset)
               (States.diff succs det_states')) in
      lazy_cons States.empty (States.singleton det_init) in

    (* det_accepts: accepting states of the determinization. *)
    let det_accepts =
      States.filter
        (fun dfa_state ->
          not
            (Nfa.States.is_empty (Nfa.States.inter n.Nfa.nfa_accept dfa_state))
        )
        det_states in

    { Dfa.dfa_states = det_states;
      dfa_init = det_init;
      dfa_accept = det_accepts;
      dfa_actions = det_actions;
      dfa_trans = det_trans;
    }
end

(* Refiner: a functor for refining congruence classes. Takes as input:
 * 
 * -Class: represents a set of states to be refined.
 * 
 * -Classes: a set of Class
 * 
 * -Actions: a space of actions.
 * 
 * -Img_class: a class of images of the elements of Class.
 *)
module Refiner =
  functor (Classes: Set.S) ->
    functor (Actions: Set.S) ->
      functor (Img_classes: Set.S) ->
struct
  (* refine_congs: takes a partitioning, a space of actions, and a
   * space of transition images. Refines the partitioning with respect
   * to the actions and images. *)
  let refine_congs pre_op split part actions imgs =
    (* splitters: classes that will be applied to refine the space of
     * congruence classes. *)
    let splitters =
      Img_classes.fold
        (fun img -> 
          Actions.fold (fun action -> Classes.add (pre_op img action)) actions
        )
        imgs
        Classes.empty in

    Classes.fold
      (fun splitter part' ->
        Classes.fold
          (fun org -> Classes.union (split org splitter))
          part'
          Classes.empty
      )
      splitters
      part
end

(* DFA_MIN: module for minimizing DFA's. *)
module type DFA_MIN =
  functor (Dfa: DFA) ->
sig
  module Min_dfa: DFA with type action = Dfa.action

  val min_dfa: Dfa.dfa -> Min_dfa.dfa
end

(* Min_dfa_abs: a module for minimizing a DFA. *)
module Min_dfa =
  functor (Dfa: DFA) ->
struct
  module Org_dfa = Dfa

  module Min_dfa = 
    Dfa_abs(
      struct
        module State = Org_dfa.States
        module Action = Org_dfa.Action

        let state_to_string = 
          Libext.set_to_string Org_dfa.States.fold Org_dfa.state_to_string
          
        let action_to_string = Org_dfa.action_to_string
      end)

  (* Min_dfa_refiner: module for refining congruence classes for
   * minimal DFA's. *)
  module Min_dfa_refiner = 
    Refiner(Min_dfa.States)(Org_dfa.Actions)(Min_dfa.States)

  (* min_dfa: minimize the DFA. *)
  let min_dfa org_dfa =
    dbg 
      ("min_dfa: num. input states: " 
       ^ (string_of_int (Org_dfa.States.cardinal org_dfa.Dfa.dfa_states))
       ^ "\nmin_dfa pre time: " ^ (string_of_float (Sys.time ())));
    (* inv_int_trans: inversion of the internal transition
     * function. *)
    let inv_int_trans =
      (* inv_trans_map: map storing an inversion of the transition
       * function. *)
      let inv_trans_map =
        (* to_empty: map from every state and action to an empty set. *)
        let to_empty =
          Org_dfa.States.fold
            (fun state -> 
              Org_dfa.Actions.fold
                (fun act ->
                  Org_dfa.State_act_map.add (state, act) Org_dfa.States.empty
                )
                org_dfa.Org_dfa.dfa_actions
            )
            org_dfa.Org_dfa.dfa_states
            Org_dfa.State_act_map.empty in
          Org_dfa.States.fold
            (fun pre ->
              Org_dfa.Actions.fold
                (fun act inv_trans_map ->
                  let post = org_dfa.Org_dfa.dfa_trans pre act in
                  Org_dfa.State_act_map.add
                    (post, act)
                    (Org_dfa.States.add
                       pre
                       (Org_dfa.State_act_map.find (post, act) inv_trans_map))
                    inv_trans_map
                )
                org_dfa.Org_dfa.dfa_actions
            )
            org_dfa.Org_dfa.dfa_states
            to_empty in
      (fun post act -> Org_dfa.State_act_map.find (post, act) inv_trans_map) in

    (* min_pre: pre operation on the state space. *)
    let min_pre post_class action =
      Org_dfa.States.fold
        (fun org_post pres ->
          Org_dfa.States.union pres (inv_int_trans org_post action)
        )
        post_class
        Org_dfa.States.empty in

    (* min_split: splitter for classes of DFA states. *)
    let min_split org splitter =
      Min_dfa.States.remove
        Org_dfa.States.empty
        (Min_dfa.States.add
           (Org_dfa.States.inter org splitter)
           (Min_dfa.States.singleton (Org_dfa.States.diff org splitter))) in

    (* refine_classes: refine congruence classes of states. *)
    let refine_classes state_classes = 
      let rec refine_classes_ws workset state_classes =
        if Min_dfa.States.is_empty workset then state_classes
        else
        (* refined: refinement of the state classes. *)
          let refined =
            Min_dfa_refiner.refine_congs
              min_pre
              min_split
              state_classes 
              org_dfa.Org_dfa.dfa_actions
              workset in
          refine_classes_ws 
            (Min_dfa.States.diff refined state_classes) refined in
      refine_classes_ws state_classes state_classes in

    (* min_states: state-space of the minimal DFA. *)
    let min_states = 
      (* init_state_classes: the initial classes of states. *)
      let init_state_classes =
        Min_dfa.States.add
          org_dfa.Org_dfa.dfa_accept
          (Min_dfa.States.singleton
             (Org_dfa.States.diff
                org_dfa.Org_dfa.dfa_states org_dfa.Org_dfa.dfa_accept)) in
      refine_classes init_state_classes in

    (* find_class: takes a set of states, finds the partition class
     * that contains the set. *)
    let find_class sub_state =
      let found_opt =
        Min_dfa.States.fold
          (fun min_state found_opt ->
            (match found_opt with
                Some(_) -> found_opt
              | None ->
                if Org_dfa.States.subset sub_state min_state then
                  Some(min_state)
                else None
            )
          )
          min_states
          None in
      (match found_opt with
          Some(found) -> found
        | None -> failwith "min_dfa: find_class: no container class found"
      ) in

    (* min_init: the initial state of the minimal DFA. *)
    let min_init =
      find_class (Org_dfa.States.singleton org_dfa.Org_dfa.dfa_init) in

    (* min_accept: the accepting states of the DFA. *)
    let min_accept =
      Min_dfa.States.filter
        (fun min_state ->
          Org_dfa.States.subset min_state org_dfa.Org_dfa.dfa_accept
        )
        min_states in

    (* min_actions: actions of the minimal DFA. *)
    let min_actions =
      Org_dfa.Actions.fold
        Min_dfa.Actions.add org_dfa.Org_dfa.dfa_actions Min_dfa.Actions.empty in

    (* min_trans: the transition function of the minimal DFA. *)
    let min_trans min_pre action =
      let posts =
        Org_dfa.States.fold
          (fun pre -> Org_dfa.States.add (org_dfa.Org_dfa.dfa_trans pre action))
          min_pre
          Org_dfa.States.empty in
      find_class posts in

    dbg ("min_dfa: post-time: " ^ (string_of_float (Sys.time ()))
         ^ "\nnum. states: " 
         ^ (string_of_int (Min_dfa.States.cardinal min_states)));

    (* Construct the full minimal DFA. *)
    { Min_dfa.dfa_states = min_states;
      dfa_init = min_init;
      dfa_accept = min_accept;
      dfa_actions = min_actions;
      dfa_trans = min_trans;
    }
end

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

  type 'a df_problem = sevpa * (state -> state -> 'a)
      
  type 'a df_soln = state -> state -> 'a

  val call_graph: sevpa -> Calls.t Mod_id_map.t

  val id_mod: sevpa -> vpa_mod_id -> sevpa_module

  val interproc_df: 'a df_lat -> 'a df_problem -> 'a df_soln

  val is_well_formed: sevpa -> bool

  val memoize_sevpa: sevpa -> sevpa

  val mod_ids: sevpa -> Mod_ids.t

  val sevpa_to_dot: sevpa -> string

  val sevpa_to_open_nwa: sevpa -> string

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

(* DFA_TO_VPA_CONV: components for converting a finite automaton to a
 * VPA. *)
module type DFA_TO_VPA_CONV =
sig
  (* Dfa: the class of finite automata. *)
  module Dfa: DFA
  
  (* Internal: an alphabet of internal actions. *)
  module Internal: Set.OrderedType

  (* Calls: an alphabet of call actions. *)
  module Call: Set.OrderedType

  val comp_target_internal_to_string: Internal.t -> string
  val comp_target_call_to_string: Call.t -> string
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


(* Sevpa_abs: a functor that takes a state-space and alphabets, and
 * produces a SEVPA module. *)
module Sevpa_abs = functor (Comps: SEVPA_COMPS) ->
struct
  module State = Comps.Comp_state
  type state = State.t
  module States = Comps.Comp_states
  module State_map = Map.Make(State)
  module State_pair =
  struct
    type t = state * state
    let compare (pre_0, stack_0) (pre_1, stack_1) =
      let pre_cmp = State.compare pre_0 pre_1 in
      if pre_cmp != 0 then pre_cmp else State.compare stack_0 stack_1
  end
  module State_pairs = Set.Make(State_pair)
  module State_pair_map = Map.Make(State_pair)

  module Internal = Comps.Comp_int
  type internal = Internal.t
  module Internals = Comps.Comp_ints
  module Internal_map = Map.Make(Internal)

  module Call = Comps.Comp_call
  type call = Call.t
  module Calls = Comps.Comp_calls

  type vpa_mod_id = call mod_id
   module Mod_ids = Comps.Comp_mod_ids
  module Mod_id_map = Comps.Comp_id_map

  module Internal_trans_map =
    Map.Make(
      struct
        type t = state * internal
        let compare (state_0, int_0) (state_1, int_1) =
          let state_cmp = State.compare state_0 state_1 in
            if state_cmp != 0 then state_cmp
            else Internal.compare int_0 int_1
      end)

  module Call_trans_map = Map.Make(Call)

  module Return_trans_map = State_pair_map

  (* vpa: a visibly pushdown automaton. *)
  type vpa =
      { (* vpa_ints: the internal actions of the VPA. *)
        vpa_ints: Internals.t;

        (* vpa_calls: the call actions of the VPA. *)
        vpa_calls: Calls.t;
        
        (* vpa_states: the states of the VPA. *)
        vpa_states: States.t;

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

  let state_to_string = Comps.comp_state_to_string
  let internal_to_string = Comps.comp_internal_to_string
  let call_to_string = Comps.comp_call_to_string

  let id_to_string id =
    (match id with
        Entry_mod -> "entry"
      | Call_mod(call) -> "call(" ^ (call_to_string call) ^ ")"
    )

  let id_mod sevpa id =
    (match id with
        Entry_mod -> sevpa.sevpa_entry_mod
      | Call_mod(call) -> sevpa.sevpa_call_mod call
    )

  let mod_ids sevpa =
    Calls.fold
      (fun call mod_ids -> Mod_ids.add (Call_mod(call)) mod_ids)
      sevpa.sevpa_calls
      (Mod_ids.singleton Entry_mod)

  let call_graph vpa =
    Mod_ids.fold
      (fun mod_id call_graph ->
        let (mod_states, _, _) = id_mod vpa mod_id in
        let callees =
           (* For each state in the module: *)
          States.fold
            (fun state callees ->
              Calls.union callees (vpa.sevpa_call_enabled state)
            )
            mod_states
            Calls.empty in
        Mod_id_map.add mod_id callees call_graph
      )
      (mod_ids vpa)
      Mod_id_map.empty

  type 'a df_problem = sevpa * (state -> state -> 'a)
      
  type 'a df_soln = state -> state -> 'a

  type 'a fp_clause =
      Extend of (state * state) * (state * state)
    | Call_ret of state * state
    | Const of 'a

  let term_to_string term =
    let clause_to_string clause =
      let state_pair_to_string pre post =
        "(" ^ (state_to_string pre) ^ ", " ^ (state_to_string post) ^ ")" in
      (match clause with
          Extend((pre_0, post_0), (pre_1, post_1)) -> 
            (state_pair_to_string pre_0 post_1)
            ^ " o " ^ (state_pair_to_string pre_1 post_1)
        | Call_ret(pre, post) -> "call" ^ (state_pair_to_string pre post)
        | Const(_) -> "const"
      ) in
    List.fold_left
      (fun term_string clause ->
        let prefix = if term_string = "" then "" else term_string ^ " meet " in
        prefix ^ "(" ^ (clause_to_string clause) ^ ")"
      )
      ""
      term

  type 'a fp_term = ('a fp_clause) list

  let interproc_df lat (model, init_facts) =
    (* eval_term: evaluate a DF equation under a given assignment. *)
    let eval_term assign term =
      List.fold_left
        (fun valu clause ->
          let cur_valu =
            (match clause with
                Extend((pre_0, post_0), (pre_1, post_1)) ->
                  lat.extend (assign pre_0 post_0) (assign pre_1 post_1)
              | Call_ret(pre, post) -> assign pre post
              | Const(valu) -> valu
            ) in
          lat.merge valu cur_valu
        )
        lat.id
        term in

    (* state_preds: a function from each state to its predecessor
     * states. *)
    let state_preds =
      let state_pred_map =
        (* empty_preds: a map from each state to an empty set of
         * predecessors. *)
        let empty_preds =
          States.fold
            (fun state -> State_map.add state States.empty)
            model.sevpa_states
            State_map.empty in
        (* For each state: *)
        States.fold
          (fun pre state_preds ->
            (* For each internal transition: *)
            let int_preds =
              Internals.fold
                (fun int_act state_preds ->
                  let int_post = model.sevpa_int_trans pre int_act in
                  State_map.add
                    int_post
                    (States.add pre (State_map.find int_post state_preds))
                    state_preds
                )
                (model.sevpa_int_enabled pre)
                state_preds in
            (* For each enabled call: *)
            Calls.fold
              (fun call state_preds ->
                let (_, _, call_exits) = model.sevpa_call_mod call in
                States.fold
                  (fun call_exit state_preds ->
                    let ret_post = model.sevpa_return_trans call_exit pre in
                    State_map.add
                      ret_post
                      (States.add pre (State_map.find ret_post state_preds))
                      state_preds
                  )
                  call_exits
                  state_preds
              )
              (model.sevpa_call_enabled pre)
              int_preds
          )
          model.sevpa_states
          empty_preds in
      (fun state -> State_map.find state state_pred_map) in

    (* same_mod_pairs: all pairs of states in the same module. *)
    let same_mod_pairs =
      Mod_ids.fold
        (fun id same_mod_pairs ->
          let (mod_states, _, _) = id_mod model id in
          States.fold
            (fun pre same_mod_pairs ->
              States.fold
                (fun post same_mod_pairs ->
                  State_pairs.add (pre, post) same_mod_pairs
                )
                mod_states
                same_mod_pairs
            )
            mod_states
            same_mod_pairs
        )
        (mod_ids model)
        State_pairs.empty in

    let empty_pairs_map =
      State_pairs.fold
        (fun state_pair empty_map ->
          State_pair_map.add state_pair State_pairs.empty empty_map
        )
        same_mod_pairs
        State_pair_map.empty in

    (* call_ret_deps: a function from each pair of states to its call
     * dependences. *)
    let call_ret_deps = 
      let call_ret_dep_map = 
        (* For each module: *)
        Mod_ids.fold
          (fun id call_ret_dep_map ->
            let (mod_states, _, _) = id_mod model id in
            (* For each pair of states in the module: *)
            States.fold
              (fun pre call_ret_dep_map ->
                (* For each call enabled in the pre state: *)
                Calls.fold
                  (fun callee call_ret_dep_map ->
                    (* For each exit state in the callee: *)
                    let (_, callee_init, callee_exits) = 
                      model.sevpa_call_mod callee in
                    States.fold
                      (fun exit_state call_ret_dep_map ->
                        let ret_post =
                          model.sevpa_return_trans exit_state pre in
                        State_pair_map.add
                          (pre, ret_post)
                          (State_pairs.add
                             (callee_init, exit_state)
                             (State_pair_map.find
                                (pre, ret_post) call_ret_dep_map))
                          call_ret_dep_map
                      )
                      callee_exits
                      call_ret_dep_map
                  )
                  (model.sevpa_call_enabled pre)
                  call_ret_dep_map
              )
              mod_states
              call_ret_dep_map
          )
          (mod_ids model)
          empty_pairs_map in
      (fun pre post -> State_pair_map.find (pre, post) call_ret_dep_map) in

    (* eqns: fixpoint equations. *)
    let eqn_map =
      State_pairs.fold
        (fun (pre, post) eqns ->
          (* For each predecessor of the post state: *)
          let step_deps =
            States.fold
              (fun pred step_preds ->
                Extend((pre, pred), (pred, post))::step_preds
              )
              (state_preds post)
              [ ] in
          let call_deps =
            State_pairs.fold
              (fun (entry, ext) call_deps ->
                (Call_ret(entry, ext))::call_deps
              )
              (call_ret_deps pre post)
              [ ] in
          let init = Const(init_facts pre post) in
          let term = List.concat [ step_deps; call_deps; [ init ] ] in
          State_pair_map.add (pre, post) term eqns
        )
        same_mod_pairs
        State_pair_map.empty in
    let eqns pre post = State_pair_map.find (pre, post) eqn_map in

    (* eqn_deps: equation dependencies. *)
    let eqn_deps =
      let eqn_dep_map =
        State_pair_map.fold
          (fun lhs term eqn_deps ->
            let term_deps =
              List.fold_left
                (fun term_deps clause ->
                  let clause_deps = 
                    (match clause with
                        Extend(fst, sec) -> 
                          State_pairs.add fst (State_pairs.singleton sec)
                      | Call_ret(callee_entry, callee_exit) -> 
                        State_pairs.singleton (callee_entry, callee_exit)
                      | _ -> State_pairs.empty
                    ) in
                  State_pairs.union term_deps clause_deps
                )
                State_pairs.empty
                term in
            State_pairs.fold
              (fun dep eqn_deps ->
                State_pair_map.add
                  dep
                  (State_pairs.add lhs (State_pair_map.find dep eqn_deps))
                  eqn_deps
              )
              term_deps
              eqn_deps
          )
          eqn_map
          empty_pairs_map in
      (fun pre post -> State_pair_map.find (pre, post) eqn_dep_map) in

    (* df_fixed_point: find a fixed point for the dataflow facts. *)
    let rec df_fixed_point facts frontier =
      let state_facts pre post = State_pair_map.find (pre, post) facts in
      if State_pairs.is_empty frontier then facts
      else
        let ((pre, post) as upd_pair) = State_pairs.choose frontier in
        let rem_frontier = State_pairs.remove upd_pair frontier in
        let cur_valu = state_facts pre post in
        let eqn_valu = eval_term state_facts (eqns pre post) in
        let (state_facts', frontier') = 
          let (state_facts', frontier_ext) =
            if lat.ordered eqn_valu cur_valu then (facts, State_pairs.empty)
            else
              (State_pair_map.add upd_pair eqn_valu facts,
               eqn_deps pre post) in
          (state_facts', State_pairs.union rem_frontier frontier_ext) in
        df_fixed_point state_facts' frontier' in

    (* Map from each pair of states to their dataflow fact. Map values
     * are a fixed point. *)
    let fixed_point_map =
      (* init_facts: the initial dataflow facts. *)
      let init_fact_map =
        State_pairs.fold
          (fun (pre, post) ->
            State_pair_map.add (pre, post) (init_facts pre post)
          )
          same_mod_pairs
          State_pair_map.empty in

      (* init_frontier: the initial frontier of state-pairs. *)
      let init_frontier =
        State_pair_map.fold
          (fun (pre, post) fact ->
            let deps = 
              if lat.ordered fact lat.id then State_pairs.empty
              else eqn_deps pre post in
            State_pairs.union deps
          )
          init_fact_map
          State_pairs.empty in
      df_fixed_point init_fact_map init_frontier in
    (fun pre post -> State_pair_map.find (pre, post) fixed_point_map)

  let memoize_sevpa vpa =
    (* Memoize the call module map. *)
    let call_mod_map =
      Calls.fold
        (fun call call_mod_map ->
           Call_trans_map.add call (vpa.sevpa_call_mod call) call_mod_map
        )
        vpa.sevpa_calls
        Call_trans_map.empty in
    let memo_call_mod call = Call_trans_map.find call call_mod_map in

    (* Memoize the enabled internals map. *)
    let int_en_map =
      States.fold
        (fun state int_en_map -> 
           State_map.add state (vpa.sevpa_int_enabled state) int_en_map
        )
        vpa.sevpa_states
        State_map.empty in
    let memo_int_enabled state = State_map.find state int_en_map in

    (* Memoize the enabled calls map. *)
    let call_en_map =
      States.fold
        (fun state call_en_map ->
           State_map.add state (vpa.sevpa_call_enabled state) call_en_map
        )
        vpa.sevpa_states
        State_map.empty in
    let memo_call_enabled state = State_map.find state call_en_map in

    (* Memoize the internal transition function. *)
    let int_trans_map =
      States.fold
        (fun pre int_trans_map ->
           let enabled_ints = memo_int_enabled pre in
             Internals.fold
               (fun internal int_trans_map ->
                  Internal_trans_map.add
                    (pre, internal)
                    (vpa.sevpa_int_trans pre internal)
                    int_trans_map
               )
               enabled_ints
             int_trans_map
        )
        vpa.sevpa_states
        Internal_trans_map.empty in
    let memo_int_trans state internal = 
      Internal_trans_map.find (state, internal) int_trans_map in

    let ret_trans_map =
      States.fold
        (fun stack ret_trans_map ->
           Calls.fold
             (fun call ret_trans_map ->
                let (_, _, exits) = memo_call_mod call in
                  States.fold
                    (fun exit_state ret_trans_map ->
                       Return_trans_map.add
                         (exit_state, stack)
                         (vpa.sevpa_return_trans exit_state stack)
                         ret_trans_map
                    )
                    exits
                    ret_trans_map
             )
             (memo_call_enabled stack)
             ret_trans_map
        )
        vpa.sevpa_states
        Return_trans_map.empty in
    let memo_ret_trans pre stack =
        Return_trans_map.find (pre, stack) ret_trans_map in
      { vpa with
          sevpa_call_mod = memo_call_mod;
          sevpa_int_enabled = memo_int_enabled;
          sevpa_call_enabled = memo_call_enabled;
          sevpa_int_trans = memo_int_trans;
          sevpa_return_trans = memo_ret_trans;
      }

  let is_well_formed sevpa =
    (* Check that each enabled internal is in the internal
     * alphabet. *)
    let en_int_are_alpha =
      States.for_all
        (fun state -> 
          Internals.subset (sevpa.sevpa_int_enabled state) sevpa.sevpa_ints
        )
        sevpa.sevpa_states in
    assert en_int_are_alpha;

    (* Check that each enabled call is in the call alphabet. *)
    let en_calls =
      States.fold
        (fun state en_calls -> 
          Calls.union en_calls (sevpa.sevpa_call_enabled state)
        )
        sevpa.sevpa_states
        Calls.empty in
    let en_calls_are_alpha = Calls.subset en_calls sevpa.sevpa_calls in
    assert en_calls_are_alpha;

    let inits_are_mod_states =
      Mod_ids.for_all
        (fun mod_id ->
          let (mod_states, mod_init, _) = id_mod sevpa mod_id in
          States.mem mod_init mod_states
        )
        (mod_ids sevpa) in
    assert inits_are_mod_states;

    let exits_are_mod_states =
      Mod_ids.for_all
        (fun mod_id ->
          let (mod_states, _, mod_exits) = id_mod sevpa mod_id in
          States.subset mod_exits mod_states
        )
        (mod_ids sevpa) in
    assert exits_are_mod_states;

    (* Check that all module states are in the state space. *)
    let all_mod_states =
      Mod_ids.fold
        (fun mod_id all_mod_states ->
          let (mod_states, _, _) = id_mod sevpa mod_id in
          States.union all_mod_states mod_states
        )
        (mod_ids sevpa)
        States.empty in

    let mod_states_are_states =
      States.subset all_mod_states sevpa.sevpa_states in
    assert mod_states_are_states;

    let states_are_mod_states =
      States.subset sevpa.sevpa_states all_mod_states in
    assert states_are_mod_states;

    (* Check that all of the state spaces don't overlap. *)
    let (_, states_are_separate) =
      Mod_ids.fold
        (fun mod_id (seen_states, separate) ->
          let (mod_states, _, _) = id_mod sevpa mod_id in
          let seen_states' = States.union seen_states mod_states in
          let common_states = States.inter seen_states mod_states in
          let separate' = separate && (States.is_empty common_states) in
          (seen_states', separate')
        )
        (mod_ids sevpa)
        (States.empty, true) in
    assert states_are_separate;

    (* Check that the internal transition function is defined for
     * every enabled internal action. *)
    let int_trans_closed =
      Mod_ids.for_all
        (fun id ->
          let (mod_states, _, _) = id_mod sevpa id in
          States.for_all
            (fun state ->
              Internals.for_all
                (fun internal ->
                  try
                    let post = sevpa.sevpa_int_trans state internal in
                    States.mem post mod_states
                  with _ ->
                    print_endline
                      ("undefined internal prefix:\n"
                       ^ ("state: " ^ (state_to_string state) ^ "\n")
                       ^ ("internal: "
                          ^ (internal_to_string internal) ^ "\n"));
                    false
                )
                (sevpa.sevpa_int_enabled state)
            )
            mod_states
        )
        (mod_ids sevpa) in
    assert int_trans_closed;

    (* Check that every non-initial state has an incoming transition. *)
    let connected =
      let int_pointed_to =
        States.fold
          (fun pre ->
            Internals.fold
              (fun intrnal ->
                States.add (sevpa.sevpa_int_trans pre intrnal)
              )
              (sevpa.sevpa_int_enabled pre)
          )
          sevpa.sevpa_states
          States.empty in
      let ret_pointed_to =
        States.fold
          (fun caller ->
            Calls.fold
              (fun call ->
                States.fold
                  (fun ex_state ->
                    States.add (sevpa.sevpa_return_trans ex_state caller)
                  )
                  (let (_, _, exits) = sevpa.sevpa_call_mod call in exits)
              )
              (sevpa.sevpa_call_enabled caller)
          )
          sevpa.sevpa_states
          States.empty in
      let mod_inits =
        let (_, entry_init, _) = sevpa.sevpa_entry_mod in
        let call_mod_inits =
          Calls.fold
            (fun call ->
              let (_, mod_init, _) = sevpa.sevpa_call_mod call in
              States.add mod_init
            )
            sevpa.sevpa_calls
            States.empty in
        States.add entry_init call_mod_inits in
      let connected_states = 
        States.union int_pointed_to (States.union ret_pointed_to mod_inits) in
      States.equal sevpa.sevpa_states connected_states in
    assert connected;

    (* Check that every return transition is defined on callee states. *)
    let ret_trans_closed =
      Mod_ids.for_all
        (fun id ->
          let (mod_states, _, _) = id_mod sevpa id in
          States.for_all
            (fun stack ->
              Calls.for_all
                (fun call ->
                  let (_, _, callee_exits) = sevpa.sevpa_call_mod call in
                  States.for_all
                    (fun pre ->
                      try
                        let post = sevpa.sevpa_return_trans pre stack in
                        States.mem post mod_states
                      with _ ->
                        print_endline
                          ("undefined return prefix:\n"
                           ^ ("pre: " ^ (state_to_string pre) ^ "\n")
                           ^ ("stack: " ^ (state_to_string stack) ^ "\n"));
                        false
                    )
                    callee_exits
                )
                (sevpa.sevpa_call_enabled stack)
            )
            mod_states
        )
        (mod_ids sevpa) in
    assert ret_trans_closed;

    en_int_are_alpha && en_calls_are_alpha 
    && mod_states_are_states && states_are_separate
    && int_trans_closed && ret_trans_closed

  let lookup_internal vpa (func_nm, act_nm) =
    let sevpa_mod =
      if func_nm = "main" then vpa.sevpa_entry_mod
      else
        let call =
          List.find
            (fun call -> call_to_string call = func_nm)
            (Calls.elements vpa.sevpa_calls) in
        vpa.sevpa_call_mod call in
    let int_opt =
      let (mod_states, _, _) = sevpa_mod in
      States.fold
        (fun state int_opt ->
          (match int_opt with
              Some(_) -> int_opt
            | None ->
              Internals.fold
                (fun internal int_opt ->
                  (match int_opt with
                      Some(_) -> int_opt
                    | None -> 
                      if internal_to_string internal = act_nm then
                        Some(internal)
                      else None
                  )
                )
                (vpa.sevpa_int_enabled state)
                None
          )
        )
        mod_states
        None in
    (match int_opt with
        Some(internal) -> internal
      | None -> 
        failwith
          ("lookup_internal: no internal found for (" 
           ^ func_nm ^ ", " ^ act_nm ^ ")")
    )

  (* sevpa_to_dot: construct the dot representation of a SEVPA. *)
  let sevpa_to_dot vpa =
    (* dot_sanitize: make a string suitable to be a dot label. Remove
     * all inner quotation marks, and wrap in quotes. *)
    let dot_sanitize nm =
      let no_quotes =
        let rec iter_string i =
          if i = String.length nm then ""
          else
            let rest = iter_string (i + 1) in
            let cur_char = String.get nm i in
              if cur_char = '"' then rest
              else (String.make 1 cur_char) ^ rest in
          iter_string 0 in
        "\"" ^ no_quotes ^ "\"" in

    (* mod_inits: initial states of some module. *)
    let mod_inits =
      Calls.fold
        (fun call mod_inits ->
           let (_, mod_init, _) = vpa.sevpa_call_mod call in
             States.add mod_init mod_inits
        )
        vpa.sevpa_calls
        (States.singleton
           (let (_, entry_init, _) = vpa.sevpa_entry_mod in entry_init)) in

    (* Mark each initial state as a box or double-octagon. *)
    let init_dot =
      States.fold
        (fun init init_shapes ->
           let shape =
             if States.mem init vpa.sevpa_acc then "doubleoctagon"
             else "box" in
           let init_dot =
             (dot_sanitize (state_to_string init))
             ^ " [ shape = " ^ shape ^ "];\n" in
             init_shapes ^ init_dot
        )
        mod_inits
        "" in

    (* Mark each accepting state with a doubled circle. *)
    let acc_dot =
      States.fold
        (fun acc_state acc_dot ->
           let shape =
             if not (States.mem acc_state mod_inits) then 
               (dot_sanitize (state_to_string acc_state))
               ^ " [ shape = doublecircle ];\n"
             else "" in
             acc_dot ^ shape
        )
        vpa.sevpa_acc
        "" in

    (* For each internal transition, add a normal edge in the dot. *)
    let internal_dot =
      (* For each state: *)
      States.fold
        (fun pre pre_dot ->
           (* For each enabled internal: *)
           Internals.fold
             (fun internal ints_dot ->
                let trans_dot =
                  let pre_dot = dot_sanitize (state_to_string pre) in
                  let int_dot = dot_sanitize (internal_to_string internal) in
                  let post_dot =
                    let post = vpa.sevpa_int_trans pre internal in
                      dot_sanitize (state_to_string post) in
                    pre_dot ^ " -> " ^ post_dot 
                    ^ " [ label = " ^ int_dot ^ " ];\n" in
                  ints_dot ^ trans_dot
             )
             (vpa.sevpa_int_enabled pre)
             pre_dot
        )
        vpa.sevpa_states
        "" in

    (* For each call transition, add a dashed edge in the dot. *)
    let call_dot =
      (* For each state: *)
      States.fold
        (fun pre pre_dot ->
           (* For each enabled call: *)
           Calls.fold
             (fun call calls_dot ->
                let trans_dot =
                  let pre_str = dot_sanitize (state_to_string pre) in
                  let call_str = call_to_string call in
                  let post_str =
                    let (_, post, _) = vpa.sevpa_call_mod call in
                      dot_sanitize (state_to_string post) in
                    pre_str ^ " -> " ^ post_str
                    ^ "[ label=\"" ^ call_str ^ "\",style=dashed ];\n" in
                  calls_dot ^ trans_dot
             )
             (vpa.sevpa_call_enabled pre)
             pre_dot
        )
        vpa.sevpa_states
        "" in

    (* For each return transition, add a pair of dotted edges in the dot. *)
    let ret_dot =
      (* For each state: *)
      States.fold
        (fun stack stack_dot ->
           (* For each callee of the state: *)
           Calls.fold
             (fun call calls_dot ->
                let (_, _, callee_exits) = vpa.sevpa_call_mod call in
                  (* For each exit state of the callee: *)
                  States.fold
                    (fun pre exits_dot ->
                       let post = vpa.sevpa_return_trans pre stack in
                       let post_dot = dot_sanitize (state_to_string post) in
                       let mk_ret_edge src_dot style =
                         src_dot ^ " -> " ^ post_dot
                         ^ "[ label=\"return\",style=" ^ style ^ " ];\n" in
                       let pre_trans_dot =
                         mk_ret_edge
                           (dot_sanitize (state_to_string pre)) "dotted" in
                       let stack_trans_dot =
                         mk_ret_edge
                           (dot_sanitize (state_to_string stack)) "bold" in
                         exits_dot ^ pre_trans_dot ^ stack_trans_dot
                    )
                    callee_exits
                    calls_dot
             )
             (vpa.sevpa_call_enabled stack)
             stack_dot
        )
        vpa.sevpa_states
        "" in

      (* Construct the complete dot representation. *)
      "digraph NWA {\n" 
      ^ init_dot
      ^ acc_dot
      ^ internal_dot
      ^ call_dot
      ^ ret_dot
      ^ "}\n"

  (* sevpa_to_open_nwa: construct the nwa representation of a SEVPA. *)
  let sevpa_to_open_nwa vpa =
    (* nwa_sanitize: make a string suitable to be a nwa label. Remove
     * all inner quotation marks, and wrap in quotes. *)
    let nwa_sanitize nm =
      let no_quotes =
        let rec iter_string i =
          if i = String.length nm then ""
          else
            let rest = iter_string (i + 1) in
            let cur_char = String.get nm i in
              if cur_char = '"' then rest
              else (String.make 1 cur_char) ^ rest in
          iter_string 0 in
        "\"" ^ no_quotes ^ "\"" in

    (* Print states. *)
    let nwa_states =
      (* For each state: *)
      "Q: {\n" ^ 
      (States.fold
        (fun s accum_str ->
          accum_str ^ (nwa_sanitize (state_to_string s)) ^ ",\n"
        )
        vpa.sevpa_states
        ""
      ) ^ "}\n" in

    (* mod_inits: initial states of some module. *)
    let mod_inits =
      Calls.fold
        (fun call mod_inits ->
           let (_, mod_init, _) = vpa.sevpa_call_mod call in
             States.add mod_init mod_inits
        )
        vpa.sevpa_calls
        (States.singleton
           (let (_, entry_init, _) = vpa.sevpa_entry_mod in entry_init)) in

    (* Print initial states. *)
    let nwa_init_states = 
      "Q0: {\n" ^
      (States.fold
        (fun s accum_str ->
           accum_str ^ (nwa_sanitize (state_to_string s)) ^ ",\n"
        )
        mod_inits
        ""
      ) ^ "}\n" in

    (* Print final states. *)
    let nwa_final_states =
      "Qf: {\n" ^
      (States.fold
        (fun acc_state acc_nwa ->
           acc_nwa ^ (nwa_sanitize (state_to_string acc_state)) ^ ",\n"
        )
        vpa.sevpa_acc
        ""
      ) ^ "}\n" in

    (* Print symbols. *)
    let nwa_sigma = 
      "Sigma: {\n" ^
      (Calls.fold
        (fun call accum_str ->
          accum_str ^ nwa_sanitize (call_to_string call) ^ ",\n"
        )
        vpa.sevpa_calls
        ""
      ) 
      ^
      (Internals.fold
        (fun internal accum_str ->
          accum_str ^ nwa_sanitize (internal_to_string internal) ^ ",\n"
        )
        vpa.sevpa_ints
        ""
      ) 
      ^ "\"return\"\n}\n" in

    (* Print delta_i *)
    let nwa_delta_i =
      "Delta_i: {\n" ^
      (* For each state: *)
      (States.fold
        (fun pre pre_nwa ->
           (* For each enabled internal: *)
           Internals.fold
             (fun internal ints_nwa ->
                let trans_nwa =
                  let pre_nwa = nwa_sanitize (state_to_string pre) in
                  let int_nwa = nwa_sanitize (internal_to_string internal) in
                  let post_nwa =
                    let post = vpa.sevpa_int_trans pre internal in
                      nwa_sanitize (state_to_string post) in
                    "(" ^ pre_nwa ^ ", " ^ int_nwa ^ ", " ^ post_nwa ^ "),\n" in
                  ints_nwa ^ trans_nwa
             )
             (vpa.sevpa_int_enabled pre)
             pre_nwa
        )
        vpa.sevpa_states
        ""
      ) ^ "}\n" in

    (* Print delta_c *)
    let nwa_delta_c = 
      "Delta_c: {\n" ^
      (* For each state: *)
        (States.fold
           (fun pre pre_nwa ->
           (* For each enabled call: *)
             Calls.fold
               (fun call calls_nwa ->
                 let trans_nwa =
                   let pre_str = nwa_sanitize (state_to_string pre) in
                   let call_str = call_to_string call in
                   let post_str =
                     let (_, post, _) = vpa.sevpa_call_mod call in
                     nwa_sanitize (state_to_string post) in
                   "(" ^ pre_str ^ ", " 
                   ^ call_str ^ ", " 
                   ^ post_str ^ "),\n" in 
                 calls_nwa ^ trans_nwa
               )
               (vpa.sevpa_call_enabled pre)
               pre_nwa
           )
           vpa.sevpa_states
           ""
        ) ^ "}\n" in

    (* Print delta_r *)
    let nwa_delta_r =
      "Delta_r: {\n" ^
      (* For each state: *)
      (States.fold
        (fun stack stack_nwa ->
           (* For each callee of the state: *)
           Calls.fold
             (fun call calls_nwa ->
                let (_, _, callee_exits) = vpa.sevpa_call_mod call in
                  (* For each exit state of the callee: *)
                  States.fold
                    (fun pre exits_nwa ->
                       let post = vpa.sevpa_return_trans pre stack in
                       let post_nwa = nwa_sanitize (state_to_string post) in
                       let src_nwa = nwa_sanitize (state_to_string pre) in 
                       let style = nwa_sanitize (state_to_string stack) in
                       let deltar =
                         "(" ^ src_nwa ^ ", " 
                         ^ style ^ ", \"return\", " 
                         ^ post_nwa ^ "),\n" in
                         exits_nwa ^ deltar 
                    )
                    callee_exits
                    calls_nwa
             )
             (vpa.sevpa_call_enabled stack)
             stack_nwa
        )
        vpa.sevpa_states
        ""
      ) ^ "}\n" in

      (* Construct the complete nwa representation. *)
      nwa_states
      ^ nwa_init_states
      ^ nwa_final_states
      ^ nwa_sigma
      ^ nwa_delta_i
      ^ nwa_delta_c
      ^ nwa_delta_r

  (* sevpa_stats: statistics on the structure of a SEVPA. *)
  let sevpa_stats vpa =
    let mod_report (mod_states, mod_init, mod_exits) =
      "num. mod. states: " 
      ^ (string_of_int (States.cardinal mod_states)) ^ "\n"
      ^ "num. mod. exits: " ^ (string_of_int (States.cardinal mod_exits)) 
      ^ "\n" in

    let num_ints =
      "num. internals: " 
      ^ (string_of_int (Internals.cardinal vpa.sevpa_ints)) ^ "\n" in
    let num_calls =
      "num. calls: "
      ^ (string_of_int (Calls.cardinal vpa.sevpa_calls)) ^ "\n" in
    let num_states = 
      "num. states: " ^ (string_of_int (States.cardinal vpa.sevpa_states))
      ^ "\n" in
    let num_accs =
      "num. accepting states: "
      ^ (string_of_int (States.cardinal vpa.sevpa_acc)) ^ "\n" in

    let num_int_en =
      States.fold
        (fun state num_int_en ->
          num_int_en
          ^ "state: " ^ (state_to_string state) ^ ": " 
          ^ (string_of_int (Internals.cardinal (vpa.sevpa_int_enabled state)))
          ^ "\n"
        )
        vpa.sevpa_states
        "" in

    let init_mod_report = "entry mod.:\n" ^ (mod_report vpa.sevpa_entry_mod) in
    let call_mods_report =
      Calls.fold
        (fun call call_mods_report ->
          call_mods_report
          ^ (call_to_string call) ^ ": " 
          ^ (mod_report (vpa.sevpa_call_mod call))
        )
        vpa.sevpa_calls
        "" in
    num_ints ^ num_calls ^ num_states ^ num_accs
    ^ num_int_en ^ init_mod_report ^ call_mods_report


end

(* Vpa_to_sevpa: module that takes a VPA and constructs its minimal
 * call-SEVPA. *)
module Vpa_to_sevpa =
  functor (Vpa: SEVPA) ->
struct
  type state = Vpa.state
  module States = Vpa.States
  module State_map = Vpa.State_map

  type call = Vpa.call
  module Calls = Vpa.Calls

  (* call_class: congruence class of call-module states. *)
  type call_class = States.t State_map.t

  (* Call_class: ordering over congruence classes of call-module states. *)
  module Call_class = 
    struct
      type t = call_class
      let compare = State_map.compare States.compare
    end

  (* Call_classes: classes of congruence classes of call-module
   * states. *)
  module Call_classes = Set.Make(Call_class)

  (* sevpa_state: a state of the SEVPA. *)
  type sevpa_state =
      Entry_state of States.t
    | Call_state of call * call_class

  (* Sevpa_state: ordering over sevpa_states. *)
  module Sevpa_state =
    struct
      type t = sevpa_state
      let compare s t = 
        (match s, t with
            Entry_state(s_states), Entry_state(t_states) -> 
              States.compare s_states t_states
          | Call_state(s_call, s_class), Call_state(t_call, t_class) ->
            let call_cmp = compare s_call t_call in
            if call_cmp != 0 then call_cmp
            else Call_class.compare s_class t_class
          | _ -> compare s t
        )
    end

  (* Sevpa_states: set of SEVPA states. *)
  module Sevpa_states = Set.Make(Sevpa_state)

  (* Sevpa: module of the single-entry VPA defined for this VPA. *)
  module Sevpa =
    Sevpa_abs(
      struct
        module Comp_state = Sevpa_state
        module Comp_states = Sevpa_states

        module Comp_int = Vpa.Internal
        module Comp_ints = Vpa.Internals

        module Comp_call = Vpa.Call
        module Comp_calls = Vpa.Calls

        module Comp_mod_ids = Vpa.Mod_ids
        module Comp_id_map = Vpa.Mod_id_map

        let comp_state_to_string _ = "SEVPA-state-to-string"
        let comp_internal_to_string = Vpa.internal_to_string
        let comp_call_to_string = Vpa.call_to_string
      end
    )

  module Internals = Vpa.Internals

  module State_classes = Set.Make(States)

  (* Entry_int_refiner: module for refining congruence classes of
   * entry-module states using internal actions. *)
  module Entry_int_refiner = Refiner(State_classes)(Internals)(State_classes)

  (* stack_sym: a SEVPA stack symbol. *)
  type stack_sym = state * call

  (* Stack_syms: a set of stack symbols. *)
  module Stack_syms =
    Set.Make(
      struct
        type t = stack_sym
        let compare (state_0, call_0) (state_1, call_1) = 
          let state_cmp = Vpa.State.compare state_0 state_1 in
          if state_cmp != 0 then state_cmp else compare call_0 call_1
      end
    )

  (* Pre_img: module to take the pre-image of a function. *)
  module Pre_img =
    functor (Action: Set.OrderedType) ->
      functor (Actions: Set.S with type elt = Action.t) ->
  struct
    module State_act_map =
      Map.Make(
        struct
          type t = state * Actions.elt
          let compare (post_0, act_0) (post_1, act_1) =
            let post_cmp = Vpa.State.compare post_0 post_1 in
            if post_cmp != 0 then post_cmp
            else Action.compare act_0 act_1
        end
      )

    (* inv_trans_func: invert a transition function over the space
     * of actions. *)
    let invert_trans_func trans_func pres actions posts =
      (* pre_int_map: a map from each state to and internal to the
       * pre-states. *)
      let pre_int_map =
        let int_to_no_states = 
          States.fold
            (fun post ->
              Actions.fold
                (fun intrnal ->
                  State_act_map.add (post, intrnal) States.empty
                )
                actions
            )
            posts
            State_act_map.empty in
        States.fold
          (fun pre pre_int_map ->
            Actions.fold
              (fun intrnal pre_int_map ->
                let post = trans_func pre intrnal in
                State_act_map.add
                  (post, intrnal)
                  (States.add
                     pre (State_act_map.find (post, intrnal) pre_int_map))
                  pre_int_map
              )
              actions
              pre_int_map
          )
          pres
          int_to_no_states in
      (fun post intrnal -> State_act_map.find (post, intrnal) pre_int_map)
  end

  module Internal_pre_img = Pre_img(Vpa.Internal)(Vpa.Internals)

  module State_pre_img = Pre_img(Vpa.State)(Vpa.States)

  (* Entry_pre_refiner: refine congruence classes of entry state
   * using pre-states of return transitions. *)
  module Entry_pre_refiner = Refiner(State_classes)(States)(State_classes)

  (* Call_int_refiner: module for refining congruence classes of
   * call-module states using internal actions. *)
  module Call_int_refiner = Refiner(Call_classes)(Internals)(Call_classes)

  (* Call_pre_refiner: module for refining congruence class of
   * call-module states on pre-states. *)
  module Call_pre_refiner = Refiner(Call_classes)(States)(Call_classes)

  (* Call_ret_refiner: module for refining congruence classes of
   * call-module states using return actions. *)
  module Call_ret_refiner = Refiner(Call_classes)(Stack_syms)(Sevpa_states)
    
  (* vpa_to_sevpa: given a VPA that accepts only well-matched strings,
   * constructs the minimum-state SEVPA that accepts the same language
   * as the VPA. *)
  let vpa_to_sevpa v =
    (* inv_internal_trans: the inverted internal transition function. *)
    let inv_internal_trans = 
      Internal_pre_img.invert_trans_func
        v.Vpa.vpa_internal_trans
        v.Vpa.vpa_states
        v.Vpa.vpa_ints
        v.Vpa.vpa_states in

    (* inv_pre_trans: inversion of the return transition function with
     * pre-states as the space of actions. *)
    let inv_pre_trans =
      State_pre_img.invert_trans_func
        (fun stack pre -> v.Vpa.vpa_return_trans pre stack)
        v.Vpa.vpa_states
        v.Vpa.vpa_states
        v.Vpa.vpa_states in

    (* inv_stack_trans: inversion of the return transition function
     * with stack-states as the space of actions. *)
    let inv_stack_trans =
      State_pre_img.invert_trans_func
        v.Vpa.vpa_return_trans
        v.Vpa.vpa_states
        v.Vpa.vpa_states
        v.Vpa.vpa_states in

    (* stack_syms: the set of all stack symbols. *)
    let stack_syms = 
      (* For each call: *)
      Calls.fold
        (fun call stack_syms ->
          (* For each state: *)
          States.fold
            (fun state stack_syms -> Stack_syms.add (state, call) stack_syms)
            v.Vpa.vpa_states
            stack_syms
        )
        v.Vpa.vpa_calls
        Stack_syms.empty in

    (* entry_part: map from each VPA to its entry-module class. *)
    let entry_part =
      let rec refine_entry_parts entry_part =
        (* entry_part': partition of entry states refined using the
         * internal transition function of the VPA. *)
        let entry_part' =
          (* entry_split: splitting function for congruence classes of
           * entry-module states. *)
          let entry_split org splitter =
            State_classes.remove
              States.empty
              (State_classes.add
                 (States.inter org splitter)
                 (State_classes.singleton (States.diff org splitter))) in

          (* internal_refined: classes refined on internal actions. *)
          let internal_refined =
            let entry_int_pre post intrnal =
              States.fold
                (fun post_state pres ->
                  States.union pres (inv_internal_trans post_state intrnal)
                )
                post
                States.empty in
            Entry_int_refiner.refine_congs
              entry_int_pre
              entry_split
              entry_part
              v.Vpa.vpa_ints
              entry_part in
          
            (* Refine entry classes on return actions. *)
          let entry_ret_pre post pre =
            States.fold
              (fun post_state -> States.union (inv_pre_trans post_state pre))
              post
              States.empty in
          Entry_pre_refiner.refine_congs
            entry_ret_pre
            entry_split
            internal_refined 
            v.Vpa.vpa_states
            internal_refined in
        if State_classes.equal entry_part entry_part' then entry_part
        else refine_entry_parts entry_part' in

        (* init_entry_part: the initial entry partition: one class of
         * accepting states and another class of non-accepting states. *)
      let init_entry_part = 
        State_classes.add
          v.Vpa.vpa_acc
          (State_classes.singleton
             (States.diff v.Vpa.vpa_states v.Vpa.vpa_acc)) in
      refine_entry_parts init_entry_part in

    let has_entry = Call_classes.exists (State_map.for_all States.mem) in

    (* call_parts: function from each call to the module
     * class-space. *)
    let call_parts =
      (* sevpa_entry_states: entry classes, lifted to SEVPA classes. *)
      let sevpa_entry_states =
        State_classes.fold
          (fun entry_class sevpa_entry_states -> 
            Sevpa_states.add (Entry_state(entry_class)) sevpa_entry_states
          )
          entry_part
          Sevpa_states.empty in

      (* split_call_class: split a congruence class of call-module
       * states. *)
      let split_call_class org splitter = 
        (* For each domain state: *)
        States.fold
          (fun dom_state partial_maps ->
            (* non_empty_rngs: non-empty splits of the current range. *)
            let non_empty_rngs =
              (* org_rng: the original range of states of the domain in
               * the state-class. *)
              let org_rng = State_map.find dom_state org in

              (* splitter_rng: the range of states in the splitting
               * class. *)
              let splitter_rng = State_map.find dom_state splitter in
              State_classes.remove
                States.empty
                (State_classes.add
                   (States.inter org_rng splitter_rng)
                   (State_classes.singleton
                      (States.diff org_rng splitter_rng))) in

            (* For each partial map built so far: *)
            Call_classes.fold
              (fun partial_map ext_maps ->
                (* For each non-empty partition on classes in the range: *)
                State_classes.fold
                  (fun split_rng ext_maps ->
                    (* Complete the partial map with a binding to the
                     * range. *)
                    Call_classes.add
                      (State_map.add dom_state split_rng partial_map)
                      ext_maps
                  )
                  non_empty_rngs
                  ext_maps
              )
              partial_maps
              Call_classes.empty
          )
          v.Vpa.vpa_states
          (Call_classes.singleton (State_map.empty)) in

      (* state_map_to_empty: a map from each state to the empty set of
       * states. *)
      let state_map_to_empty =
        States.fold
          (fun state map_to_empty ->
            State_map.add state States.empty map_to_empty
          )
          v.Vpa.vpa_states
          State_map.empty in

      (* cons_call_map: constructs call-module map from a transition
       * function and an action. *)
      let cons_call_map inv_trans_func action call_class =
        (* For each domain state: *)
        States.fold
          (fun state pre_map ->
            let rng =
              States.fold
                (fun post_state -> 
                  States.union (inv_trans_func post_state action)
                )
                (State_map.find state call_class)
                States.empty in
            State_map.add state rng pre_map
          )
          v.Vpa.vpa_states
          State_map.empty in
      
      (* refine_call_parts: fixed-point algorithm to refine
       * call-partitions. *)
      let rec refine_call_parts call_parts =
        (* all_sevpa_states: the set of all congruence classes. *)
        let all_sevpa_states =
          let sevpa_call_states =
            Calls.fold
              (fun call sevpa_call_states ->
                Call_classes.fold
                  (fun call_class sevpa_call_states ->
                    Sevpa_states.add
                      (Call_state(call, call_class)) sevpa_call_states
                  )
                  (call_parts call)
                  sevpa_call_states
              )
              v.Vpa.vpa_calls
              Sevpa_states.empty in
          Sevpa_states.union sevpa_entry_states sevpa_call_states in

        (* call_parts': refined classes of pairs of states in the call
         * modules. *)
        let call_parts_map' =
          (* For each call: *)
          Calls.fold
            (fun call ->
              (* call_part: partition for the current call. *)
              let call_part = call_parts call in
              
              (* calls_int_refined: refinement of module classes on
               * internals. *)
              let calls_int_refined =
                (* call_int_pre: pre operator for call-classes and
                 * internals. *)
                let call_int_pre call_class internal =
                  cons_call_map inv_internal_trans internal call_class in
                Call_int_refiner.refine_congs
                  call_int_pre
                  split_call_class
                  call_part
                  v.Vpa.vpa_ints 
                  call_part in

              assert (has_entry calls_int_refined);

              (* call_pre_refined: refinement of module classes on
               * pre-state actions. *)
              let calls_pre_refined =
                let call_pre_pre ret_class callee =
                  cons_call_map inv_pre_trans callee ret_class in
                Call_pre_refiner.refine_congs
                  call_pre_pre
                  split_call_class
                  calls_int_refined
                  v.Vpa.vpa_states
                  calls_int_refined in

              dbg "checking has entry after pre refined";
              assert (has_entry calls_pre_refined);

              (* calls_stack_refined: refinement of module classes on
               * matching calls and returns. *)
              let calls_stack_refined =
                let call_stack_pre ret_class (caller, call) =
                  let entry = v.Vpa.vpa_call_trans caller call in
                  let pre_rng =
                    (* ret_rng: range of return states to which we'll
                     * apply the pre operator. *)
                    let ret_rng =
                      (match ret_class with
                          Entry_state(states) -> states
                        | Call_state(_, ret_map) -> 
                          State_map.fold
                            (fun _ -> States.inter) ret_map v.Vpa.vpa_states
                      ) in
                    States.fold
                      (fun post_state ->
                        States.union (inv_stack_trans post_state caller)
                      )
                      ret_rng
                      States.empty in
                  State_map.add entry pre_rng state_map_to_empty in
                Call_ret_refiner.refine_congs
                  call_stack_pre
                  split_call_class
                  calls_pre_refined
                  stack_syms
                  all_sevpa_states in
              
              (* Update map from calls to partitions. *)
              assert (has_entry calls_stack_refined);

              Vpa.Call_trans_map.add call calls_stack_refined
            )
            v.Vpa.vpa_calls
            Vpa.Call_trans_map.empty in
        
        (* call_part': a function from each call to its partition. *)
        let call_parts' call = Vpa.Call_trans_map.find call call_parts_map' in
        
        (* updated_calls: some class of call classes changed. *)
        let same_call_mods =
          Calls.for_all
            (fun call ->
              Call_classes.equal (call_parts call) (call_parts' call)
            )
            v.Vpa.vpa_calls in
        if same_call_mods then call_parts' else refine_call_parts call_parts' in
      
      (* init_call_part: the initial call partition. Maps every call
       * to a map from every state to the full set of states. *)
      let init_call_part =
        let full_map =
          States.fold
            (fun enter -> State_map.add enter v.Vpa.vpa_states)
            v.Vpa.vpa_states
            State_map.empty in
        (fun call -> Call_classes.singleton full_map) in

        (* Refine the congruence classes. *)
      refine_call_parts init_call_part in

    (* states: the set of states. *)
    let states =
      (* entry_states: the set of entry-level classes. *)
      let entry_states =
        State_classes.fold
          (fun entry_class entry_states -> 
            Sevpa_states.add (Entry_state(entry_class)) entry_states
          )
          entry_part
          Sevpa_states.empty in

      (* call_states: the set of call-module classes. *)
      let call_states =
        (* For each call: *)
        Calls.fold
          (fun call call_classes ->
            (* For each VPA state: *)
            let call_sevpa_states =
              Call_classes.fold
                (fun call_class call_classes ->
                  Sevpa_states.add (Call_state(call, call_class)) call_classes
                )
                (call_parts call)
                Sevpa_states.empty in
            Sevpa_states.union call_classes call_sevpa_states
          )
          v.Vpa.vpa_calls
          Sevpa_states.empty in
      Sevpa_states.union entry_states call_states in

    (* accs: accepting states of the SEVPA. *)
    let accs = 
      Sevpa_states.filter
        (fun sevpa_state ->
          (match sevpa_state with
              Entry_state(states) ->
                not (States.is_empty (States.inter states v.Vpa.vpa_acc))
            | Call_state(_) -> false
          )
        )
        states in

    (* find_entry_img: scan the space of entry classes and find the
     * class that contains the input image. *)
    let find_entry_img img =
      let found_opt =
        State_classes.fold
          (fun state_class found_opt ->
            (match found_opt with
                Some(_) -> found_opt
              | None -> 
                if States.subset img state_class then Some(state_class)
                else None
            )
          )
          entry_part
          None in
      (match found_opt with
          Some(found) -> found
        | None -> failwith "find_entry_img: image not found"
      ) in
    
    (* find_call_img: scan the space of call-module classes and find
     * the class that contains the input image. *)
    let find_call_img call img =
      let found_opt =
        Call_classes.fold
          (fun call_map found_opt ->
            (match found_opt with
                Some(_) -> found_opt
              | None ->
                (* contained: the image is contained by call_class. *)
                let contained =
                  State_map.for_all
                    (fun state img_posts ->
                      let call_posts = State_map.find state call_map in
                      States.subset img_posts call_posts
                    )
                    img in
                if contained then Some(call_map) else None
            )
          )
          (call_parts call)
          None in
      (match found_opt with
          Some(found) -> found
        | None -> failwith "find_call_img: no image found"
      ) in
    
    (* entry_mod: the entry module. *)
    let entry_mod =
      let entry_states =
        Sevpa_states.filter
          (fun state ->
            (match state with
                Entry_state(_) -> true
              | Call_state(_) -> false
            )
          )
          states in
      let entry_init =
        Entry_state(find_entry_img (States.singleton v.Vpa.vpa_init)) in
      (entry_states, entry_init, entry_states) in
    
    (* call_mod: function from each call to its SEVPA module. *)
    let call_mod call =
      (* call_states: the set of all states in the call module. *)
      let call_states =
        Call_classes.fold
          (fun call_class call_states ->
            Sevpa_states.add (Call_state(call, call_class)) call_states
          )
          (call_parts call)
          Sevpa_states.empty in
      let call_entry = 
        let exact_entry =
          States.fold
            (fun state exact_entry ->
              State_map.add state (States.singleton state) exact_entry
            )
            v.Vpa.vpa_states
            State_map.empty in
        dbg "call_mod: pre call to find_call_img";
        Call_state(call, find_call_img call exact_entry) in
      (call_states, call_entry, call_states) in
    
      (* int_enabled: enable every internal in every state. *)
    let int_enabled _ = v.Vpa.vpa_ints in
    
      (* call_enabled: enabled every call in every state. *)
    let call_enabled _ = v.Vpa.vpa_calls in

      (* int_trans: the internal transition function. *)
    let int_trans state intrnal =
      (match state with
          Entry_state(entry_states) ->
            let img =
              States.fold
                (fun state img ->
                  States.add (v.Vpa.vpa_internal_trans state intrnal) img
                )
                entry_states
                States.empty in
            Entry_state(find_entry_img img)
        | Call_state(call, pre_posts) ->
          let img =
            States.fold
              (fun state img ->
                let state_img =
                  States.fold
                    (fun post state_img ->
                      States.add
                        (v.Vpa.vpa_internal_trans post intrnal) state_img
                    )
                    (State_map.find state pre_posts)
                    States.empty in
                State_map.add state state_img img
              )
              v.Vpa.vpa_states
              State_map.empty in
          dbg "int_trans: pre call to find_call_img";
          Call_state(call, find_call_img call img)
      ) in

      (* ret_trans: the return transition function. *)
    let ret_trans pre stack =
      (match pre, stack with
          Call_state(call, pre_posts), Entry_state(entries) ->
            let img =
              States.fold
                (fun caller_state img ->
                  let entry = v.Vpa.vpa_call_trans caller_state call in
                  let rets =
                    States.fold
                      (fun ex_state rets ->
                        States.add
                          (v.Vpa.vpa_return_trans ex_state caller_state)
                          rets
                      )
                      (State_map.find entry pre_posts)
                      States.empty in
                  States.union img rets
                )
                entries
                States.empty in
            Entry_state(find_entry_img img)
        | Call_state(callee, pre_trfrm), Call_state(caller, stack_trfrm) ->
          let img =
            States.fold
              (fun state img ->
                  (* state_img: image for the current caller state. *)
                let state_img =
                    (* For each post-state on the stack: *)
                  States.fold
                    (fun call_state state_img ->
                        (* entry: the call entry for the state. *)
                      let entry = v.Vpa.vpa_call_trans call_state callee in
                      States.fold
                        (fun ex_state state_img ->
                          States.add
                            (v.Vpa.vpa_return_trans ex_state state) state_img
                        )
                        (State_map.find entry pre_trfrm)
                        state_img
                    )
                    (State_map.find state stack_trfrm)
                    States.empty in
                State_map.add state state_img img
              )
              v.Vpa.vpa_states
              State_map.empty in
          dbg "ret_trans: pre call to find_call_img";
          Call_state(caller, find_call_img caller img)
        | _ -> failwith "vpa_to_sevpa: ret_trans: unexpected state pair"
      ) in
    
    { Sevpa.sevpa_nm = "sevpa_of_vpa";
      sevpa_ints = v.Vpa.vpa_ints;
      sevpa_calls = v.Vpa.vpa_calls;
      sevpa_states = states;
      sevpa_acc = accs;
      sevpa_entry_mod = entry_mod;
      sevpa_call_mod = call_mod;
      sevpa_int_enabled = int_enabled;
      sevpa_call_enabled = call_enabled;
      sevpa_int_trans = int_trans;
      sevpa_return_trans = ret_trans;
    }
end
    
module Dfa_to_vpa_abs =
  functor (Comps: DFA_TO_VPA_CONV) ->
struct
  (* Dfa: the input module of finite automata. *)
  module Dfa = Comps.Dfa

  module Internal = Comps.Internal
  module Internals = Set.Make(Internal)
    
  module Call = Comps.Call
  module Calls = Set.Make(Call)

  module Mod_id =
    struct
      type t = Call.t mod_id
      let compare m_0 m_1 =
        (match m_0, m_1 with
            Call_mod(c_0), Call_mod(c_1) -> Call.compare c_0 c_1
          | _ -> compare m_0 m_1
        )
    end

  module Mod_ids = Set.Make(Mod_id)
  module Mod_id_map = Map.Make(Mod_id)

  module Vpa =
    Sevpa_abs(
      struct
        module Comp_state = Dfa.State
        module Comp_states = Dfa.States
          
        module Comp_int = Internal
        module Comp_ints = Internals

        module Comp_call = Call
        module Comp_calls = Calls

        module Comp_mod_id = Mod_id
        module Comp_mod_ids = Mod_ids
        module Comp_id_map = Mod_id_map

        let comp_state_to_string = Dfa.state_to_string
        let comp_internal_to_string = Comps.comp_target_internal_to_string
        let comp_call_to_string = Comps.comp_target_call_to_string
      end)

  type visible_action =
      Vis_internal of Vpa.internal
    | Vis_call of Vpa.call

  module Call_map = Vpa.Call_trans_map

  let dfa_to_vpa visible d =
    (* internals: the internal actions of the VPA. *)
    let internals =
      Dfa.Actions.fold
        (fun action internals ->
          (match visible action with
              Vis_internal(intrnal) -> Internals.add intrnal internals
            | Vis_call(_) -> internals
          )
        )
        d.Dfa.dfa_actions
        Internals.empty in

    let calls =
      Dfa.Actions.fold
        (fun action calls ->
          (match visible action with
              Vis_internal(_) -> calls
            | Vis_call(call) -> Calls.add call calls
          )
        )
        d.Dfa.dfa_actions
        Calls.empty in

    (* vpa_int_trans_func: the internal transition function. *)
    let vpa_int_trans_func =
      let internal_map =
        Dfa.Actions.fold
          (fun action internal_map ->
            (match visible action with
                Vis_internal(intrnal) -> 
                  Vpa.Internal_map.add intrnal action internal_map
              | Vis_call(_) -> internal_map
            )
          )
          d.Dfa.dfa_actions
          Vpa.Internal_map.empty in
      let internal_to_flat internal = 
        Vpa.Internal_map.find internal internal_map in
      (fun pre internal -> 
        d.Dfa.dfa_trans pre (internal_to_flat internal)
      ) in
      
    (* vpa_call_trans_func: the call transition function. *)
    let vpa_call_trans_func =
      let call_map =
        Dfa.Actions.fold
          (fun action call_map ->
            (match visible action with
                Vis_internal(_) -> call_map
              | Vis_call(call) -> Vpa.Call_trans_map.add call action call_map
            )
          )
          d.Dfa.dfa_actions
          Vpa.Call_trans_map.empty in
      let call_to_flat call = Vpa.Call_trans_map.find call call_map in
      (fun pre call -> d.Dfa.dfa_trans pre (call_to_flat call)) in

    (* vpa_ret_trans_func: VPA return transition function. *)
    let vpa_ret_trans_func pre _ = pre in

    { Vpa.vpa_ints = internals;
      vpa_calls = calls;
      vpa_states = d.Dfa.dfa_states;
      vpa_init = d.Dfa.dfa_init;
      vpa_acc = d.Dfa.dfa_accept;
      vpa_internal_trans = vpa_int_trans_func;
      vpa_call_trans = vpa_call_trans_func;
      vpa_return_trans = vpa_ret_trans_func;
    }
end

module Game_abs =
  functor (Comps: GAME_COMPS) ->
struct
  module Att_int = Comps.Comp_att_int
  type att_int = Att_int.t
  module Att_ints = Comps.Comp_att_ints

  module Def_int = Comps.Comp_def_int
  type def_int = Def_int.t
  module Def_ints = Comps.Comp_def_ints

  module Call = Comps.Comp_call
  type call = Call.t
  module Calls = Comps.Comp_calls

  type vpa_mod_id = call mod_id
  module Mod_ids = Comps.Comp_mod_ids
  module Mod_id_map = Comps.Comp_mod_map

  module Att_state = Comps.Comp_att_state
  type att_state = Att_state.t
  module Att_states = Comps.Comp_att_states

  module Def_state = Comps.Comp_def_state
  type def_state = Def_state.t
  module Def_states = Comps.Comp_def_states

  module Att_state_map = Map.Make(Att_state)
  module Def_state_map = Map.Make(Def_state)

  module Att_int_trans_pre =
  struct
    type t = att_state * att_int
    let compare (state_0, int_0) (state_1, int_1) =
      let state_cmp = Att_state.compare state_0 state_1 in
        if state_cmp != 0 then state_cmp else Att_int.compare int_0 int_1
  end

  module Att_int_trans_map = Map.Make(Att_int_trans_pre)

  module Def_int_trans_map =
    Map.Make(
      struct
        type t = def_state * def_int
        let compare (state_0, int_0) (state_1, int_1) =
          let state_cmp = Def_state.compare state_0 state_1 in
            if state_cmp != 0 then state_cmp else Def_int.compare int_0 int_1
      end)
  module Call_trans_map = Map.Make(Call)
  module Return_trans_map =
    Map.Make(
      struct
        type t = att_state * att_state
        let compare (pre_0, stack_0) (pre_1, stack_1) =
          let pre_cmp = Att_state.compare pre_0 pre_1 in
            if pre_cmp != 0 then pre_cmp else Att_state.compare stack_0 stack_1
      end)

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

  let att_int_to_string = Comps.comp_att_int_to_string
  let def_int_to_string = Comps.comp_def_int_to_string
  let call_to_string = Comps.comp_call_to_string
  let att_state_to_string = Comps.comp_att_state_to_string
  let def_state_to_string = Comps.comp_def_state_to_string

  let gm_stats game =
    let mod_report (mod_atts, mod_defs, mod_init, mod_exits) =
      "num. mod. Attacker states: "
      ^ (string_of_int (Att_states.cardinal mod_atts)) ^ "\n"
      ^ "num. mod. Defender states: "
      ^ (string_of_int (Def_states.cardinal mod_defs)) ^ "\n"
      ^ "num. mod. exits: " ^ (string_of_int (Att_states.cardinal mod_exits)) 
      ^ "\n" in

    let num_att_ints =
      "num. Attacker internals: " 
      ^ (string_of_int (Att_ints.cardinal game.gm_att_ints)) ^ "\n" in

    let num_def_ints =
      "num. Defender internals: " 
      ^ (string_of_int (Def_ints.cardinal game.gm_def_ints)) ^ "\n" in

    let num_calls =
      "num. calls: " 
      ^ (string_of_int (Calls.cardinal game.gm_calls)) ^ "\n" in

    let num_att_states =
      "num. att states: " 
      ^ (string_of_int (Att_states.cardinal game.gm_att_states)) ^ "\n" in

    let num_def_states =
      "num. def states: " 
      ^ (string_of_int (Def_states.cardinal game.gm_def_states)) ^ "\n" in

    let init_mod_report = "entry mod.:\n" ^ (mod_report game.gm_entry_mod) in
    let call_mods_report =
      Calls.fold
        (fun call call_mods_report ->
           call_mods_report
           ^ (call_to_string call) ^ ":\n" 
           ^ (mod_report (game.gm_call_mods call))
        )
        game.gm_calls
        "" in

      game.gm_nm ^ "\n"
      ^ num_att_ints ^ num_def_ints ^ num_calls 
      ^ num_att_states ^ num_def_states
      ^ init_mod_report ^ call_mods_report


  type strat_state = att_state
  module Strat_state = Att_state
  module Strat_states = Att_states
  module Strat_state_map = Att_state_map
  module Strat_int_map = Map.Make(Att_int)
  module Strat_int_trans_map = Att_int_trans_map

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
        
  let strat_mod_ids strat =
    Calls.fold
      (fun call mod_ids -> Mod_ids.add (Call_mod(call)) mod_ids)
      strat.calls
      (Mod_ids.singleton Entry_mod)

  (* strat_stats: print stats on a given strategy. *)
  let strat_stats game def_strat =
    print_endline "strategy:\nAttacker states:";
    Att_states.iter
      (fun att_state ->
        print_endline "Attacker state: ";
        print_endline (att_state_to_string att_state);
        print_endline
          ("num. enabled: " 
           ^ (string_of_int
                (Att_ints.cardinal 
                   (def_strat.enabled_att_ints att_state))));
        Att_ints.iter
          (fun att_int ->
            print_endline
              ("Attacker action: " ^ (att_int_to_string att_int));
            print_endline
              ("Defender state: "
               ^ (def_state_to_string 
                    (game.gm_att_int_trans att_state att_int)));
            print_endline
              ("Defender primitive: "
               ^ (def_int_to_string
                    (def_strat.int_action_choice att_state att_int)))
          )
          (def_strat.enabled_att_ints att_state)
      )
      def_strat.states;

    let call_choice_str =
      Calls.fold
        (fun call call_str ->
           call_str
           ^ (def_int_to_string (def_strat.mod_action_choice call)) ^ "\n"
        )
        def_strat.calls
        "module-initial choices:\n" in

      def_strat.strat_nm
      ^ "\nnum. states: "
      ^ (string_of_int (Att_states.cardinal def_strat.states)) ^ "\n"
      ^ call_choice_str

  end
