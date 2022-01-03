module Luhn (isValid) where
import Data.Char (isDigit, isSpace, digitToInt)

isValid :: String -> Bool
isValid s
    | length cInput <= 1 = False
    | isValidFormat s = False
    | otherwise = checksum cInput
    where cInput = toDigits s

double :: Int -> Int
double n
    | dn > 9 = dn - 9
    | otherwise = dn
    where dn = n * 2

toDigits :: String -> [Int]
toDigits = map digitToInt . reverse . filter isDigit

applyToEverySnd :: (a -> a) -> [a] -> [a]
applyToEverySnd _ [] = []
applyToEverySnd _ [x] = [x]
applyToEverySnd f (x:y:xs) = x : f y : applyToEverySnd f xs

checksum :: [Int] -> Bool
checksum xs = s `rem` 10 == 0
    where s = sum $ applyToEverySnd double xs

isValidFormat :: String -> Bool
isValidFormat = not . all (\x -> isSpace x || isDigit x)