module Main where

import Prelude
import Effect
import Effect.Unsafe
foreign import putStrLn :: String -> Effect Int
foreign import doSomePython :: Effect Unit


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

main :: Unit
main = unsafePerformEffect do
  void $ putStrLn "hello"
  void $ doSomePython
  void $ testArray
  void $ testRecord
  void $ testString
