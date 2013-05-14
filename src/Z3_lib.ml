open Z3

let z3_ctx =
  let cfg = Z3.mk_config () in
    Z3.set_param_value cfg "MODEL" "true";
    Z3.mk_context cfg

module Symbol_map =
  Map.Make(
    struct
      type t = Z3.symbol
      let compare sym_0 sym_1 = 
        compare
          (Z3.get_symbol_string z3_ctx sym_0)
          (Z3.get_symbol_string z3_ctx sym_1)
    end)

let compare_z3_ast ast_0 ast_1 =
  compare (Z3.get_ast_id z3_ctx ast_0) (Z3.get_ast_id z3_ctx ast_1)

module Ast_set =
  Set.Make(
    struct
      type t = Z3.ast
      let compare = compare_z3_ast
    end)

module Ast_map =
  Map.Make(
    struct
      type t = Z3.ast
      let compare = compare_z3_ast
    end)
