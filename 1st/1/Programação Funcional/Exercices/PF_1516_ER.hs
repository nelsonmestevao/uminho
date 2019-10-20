-- ========================================================================== --
-- Programação Funcional                                            2015/2016 --
-- Exame de Recurso                                                           --
-- ========================================================================== --
module ER_1516 where

import Data.Char

--------------------------------------------------------------------------------
-- Questão 1 --
--------------------------------------------------------------------------------
-- (a)
intersperse :: a -> [a] -> [a]
intersperse x [h] = [h]
intersperse x (h:t) = h : x : (intersperse x t)

-- (b)
inits :: [a] -> [[a]]
inits [] = [[]]
inits l = inits (init l) ++ [l]

--------------------------------------------------------------------------------
-- Questão 2 --
--------------------------------------------------------------------------------
type Aluno = (Numero, Nome, Classificacao)

type Numero = Int

type Nome = String

data Classificacao
  = Aprovado Int
  | Reprovou
  | Faltou

data Turma
  = Vazia
  | Nodo Aluno Turma Turma

-- (a)
inscNum :: Numero -> Turma -> Bool
inscNum n Vazia = False
inscNum n (Nodo a e d)
  | n > fstT a = inscNum n d
  | n < fstT a = inscNum n e
  | n == fstT a = True

fstT :: (a, b, c) -> a
fstT (a, b, c) = a

-- (b)
aprovAv :: Turma -> Float
aprovAv t = aprovado / total
  where
    aprovado = fst $ aprovAvAux t
    total = snd $ aprovAvAux t

aprovAvAux :: Turma -> (Float, Float) -- (Aprovados, Total)
aprovAvAux Vazia = (0, 0)
aprovAvAux (Nodo (_, _, classificacao) tL tR) =
  case classificacao of
    (Aprovado _) -> (1 + aprovadoL + aprovadoR, 1 + totL + totR)
    otherwise -> (aprovadoL + aprovadoR, 1 + totL + totR)
  where
    (aprovadoL, totL) = aprovAvAux tL
    (aprovadoR, totR) = aprovAvAux tR

-- (c)
melhorNota :: Turma -> Maybe Int
melhorNota Vazia = Nothing
melhorNota (Nodo (_, _, classi) tL tR) =
  case classi of
    Aprovado n -> max' (Just n) d
    otherwise -> d
  where
    d = max' (melhorNota tL) (melhorNota tR)

max' :: Maybe Int -> Maybe Int -> Maybe Int
max' Nothing Nothing = Nothing
max' Nothing n = n
max' n Nothing = n
max' (Just n) (Just m) = Just (max n m)

--------------------------------------------------------------------------------
-- Questão 3 --
--------------------------------------------------------------------------------
type Polinomio = [Coeficiente]

type Coeficiente = Float

-- (a)
adicao :: [Coeficiente] -> [Coeficiente] -> [Coeficiente]
adicao (x:xs) (y:ys) = (x + y) : adicao xs ys
adicao l [] = l
adicao [] l = l

-- (b)
solverPolinomio :: Polinomio -> IO Float
solverPolinomio l = do
  putStrLn "Atribua um valor a x:"
  x <- getChar
  putStrLn "\n"
  putStrLn "O resultado é:"
  return (calcula (toEnum (digitToInt x)) l 0)

calcula :: Float -> Polinomio -> Int -> Float
calcula x [] n = 0
calcula x (h:t) n = h * (x ^ n) + calcula x t (n + 1)

-- (c)
mult :: Polinomio -> Polinomio -> Polinomio
mult p1 p2 = multAux2 r
  where
    r = multAux1 p1 p2

multAux1 :: Polinomio -> Polinomio -> [Polinomio]
multAux1 [x] l = [map (x *) l]
multAux1 (x:xs) l = map (x *) l : multAux1 xs ([0] ++ l)

multAux2 :: [Polinomio] -> Polinomio
multAux2 [x] = x
multAux2 (x:y:xs) = (adicao x y) `adicao` multAux2 xs
