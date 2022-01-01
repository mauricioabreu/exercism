module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year = a == 0 && (b /= 0 || c == 0)
    where   a = year `mod` 4
            b = year `mod` 100
            c = year `mod` 400