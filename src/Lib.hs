module Lib
    ( day1_1,
      countIncreases
    ) where

readLines :: FilePath -> IO [String]
readLines = fmap lines . readFile

toInt :: String -> Int
toInt s = read s

accumulate :: (Int, Int) -> Int -> (Int, Int)
accumulate (prev, acc) x = if x > prev
                             then (x, acc + 1)
                             else (x, acc)

countIncreases :: [Int] -> Int
countIncreases numbers = snd (foldl accumulate ((head numbers), 0) (tail numbers))

day1_1 :: IO ()
day1_1 = do
  contents <- readLines "day1_1.txt"
  let numbers = [toInt l | l <- contents]
  print (countIncreases numbers)
