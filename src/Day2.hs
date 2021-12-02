module Day2
    ( day2,
      makeMove,
      finalPosition
    ) where

import Lib
import Data.Text

makeMove :: (Int, Int) -> [Text] -> (Int, Int)
makeMove (horiz, depth) [moveType, moveSize] = do
  let intMoveSize = (read (unpack moveSize) :: Int)
  case (unpack moveType) of 
    "forward" -> (horiz + intMoveSize, depth)
    "down" -> (horiz, depth + intMoveSize)
    "up" -> (horiz, depth - intMoveSize)

finalPosition :: [[Text]] -> (Int, Int)
finalPosition xs = do
  Prelude.foldl makeMove (0,0) xs
 

day2 :: [String] -> IO ()
day2 args = do
  contents <- readLines (Prelude.head args)
  let directions = [splitOn (pack " ") (pack l) | l <- contents]
  putStrLn "Final position"
  let finalPos = finalPosition directions
  print (finalPos)
  putStrLn "Multiplied = "
  print ((fst finalPos) * (snd finalPos))
  
