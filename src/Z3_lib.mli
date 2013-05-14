open Z3

val compare_z3_ast: Z3.ast -> Z3.ast -> int

module Ast_set: Set.S with type elt = Z3.ast

(* Ast_map: a map keyed on a Z3 term. *)
module Ast_map: Map.S with type key = Z3.ast

module Symbol_map: Map.S with type key = Z3.symbol

(* z3_ctx: a Z3 context *)
val z3_ctx: Z3.context
