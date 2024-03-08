{-# LANGUAGE TemplateHaskell #-}

module Main where

import Data.Double.Conversion.Text
import Data.Text

import Language.Haskell.TH

x :: Text
x = $(runQ [|pack "don't even have to call double-conversion"|])

main :: IO ()
main = do
  putStrLn $ unpack $ toShortest 4.20
