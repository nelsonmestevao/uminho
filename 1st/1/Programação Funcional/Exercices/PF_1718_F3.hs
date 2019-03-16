-- ========================================================================== --
-- Programação Funcional                                            2017/2018 --
-- Ficha 3: Problemas Matemáticos                                             --
-- ========================================================================== --
module Ficha_3 where

import Data.Char

--------------------------------------------------------------------------------
-- Exercício 1 --
--------------------------------------------------------------------------------
-- (a)
(><) :: Int -> Int -> Int
a >< b
  | a == 0 || b == 0 = 0
  | b == 1 = a
  | otherwise = a + (a >< (b - 1))

-- (b)
mydiv, mymod :: Int -> Int -> Int
mydiv c m
  | c < m = 0
  | c >= m = 1 + div (c - m) m

mymod c m
  | c < m = c
  | c >= m = mod (c - m) m

-- (c)
power :: Int -> Int -> Int
power a b
  | b == 0 = 1
  | b > 0 = a >< power a (b - 1)

--------------------------------------------------------------------------------
-- Exercício 2 --
--------------------------------------------------------------------------------
type Polinomio = [Monomio]

type Monomio = (Float, Int)

-- (a)
conta :: Int -> Polinomio -> Int
conta _ [] = 0
conta n (x:xs)
  | n == snd x = 1 + conta n xs
  | otherwise = conta n xs

-- (b)
grau :: Polinomio -> Int
grau [m] = snd m
grau (m:p) = max (snd m) (grau p)

-- (c)
selgrau :: Int -> Polinomio -> Polinomio
selgrau _ [] = []
selgrau n (m:p)
  | n == snd m = m : selgrau n p
  | otherwise = selgrau n p

-- (d)
derivM :: Monomio -> Monomio
derivM (c, e)
  | e > 0 = (c * fromIntegral e, e - 1)

deriv :: Polinomio -> Polinomio
deriv [] = []
deriv ((c, e):p)
  | e == 0 = deriv p
  | e > 0 = derivM (c, e) : deriv p

-- (e)
calcula :: Float -> Polinomio -> Float
calcula x [] = 0
calcula x ((c, e):p) = (c * x ^ e) + calcula x p

-- (f)
-- (g)
mult :: Monomio -> Polinomio -> Polinomio
mult n [] = []
mult (a, b) (x:xs) = (a * fst x, b + snd x) : mult (a, b) xs

-- (h)
-- normaliza :: Polinomio -> Polinomio
-- (i)
-- (j)
-- (k)
-- (l)
--------------------------------------------------------------------------------
-- Exercício 3 --
--------------------------------------------------------------------------------
type MSet a = [(a, Int)]

-- (a)
union :: Eq a => MSet a -> MSet a -> MSet a
union = undefined

unionElem :: Eq a => (a, Int) -> MSet a -> MSet a
unionElem e [] = [e]
unionElem (n, 0) ((n', o'):m)
  | n == n' = (n, o + o') : m
  | otherwise = (n', o') : unionElem (n, o) m
-- (b)
-- (c)
-- (d)
-- (e)
