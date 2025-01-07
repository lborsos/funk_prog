-- A feladatban definiáltunk egy Pair nevű paraméteres adattípust, amely két értéket tartalmaz, írj egy swap nevű függvényt, amely megcseréli a Pair típusú értékek elemeit.

-- A Pair adattípus két típusparamétert használ, így a benne tárolt két érték különböző típusú lehet. A swap függvény megcseréli ezeket az értékeket, és ennek megfelelően a típusokat is megcseréli.


data Pair a b = Pair a b deriving (Show, Eq)

swap :: Pair a b -> Pair b a
swap (Pair x y) = Pair y x

--let p = Pair 42 "hello"
--swap p -- Pair "hello" 42



--Definiáld a removeSpaces függvényt, amely eldobja csak a szóközöket egy szöveg végéről. Feltehető, hogy a szöveg véges. Használhatod a dropWhile`` függvényt.

import Data.List (dropWhileEnd)

-- removeSpaces: levagjuk a szokozeket a szoveg jbb oldalarol (vegereol)
removeSpaces :: String -> String
removeSpaces = dropWhileEnd (== ' ')

--removeSpaces "  0123 abcd   zz xxx   "



-- Definiáld azt a függvényt, ami az or (||) műveletet valósítja meg egy Bool lista elemeire ([Bool]) a forldr függvény segítségével. Amennyiben van legalább egy True elem a listában, az eredmény True lesz (Bool). A függvényed nélkül a foldr a következőképp működne:  foldr (||) False [False, False]. A függvényedben viszont kerüld el a lista explicit megadását, vagyis ne szerepeljen a paraméter listában, csak a típus szignatúrában.


orFold :: [Bool] -> Bool
orFold = foldr (||) False


--orFold [False, False, False, False, True]




-- Definiáld az isSorted nevű függvényt, amely ellenőrzi rendezhető elemek listájáról, hogy az elemei növekvő sorrendben vannak-e. Ha a lista növekvően rendezett, akkor végtelen lista esetén a függvény nem terminál (remélhetőleg értelemszerű okok miatt).

-- isSorted: Ellenőrzi, hogy a lista növekvő sorrendben van-e
isSorted :: (Ord a) => [a] -> Bool
isSorted []       = True
isSorted [_]      = True
isSorted (x:y:xs) = x <= y && isSorted (y:xs)

-- isSorted [1, 3, 2] 


--Definiáld az intersperse' függvényt, amely egy adott elemet beszúr minden elem közé.

intersp' :: a -> [a] -> [a]
intersp' _ []       = []
intersp' _ [x]      = [x]
intersp' sep (x:xs) = x : sep : intersp' sep xs

--intersp' 0 [1,2,3] == [1,0,2,0,3]


{-
Készíts egy lambda függvényt, ami egy téglalap területét számolja ki! Egyszer használatos függvényt elég készíteni, amivel a magasabb rendű függvényedet paraméterezed.
l = undefined
Majd készíts egy magasabb rendű függvényt is, ami meghívja egy lista minden elemére a lambda függvényt! A lista (x, y) alakú párokat tartalmaz, ahol az x és a y egy téglalap oldalainak a hossza. A lista bejárására rekurzív megoldást használj, ne feledkezz meg az alapesetről!
-}

l = \x y -> x * y

mapt :: (Num a) => (a -> a -> a) -> [(a, a)] -> [a]
mapt f [] = []  -- ures lista
mapt f ((x, y):xs) = f x y : mapt f xs  -- rekurzivan a tobbi elemre



{-
mapt :: (Num a) => (a -> a -> a) -> [(a, a)] -> [a]
mapt _ [] = [] 
mapt f ((x, y):xs) = f x y : mapt f xs  -- rekurzivan
main :: IO ()
main = do
    let l = \x y -> x * y
    print $ mapt l [(2, 2), (3, 4)] == [4, 12]
    print $ mapt l [(2, 2), (3, 4), (6, 2)] == [4, 12, 12]
    print $ mapt l [] == []
    print $ [mapt l [(2, 2), (3, 4)] == [4, 12], mapt l [(2, 2), (3, 4), (6, 2)] == [4, 12, 12], mapt l [] == []] == [True, True, True]

-}
