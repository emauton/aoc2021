module Day2
    ( day2,
      makeMove,
      finalPosition,
      makeMove2,
      finalPosition2
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
 
makeMove2 :: (Int, Int, Int) -> [Text] -> (Int, Int, Int)
makeMove2 (horiz, depth, aim) [moveType, moveSize] = do
  let x = (read (unpack moveSize) :: Int)
  case (unpack moveType) of 
    "forward" -> (horiz + x, depth + (aim * x), aim)
    "down" -> (horiz, depth, aim + x)
    "up" -> (horiz, depth, aim - x)

finalPosition2 :: [[Text]] -> (Int, Int, Int)
finalPosition2 xs = do
  Prelude.foldl makeMove2 (0,0,0) xs
 

day2 :: [String] -> IO ()
day2 args = do
  contents <- readLines (Prelude.head args)
  let directions = [splitOn (pack " ") (pack l) | l <- contents]
  putStrLn "Part 1"
  putStrLn "Final position"
  let finalPos = finalPosition directions
  print (finalPos)
  putStrLn "Multiplied = "
  print ((fst finalPos) * (snd finalPos))
  putStrLn "Part 2"
  putStrLn "Final position"
  let (h, d, a) = finalPosition2 directions
  print (h, d, a)
  putStrLn "Multiplied = "
  print (h * d)
  
