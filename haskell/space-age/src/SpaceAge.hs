module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ageOn :: Planet -> Float -> Float
ageOn Mercury seconds = earthSeconds seconds / 0.2408467
ageOn Venus seconds = earthSeconds seconds / 0.61519726 
ageOn Earth seconds = earthSeconds seconds
ageOn Mars seconds = earthSeconds seconds / 1.8808158 
ageOn Jupiter seconds = earthSeconds seconds / 11.862615
ageOn Saturn seconds = earthSeconds seconds / 29.447498
ageOn Uranus seconds = earthSeconds seconds / 84.016846
ageOn Neptune seconds = earthSeconds seconds / 164.79132 

earthSeconds :: Float -> Float
earthSeconds seconds = seconds / 31557600