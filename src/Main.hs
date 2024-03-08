module Main where

import Data.Double.Conversion.Text
import Data.Text

main :: IO ()
main = do
  putStrLn $ unpack $ toShortest 4.20
