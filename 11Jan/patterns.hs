fac 0 = 1
fac n = n * fac (n-1)

fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

main = do
print(fib 3)
print(fac 5)