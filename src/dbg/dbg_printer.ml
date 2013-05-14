(* dbg_printer: module of printers to be used by ocamldebug. These
 * must not be in the compiled program, due to requirements of
 * ocamldebug. *)
open Format

(* dbg_printer_valu: printer for LLVM instructions. *)
let dbg_print_int valu =
  Format.open_box 2;
  Format.print_string ("dbg: " ^ (string_of_int valu));
  Format.close_box ()
