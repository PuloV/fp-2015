
-- eq
5 == 5
5 == 4
5 /= 5
5 /= 4

-- function with one param
doubleMe x = x + x
doubleMe 2
doubleMe 42

-- function with 2 params
doubleUs x y = doubleMe x + doubleMe y
doubleUs 2 3

-- factorial
factorial x = if x > 1 then x * factorial (x - 1) else 1
factorial 3
factorial 4

-- list
fibonaciFirst6Nums = [1, 1, 2, 3, 5, 8]
fibonaciFirst6Nums

fibonaciNext4Nums = [13, 21, 34, 55]
fibonaciNext4Nums

-- append
fibonaciFirst10Nums = fibonaciFirst6Nums ++ fibonaciNext4Nums
fibonaciFirst10Nums

-- string append
"Hello" ++ " " ++ "word"

-- prepend
0:fibonaciFirst10Nums

-- string prepend
"Happy": " new year"

-- sugar stuff
1:2:3:4:[]

-- getting
fibonaciFirst10Nums !! 0
fibonaciFirst10Nums !! 2
fibonaciFirst10Nums !! 4
fibonaciFirst10Nums !! 6

-- lexicographical order
[3,2,1] > [2,1,0]
[3,2,1] > [2,10,100]
[3,4,2] > [3,4]
[3,4,2] > [2,4]
[3,4,2] == [3,4,2]

-- head tail  etc..
head fibonaciFirst10Nums
tail fibonaciFirst10Nums
last fibonaciFirst10Nums
init fibonaciFirst10Nums --without the last

length fibonaciFirst10Nums

-- take drop
take 3 fibonaciFirst10Nums
take 5 fibonaciFirst10Nums
take 0 fibonaciFirst10Nums

drop 5 fibonaciFirst10Nums
drop 0 fibonaciFirst10Nums
drop 100 fibonaciFirst10Nums

-- is element
55 `elem` fibonaciFirst10Nums
55 `elem` fibonaciFirst6Nums

-- ranges
[0..10]
['a'..'z']
['a'..'Z']































