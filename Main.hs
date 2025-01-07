main :: IO ()
main = do
    let l = \x y -> x * y
    print $ mapt l [(2, 2), (3, 4)] == [4, 12]
    print $ mapt l [(2, 2), (3, 4), (6, 2)] == [4, 12, 12]
    print $ mapt l [] == []
    print $ [mapt l [(2, 2), (3, 4)] == [4, 12], mapt l [(2, 2), (3, 4), (6, 2)] == [4, 12, 12], mapt l [] == []] == [True, True, True]
