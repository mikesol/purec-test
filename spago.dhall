{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "my-project"
, dependencies =
  [ "assert"
  , "bifunctors"
  , "console"
  , "control"
  , "identity"
  , "integers"
  , "math"
  , "maybe"
  , "newtype"
  , "orders"
  , "prelude"
  , "unsafe-coerce"
  ]
, packages = ../purec/package-sets/packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
