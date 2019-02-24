-- ========================================================================== --
-- Programação Funcional                                            2017/2018 --
-- Ficha 6: Funções de Ordem Superior                                         --
-- ========================================================================== --

module Ficha_6 where

--------------------------------------------------------------------------------
-- Exercício 1 --
--------------------------------------------------------------------------------

-- (a)
any' :: (a -> Bool) -> [a] -> Bool
any' p [] = False
any' p (x:xs) | p x = True
              | otherwise = any' p xs

-- (b)
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' f [] _ = []
zipWith' f _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

-- (c)
takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' _ [] = []
takeWhile p (x:xs) = if p x
                     then x:takeWhile' p xs
                     else []

-- (d)
dropWhile' :: (a -> Bool) -> [a] -> [a]
dropWhile' f [] = []
dropWhile' f (x:xs) | f x = dropWhile' f xs
                    | otherwise = (x:xs)

-- (e)
span' :: (a -> Bool) -> [a] -> ([a],[a])
span' p l = (a,b)
         where
           a = takeWhile' p l
           b = dropWhile' p l

span2 :: (a -> Bool) -> [a] -> ([a],[a])
span2 p [] = ([],[])
span2 p (x:xs) | p x = (x:lt,ld)
               | otherwise = ([],x:xs)
               where
                 (lt,ld) = span2 p xs

-- (f)
deleteBy :: (a -> a -> Bool) -> a -> [a] -> [a]
deleteBy _ _ [] = []
deleteBy f v (x:xs) | f v x = xs
                    | otherwise = x:deleteBy f v xs

-- (g)
sortOn :: Ord b => (a -> b) -> [a] -> [a]
sortOn f [x] = [x]
sortOn f (h:t) | f h <= f j = h:t
               | otherwise = j:sortOn f (h:k)
               where
                 (j:k) = sortOn f t

--------------------------------------------------------------------------------
-- Exercício 2 --
--------------------------------------------------------------------------------

type Polinomio = [Monomio]
type Monomio = (Float,Int)

-- (a)
selGrau :: Int -> Polinomio -> Polinomio
selGrau e p = filter f p
          where
            f (c,g) = g == e

-- (b)
conta :: Int -> Polinomio -> Int
conta e p = length $ filter f p
         where
           f (c,g) = g==e

conta' :: Int -> Polinomio -> Int
conta' e p = foldr f 0 p
          where
            f (_,g) r | g == e = 1+r
                      | otherwise = r

-- (c)
derivada :: Polinomio -> Polinomio
derivada p = map deriv p
           where
             deriv (c,e) = (c * fromIntegral e,e-1)

-- (d)
calcula :: Float -> Polinomio -> Float
calcula x p = sum $ map (\(c,e) -> c*x^e) p

calcula' :: Float -> Polinomio -> Float
calcula' x p = foldr f 0 p
             where
               f (c,e) r = c*x^e+r

-- (e)

-- (f)

-- (g)

-- (h)

-- (i)

-- (j)

-- (k)

-- (l)

--------------------------------------------------------------------------------
-- Exercício 3 --
--------------------------------------------------------------------------------

-- (a)

-- (b)

-- (c)

-- (d)

-- (e)

-- (f)

-- (g)

-- (h)
