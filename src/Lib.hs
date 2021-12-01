module Lib
    ( readLines
    ) where

readLines :: FilePath -> IO [String]
readLines = fmap lines . readFile
