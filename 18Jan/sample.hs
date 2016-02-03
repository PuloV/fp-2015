data Selianin = Pesho|BatGergi|Stamat|Dingo  deriving (Eq, Show)

data Rikia a = Empty | Litar a deriving (Show)

selskaMusic Pesho = " Chalga "
selskaMusic Stamat = " Srubsku "
selskaMusic _ = " Veronika && Veselina "


makeRikia s music
    | music == " Vesko M " = Empty
    | music == selskaMusic s = Litar 4
    | otherwise = Litar 2

iskamRikia Empty = 1
iskamRikia (Litar x) = x * 2

main = do
    print( iskamRikia (makeRikia Pesho " Chalga "))
    print( iskamRikia (makeRikia Pesho " Vesko M "))
    print( iskamRikia (makeRikia Pesho " Srubsku"))