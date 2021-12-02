module Day2
    ( day2
    ) where

import Lib
import Data.Text

day2 :: [String] -> IO ()
day2 args = do
  --contents <- readLines (Prelude.head args)
  --let directions = [splitOn " " l | l <- contents]
  let directions = splitOn (pack " ") (pack "bing boom")
  print directions
