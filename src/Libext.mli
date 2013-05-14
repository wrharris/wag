(* Libext: extensions to the OCaml library, and functions of general
 * use. *)
module type STR_ORDERED =
sig
  module Comp: Set.OrderedType
  val to_string: Comp.t -> string
end

module Int_map: Map.S with type key = int

module Strings: Set.S with type elt = string

module String_pairs: Set.S with type elt = string * string

module String_map: Map.S with type key = string

val compose: ('a -> 'b) -> ('b -> 'c) -> 'a -> 'c

val dbg: string -> unit

val id: 'a -> 'a

val implies: bool -> bool -> bool

val map_to_string:
  (('key -> 'data -> string -> string) -> 'map -> string -> string) ->
  ('key -> string) ->
  ('data -> string) ->
  'map ->
  string

val map_union:
  (('key -> 'data -> 'map_0 -> 'map_0) -> 'map_1 -> 'map_0 -> 'map_0) ->
  ('key -> 'data -> 'map_0 -> 'map_0) ->
  'map_0 ->
  'map_1 ->
  'map_0

val noisy_cell: bool ref

val set_to_string:
  (('elt -> string -> string) -> 'elt_set -> string -> string) ->
  ('elt -> string) ->
  'elt_set ->
  string

val string_ls_to_set: string list -> Strings.t

val substr: string -> string -> bool

val unit_func: 'a -> unit
