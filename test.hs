module Test where

one :: Int
one = 10


add :: Int -> Int -> Int
add x y = x + y


greater :: Int -> Int -> Bool -- True / False
greater a b = a > b
--greater a b = (>) a b

even' :: Int -> Bool
even' n = mod n 2 == 0

odd' :: Int -> Bool
odd' n = mod n 2 /= 0

odd'' :: Int -> Bool
odd'' n = not (even' n)

trside :: Int -> Int -> Int -> Bool
trside a b c = a + b > c && a + c > b && b + c > a
