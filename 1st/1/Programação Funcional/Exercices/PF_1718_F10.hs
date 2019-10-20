-- ========================================================================== --
-- Programação Funcional                                            2017/2018 --
-- Ficha 10: Input/Output                                                     --
-- ========================================================================== --
module Ficha_10 where

import Data.Char
import System.Random

-- getChar
-- putChar
leCaracter :: IO ()
leCaracter = do
  c <- getChar
  putStr [toUpper c]

numero :: IO Int
numero = do
  randomIO

--------------------------------------------------------------------------------
-- Exercício 1 --
--------------------------------------------------------------------------------
-- (a)
aleatorio :: (Int, Int) -> [Int] -> IO Int
aleatorio gama xs = do
  n <- randomRIO gama
  if elem n xs
    then aleatorio gama xs
    else return n

bingo = bingo' []

bingo' :: [Int] -> IO ()
bingo' xs =
  if length xs >= 90
    then return ()
    else do
      getChar
      n <- aleatorio (1, 90) xs
      putStrLn (show n)
      bingo' (n : xs)

-- (b)
geraSegredo :: IO [Int]
geraSegredo = do
  x1 <- randomRIO (0, 9)
  x2 <- randomRIO (0, 9)
  x3 <- randomRIO (0, 9)
  x4 <- randomRIO (0, 9)
  return [x1, x2, x3, x4]

compara :: [Int] -> [Int] -> (Int, Int)
compara xs ys = (c, e)
  where
    c = comparaCorrectos xs ys
    e = comparaErrados xs ys

comparaCorrectos :: [Int] -> [Int] -> Int
comparaCorrectos xs ys = length $ filter cmp $ (zip xs ys)
  where
    cmp (x, y) = x == y

comparaErrados :: [Int] -> [Int] -> Int
comparaErrados [] ys = 0
comparaErrados (x:xs) ys =
  if elem x ys
    then 1 + comparaErrados xs ys
    else comparaErrados xs ys

leInt :: IO Int
leInt = do
  a <- getChar
  return (read [a])

leSequencia :: IO [Int]
leSequencia = do
  c1 <- leInt -- getLine
  c2 <- leInt
  c3 <- leInt
  c4 <- leInt
  return [c1, c2, c3, c4]

mastermind :: IO () -- devolve quantos estão na posicao certa e quantos estão certos
mastermind = do
  segredo <- geraSegredo
  mastermind' segredo

mastermind' :: [Int] -> IO ()
mastermind' segredo = do
  jogada <- leSequencia
  let (certos, errados) = compara segredo jogada
  putStrLn ""
  putStrLn (show certos ++ " " ++ show errados)
  mastermind' segredo

-- (c)
data Aposta =
  Ap [Int] (Int, Int) -- valida :: Aposta -> Bool
-- valida (Ap (x:xs) (a,b)) =  intervaloNumeros && intervaloEstrelas && quantidadeNumeros
--                         where
--                           intervaloNumeros = maximum (x:xs) <= 50 && minimum (x:xs) >= 1
--                           intervaloEstrelas = max (a,b) <= 9 && min (a,b) >= 1
--                           quantidadeNumeros = length (x:xs) == 5
-- (d)
-- (e)
-- (f)
-- (g)
--------------------------------------------------------------------------------
-- Exercício 2 --
--------------------------------------------------------------------------------
-- (a)
-- (b)
-- (c)
-- (d)
-- (e)
-- (f)
-- (g)
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
