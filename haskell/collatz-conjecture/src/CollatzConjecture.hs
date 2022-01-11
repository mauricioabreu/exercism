module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz s
    | s <= 0 = Nothing
    | otherwise = Just (collatz' s 0)


collatz' :: Integer -> Integer -> Integer
collatz' n steps
    | n == 1 = steps
    | otherwise = collatz' n' (steps + 1)
    where n' = if even n then n `div` 2 else 3 * n + 1