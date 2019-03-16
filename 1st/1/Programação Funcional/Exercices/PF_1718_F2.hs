-- ========================================================================== --
-- Programação Funcional                                            2017/2018 --
-- Ficha 2: Funções Recursivas Sobre Listas                                   --
-- ========================================================================== --
module Ficha_2 where

import Data.Char

--------------------------------------------------------------------------------
-- Exercício 1 --
--------------------------------------------------------------------------------
-- (a)
-- (b)
-- (c)
-- (d)
--------------------------------------------------------------------------------
-- Exercício 2 --
--------------------------------------------------------------------------------
-- (a)
dobros :: [Float] -> [Float]
dobros [] = []
dobros (h:t) = (2 * h) : dobros t

-- (b)
numOcorre :: Char -> String -> Int
numOcorre c [] = 0
numOcorre c (h:t) =
  if c == h
    then 1 + numOcorre c t
    else numOcorre c t

-- (c)
positivos :: [Int] -> Bool
positivos [x] = x >= 0
positivos (x:xs) = (x > 0) && positivos xs

-- (d)
soPos :: [Int] -> [Int]
soPos [] = []
soPos (x:xs)
  | x > 0 = x : soPos xs
  | otherwise = soPos xs

-- (e)
somaNeg :: [Int] -> Int
somaNeg [] = 0
somaNeg (x:xs)
  | x < 0 = x + somaNeg xs
  | otherwise = somaNeg xs

-- (f)
tresUlt :: [a] -> [a]
tresUlt (x:xs)
  | length (x : xs) <= 3 = x : xs
  | otherwise = tresUlt xs

-- (g)
primeiros :: [(a, b)] -> [a]
primeiros [] = []
primeiros ((x1, x2):xs) = x1 : primeiros xs

--------------------------------------------------------------------------------
-- Exercício 3 --
--------------------------------------------------------------------------------
-- isLower :: Char -> Bool, que testa se um Char é uma minúscula.
-- (b) isDigit :: Char -> Bool, que testa se um Char é um dı́gito.
-- (c) isAlpha :: Char -> Bool, que testa se um Char é uma letra.
-- (d) toUpper :: Char -> Char, que converte uma letra para a respectiva maiúscula.
-- (e) intToDigit :: Int -> Char, que converte um número entre 0 e 9 para o respec-
-- tivo dı́gito.
-- (f) digitToInt :: Char -> Int,
-- (a)
soDigitos :: [Char] -> [Char]
soDigitos [] = []
soDigitos (x:xs) =
  if isDigit x
    then x : soDigitos xs
    else soDigitos xs

-- (b)
minusculas :: [Char] -> Int
minusculas [] = 0
minusculas (x:xs)
  | isLower x = 1 + minusculas xs
  | otherwise = minusculas xs

-- -- (c)
-- nums :: String -> [Int]
-- nums (x:xs) = digitToInt()
-- soDigitos (x:xs)
--------------------------------------------------------------------------------
-- Exercício 4 --
--------------------------------------------------------------------------------
-- (a)
-- (b)
nosPrimeiros :: Eq a => a -> [(a, b)] -> Bool
nosPrimeiros a [] = False
nosPrimeiros a [(c, d)] = a == c
nosPrimeiros a ((c, d):xs) = a == c || nosPrimeiros a xs

-- (c)
minFst :: Ord a => [(a, b)] -> a
minFst [(x, y)] = x
minFst (x:xs)
  | m < fst x = m
  | otherwise = fst x
  where
    m = minFst xs
-- (d)
-- (e)
-- (f)
