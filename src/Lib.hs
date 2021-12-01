module Lib
    ( day1_1,
      day1_2,
      countIncreases,
      sumWindows
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

sumWindows :: [Int] -> [Int]
sumWindows xs = do
  if (length xs) < 3
    then []
  else
    (sum (take 3 xs):(sumWindows (tail xs)))

day1_1 :: IO ()
day1_1 = do
  contents <- readLines "day1_1.txt"
  let numbers = [toInt l | l <- contents]
  print (countIncreases numbers)

day1_2 :: IO ()
day1_2 = do
  contents <- readLines "day1_1.txt"
  let numbers = [toInt l | l <- contents]
  let windows = sumWindows numbers
  print (countIncreases windows)
