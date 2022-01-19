module Clock (addDelta, fromHourMin, toString) where

import Text.Printf

data Clock = Clock {hour :: Int, minute :: Int}
  deriving (Eq)

instance Show Clock where
  show (Clock hour minute) = printf "%02d:%02d" hour minute

fromHourMin :: Int -> Int -> Clock
fromHourMin hour minute = Clock {hour=hour', minute=minute'}
  where   minute' = minute `mod` 60
          hour' = (hour + (minute `div` 60)) `mod` 24

toString :: Clock -> String
toString = show

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour minute (Clock hour' minute') = fromHourMin (hour+hour') (minute+minute') 
