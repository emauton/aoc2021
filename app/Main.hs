module Main where

import System.Environment
import qualified Data.Map as Map

import Day1
import Day2

days :: Map.Map String ([String] -> IO ())
days = Map.fromList [("1", day1), ("2", day2)]

main :: IO ()
main = do
  args <- getArgs
  case Map.lookup (head args) days of
    Nothing -> putStrLn $ "day " ++ (head args) ++ " not found"
    Just fn -> (fn (tail args))
