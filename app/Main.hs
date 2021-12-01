module Main where

import Data.Map ( Map )
import System.Environment

import qualified Data.Map as Map

import Day1

days :: Map String ([String] -> IO ())
days = Map.fromList [("1", day1)]

main :: IO ()
main = do
  args <- getArgs
  case Map.lookup (head args) days of
    Nothing -> putStrLn $ "day " ++ (head args) ++ " not found"
    Just fn -> (fn (tail args))
