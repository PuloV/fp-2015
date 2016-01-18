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

treeValue (Node value _ _) = value

leftTree :: Tree a -> Tree a
leftTree (Node _ lTree _) = lTree

rightTree :: Tree a -> Tree a
rightTree (Node _ _ rTree) = rTree

isLeaf (Node _ Empty Empty) = True
isLeaf _ = False

flattenTree Empty = ""
flattenTree (Node x l r) =
    (flattenTree l) ++ show x ++ (flattenTree r)

countNodes Empty = 0
countNodes (Node _ left right) =
    count
    where
        leftCount = countNodes left
        rightCount = countNodes right
        count = leftCount + rightCount + 1

treeHeight Empty = 0
treeHeight (Node _ left right) = 1 + max (treeHeight left) (treeHeight right)

orTree Empty Empty = Empty
orTree Empty tree = tree
orTree tree _ = tree

isEmpty Empty = True
isEmpty _ = False

treeFind Empty root = Empty
treeFind foundTree@(Node x l r) root
    | x == root = foundTree
    | otherwise = orTree (treeFind l root) (treeFind r root)

countLeaves Empty = 0
countLeaves (Node _ Empty Empty) = 1
countLeaves (Node _ left right) = countLeaves left + countLeaves right

treeMap fn Empty = Empty
treeMap fn (Node x l r) = (Node (fn x) (treeMap fn l) (treeMap fn r))

main = do
    print(treeMap (\x -> x++"1") exampleTree)
