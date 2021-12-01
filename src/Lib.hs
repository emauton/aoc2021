module Lib
    ( someFunc,
      countIncreases
    ) where

someFunc :: IO ()
someFunc = putStrLn "hello aoc2021"

accumulate :: (Int, Int) -> Int -> (Int, Int)
accumulate (prev, acc) x = if x > prev
                             then (x, acc + 1)
                             else (x, acc)

countIncreases :: [Int] -> Int
countIncreases numbers = snd (foldl accumulate ((head numbers), 0) (tail numbers))
