module Lib
    ( day1,
      countIncreases,
      sumWindows
    ) where

readLines :: FilePath -> IO [String]
readLines = fmap lines . readFile

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

day1 :: IO ()
day1 = do
  contents <- readLines "day1_1.txt"
  let numbers = [read l :: Int | l <- contents]
  let windows = sumWindows numbers
  putStrLn "raw increases:"
  print (countIncreases numbers)
  putStrLn "windowed increases:"
  print (countIncreases windows)
