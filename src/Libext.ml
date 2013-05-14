(* Libext: extensions to the OCaml library, and functions of general
 * use. *)
module type STR_ORDERED =
sig
  module Comp: Set.OrderedType
  val to_string: Comp.t -> string
end
    
module Int_map =
  Map.Make(
    struct
      type t = int
      let compare = compare
    end)

module Strings = Set.Make(String)
  
module String_map = Map.Make(String)

module String_pair =
  struct
    type t = string * string
    let compare = compare
  end

module String_pairs = Set.Make(String_pair)

let compose f g x = g (f x)

let id x = x

let implies hyp concl = (not hyp) || concl

let map_to_string map_fold key_to_string data_to_string map =
  map_fold
    (fun key data to_string ->
       to_string ^ (key_to_string key) ^ ": " ^ (data_to_string data) ^ "\n"
    )
    map
    ""

let map_union map_fold map_add map_0 map_1 =
  map_fold
    (fun key data union_map -> map_add key data union_map)
    map_1
    map_0

let noisy_cell = ref false 

let dbg s = if !noisy_cell then print_endline s

let string_ls_to_set string_ls =
  List.fold_left
    (fun strings str -> Strings.add str strings)
    Strings.empty
    string_ls

let set_to_string set_fold elt_to_string set =
  let elts_string =
    set_fold
      (fun elt elts_string -> elts_string ^ (elt_to_string elt) ^ ", ")
      set
      "" in
    "{ " ^ elts_string ^ " }"

let substr needle haystack =
  let needle_len = String.length needle in
  let rec sub_iter i = 
    if i + needle_len > String.length haystack then false
    else
      let sub_hay = String.sub haystack i needle_len in
        (needle = sub_hay) || (sub_iter (i + 1)) in
    sub_iter 0

let unit_func _ = ()
