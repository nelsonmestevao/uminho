-- ========================================================================== --
-- Programação Funcional                                            2016/2017 --
-- Teste Final                                                                --
-- ========================================================================== --
module TF_1617 where

--------------------------------------------------------------------------------
-- Questão 1 --
--------------------------------------------------------------------------------
type MSet a = [(a, Int)]

-- (a)
cardMSet :: MSet a -> Int
cardMSet [] = 0
cardMSet (x:xs) = snd x + cardMSet xs

-- (b)
moda :: MSet a -> [a]
moda = modaAux 0

modaAux :: Int -> MSet a -> [a]
modaAux _ [] = []
modaAux n (x:xs)
  | n > snd x = modaAux n xs
  | n < snd x = fst x : modaAux (snd x) xs
  | n == snd x = fst x : modaAux n xs

-- (c)
converteMSet :: MSet a -> [a]
converteMSet [] = []
converteMSet (x:xs) = replicate (snd x) (fst x) ++ converteMSet xs

-- (d)
addNcopies :: Eq a => MSet a -> a -> Int -> MSet a
addNcopies l a i = insereFinal z y
  where
    x = compara l a
    y = sumPair x (a, i)
    z = removeOriginal l a

insereFinal :: MSet a -> (a, Int) -> MSet a
insereFinal [] (a, i) = [(a, i)]
insereFinal (x:xs) (a, i)
  | snd x <= i = (a, i) : x : xs
  | otherwise = x : insereFinal xs (a, i)

removeOriginal :: Eq a => MSet a -> a -> MSet a
removeOriginal [] _ = []
removeOriginal (x:xs) a
  | fst x == a = xs
  | otherwise = x : removeOriginal xs a

compara :: Eq a => MSet a -> a -> (a, Int)
compara ((a, b):xs) c
  | c == a = (a, b)
  | otherwise = (c, 0)

sumPair :: (a, Int) -> (a, Int) -> (a, Int)
sumPair (a, b) (m, c) = (a, b + c)

--------------------------------------------------------------------------------
-- Questão 2 --
--------------------------------------------------------------------------------
data SReais
  = AA Double
       Double
  | FF Double
       Double
  | FA Double
       Double
  | AF Double
       Double
  | Uniao SReais
          SReais

-- (a)
showSR :: SReais -> String
showSR (AA x y) = "]" ++ show x ++ "," ++ show y ++ "["
showSR (AF x y) = "]" ++ show x ++ "," ++ show y ++ "]"
showSR (FA x y) = "[" ++ show x ++ "," ++ show y ++ "["
showSR (FF x y) = "[" ++ show x ++ "," ++ show y ++ "]"
showSR (Uniao x y) = "(" ++ showSR x ++ " " ++ "U" ++ " " ++ showSR y ++ ")"

instance Show SReais where
  show = showSR

-- (b)
pertence :: Double -> SReais -> Bool
pertence x (AA y z) = x > y && x < z
pertence x (AF y z) = x == z || pertence x (AA y z)
pertence x (FA y z) = x == y || pertence x (AA y z)
pertence x (FF y z) = pertence x (AF y z) || pertence x (FA y z)
pertence x (Uniao y z) = pertence x y || pertence x z

-- (c)
tira :: Double -> SReais -> SReais
tira x (FF y z)
  | x == y = AF y z
  | x == z = FA y z
  | x < y || x > z = FF y z
  | otherwise = Uniao (FA y x) (AF x z)
tira x (FA y z)
  | x == y = AA y z
  | x < y || x >= z = FA y z
  | otherwise = Uniao (FA y x) (AA x z)
tira x (AF y z)
  | x == z = AA y z
  | x <= y || x > z = AF y z
  | otherwise = Uniao (AA y x) (AF x z)
tira x (AA y z)
  | x <= y || x >= z = AA y z
  | otherwise = Uniao (AA y x) (AA x z)
tira x (Uniao y z) = Uniao (tira x y) (tira x z)

--------------------------------------------------------------------------------
-- Questão 3 --
--------------------------------------------------------------------------------
data Rtree a =
  R a
    [Rtree a]

-- (a)
percorre :: [Int] -> Rtree a -> Maybe [a]
percorre = undefined

-- (b)
procura :: Eq a => a -> Rtree a -> Maybe [Int]
procura = undefined
