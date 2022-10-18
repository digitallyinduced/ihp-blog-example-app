module Main where

import Test.Hspec
import IHP.Prelude

import Test.Controller.PostsSpec

main :: IO ()
main = hspec do
    Test.Controller.PostsSpec.tests