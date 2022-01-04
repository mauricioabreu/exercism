{-# LANGUAGE BangPatterns #-}

module ListOps
  ( length
  , reverse
  , map
  , filter
  , foldr
  , foldl'
  , (++)
  , concat
  ) where

import Prelude hiding
  ( length, reverse, map, filter, foldr, (++), concat )

foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' _ !z [] = z
foldl' f !z (x:xs) = foldl' f (f z x) xs

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr _ z [] = z
foldr f z (x:xs) = f x (foldr f z xs)


length :: [a] -> Int
length = foldr (\_ -> (+) 1) 0

reverse :: [a] -> [a]
reverse xs = reverse' xs []

reverse' :: [a] -> [a] -> [a]
reverse' xs acc = foldl' (flip (:)) acc xs

map :: (a -> b) -> [a] -> [b]
map _ [] = []
map f (x:xs) = f x : map f xs

filter :: (a -> Bool) -> [a] -> [a]
filter _ [] = []
filter p (x:xs) = if p x then x : filter p xs else filter p xs

(++) :: [a] -> [a] -> [a]
[] ++ [] = []
xs ++ [] = xs
[] ++ ys = ys
(x:xs) ++ ys = x:xs ++ ys

concat :: [[a]] -> [a]
concat [] = []
concat [xs] = xs
concat (xs:xss) = xs ++ concat xss
