module Main where

data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show)

exampleTree :: Tree String
exampleTree = Node "F"
                (Node "B"
                  (Node "A" Empty Empty)
                  (Node "D"
                    (Node "C" Empty Empty)
                    (Node "E" Empty Empty)))
                (Node "G"
                  Empty
                  (Node "I"
                    (Node "H" Empty Empty) Empty))


main = do
    print(exampleTree)
