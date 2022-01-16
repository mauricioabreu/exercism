module Anagram (anagramsFor) where

import Data.List
import Data.Char

anagramsFor :: String -> [String] -> [String]
anagramsFor xs = filter (anagram xs)

anagram :: [Char] -> [Char] -> Bool
anagram x y = x' /= y' && sort x' == sort y'
     where  x' = map toLower x
            y' = map toLower y