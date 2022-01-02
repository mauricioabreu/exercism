module Luhn (isValid) where
import Data.Char (isSpace)
import Text.Read (readMaybe)

isValid :: String -> Bool
isValid s
    | length cInput <= 1 = False
    | not $ isNumber cInput = False
    | otherwise = validate $ toDigits cInput
    where cInput = trimWhitespace s

trimWhitespace :: String -> String
trimWhitespace = filter (not . isSpace)

isNumber :: String -> Bool
isNumber n = case n' of
    Nothing -> False
    Just _ -> True
    where n' = readMaybe n :: Maybe Int

double :: Int -> Int
double n
    | dn > 9 = dn - 9
    | otherwise = dn
    where dn = n * 2

toDigits :: String -> [Int]
toDigits n = reverse n'
    where n' = [read [x] :: Int | x <- n]

applyToEverySnd :: (a -> a) -> [a] -> [a]
applyToEverySnd _ [] = []
applyToEverySnd _ [x] = [x]
applyToEverySnd f (x:y:xs) = x : f y : applyToEverySnd f xs

validate :: [Int] -> Bool
validate xs = s `rem` 10 == 0
    where s = sum $ applyToEverySnd double xs