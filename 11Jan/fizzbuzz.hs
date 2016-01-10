detectFizzBuzz x
    | x == 0 = show x
    | rem x 3 == 0 && rem x 5 == 0 = "fizzbuzz"
    | rem x 3 == 0 = "fizz"
    | rem x 5 == 0 = "buzz"
    | otherwise = show x

fizzbuzz range = do
    map detectFizzBuzz [0 .. range]

main = do
    print(fizzbuzz 3)
    print(fizzbuzz 7)
    print(fizzbuzz 17)