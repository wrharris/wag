module type BAZ =
sig
  type t
end

module type BAR =
sig
  type t2
  module Baz: BAZ
end

module type FOO =
sig
  module Bar0: BAR
    
  type u = Bar0.Baz.t

  module Bar1: BAR
    with module Baz = Bar0.Baz
end
