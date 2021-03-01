module Main where

import Prelude
import Data.Newtype(class Newtype)
import Data.Identity(Identity)

newtype Effect a = Effect (Identity a)
derive instance newtypeEffect :: Newtype (Effect a) _
derive newtype instance functorEffect :: Functor Effect
derive newtype instance applyEffect :: Apply Effect
derive newtype instance applicativeEffect :: Applicative Effect
derive newtype instance bindEffect :: Bind Effect
derive newtype instance monadEffect :: Monad Effect

foreign import putStrLn :: String -> Effect Int
foreign import someStr :: Effect String


testString :: Effect Int
testString  =
  let s = "fooBAZ"
   in case s of
    "fooBAZ" -> pure 0
    _        -> pure 1

testRecord :: Effect Int
testRecord  =
  let r = { a: 1, b: 2, c: [0] }
  in
    case r { c = [5] } of
      { a: 1, b: 2, c: [5] } ->
        pure 0
      _ ->
        pure 1

testArray :: Effect Int
testArray  =
  let xs = [ 1, 2, 0, 3 ]
  in
    case xs of
      [_, _, x, _] -> pure x
      _            -> pure 1

main :: Effect Unit
main = do
  void $ putStrLn "hello"
  void $ testArray
  void $ testRecord
  void $ testString
