-- ========================================================================== --
-- Programação Funcional                                            2017/2018 --
-- Ficha 9: Classes de Tipos                                                  --
-- ========================================================================== --
module Ficha_9 where

data Cores
  = Vermelho Int
  | Verde Int
  | Azul Int

azul :: Cores
azul = Azul 80

verde :: Cores
verde = Verde 50

-- amarelo :: Cores
-- amarelo = (Azul 20) * (Vermelho 40)
showCores :: Cores -> String
showCores (Azul n)
  | n > 60 = "Azul Escuro"
  | n < 40 = "Azul Claro"
  | otherwise = "Azul"

comparaCores :: Cores -> Cores -> Bool
comparaCores (Azul n1) (Azul n2)
  | n1 > 60 && n2 > 60 = True
  | n1 < 40 && n2 < 40 = True
  | n1 > 40 && n2 > 40 = True -- isto está mal
  | otherwise = False

instance Show Cores where
  show = showCores

instance Eq Cores where
  c1 == c2 = comparaCores c1 c2

--------------------------------------------------------------------------------
-- Exercício 1 --
--------------------------------------------------------------------------------
-- (a)
-- (b)
-- (c)
-- (d)
-- (e)
-- (f)
-- (g)
--------------------------------------------------------------------------------
-- Exercício 2 --
--------------------------------------------------------------------------------
data Exp a
  = Const a
  | Simetrico (Exp a)
  | Mais (Exp a) (Exp a)
  | Menos (Exp a) (Exp a)
  | Mult (Exp a) (Exp a)

e :: Exp Int
e = Mult (Const 2) (Mais (Const 3) (Const 4))

-- (a)
showExp :: Show a => Exp a -> String
showExp (Const v) = show v
showExp (Simetrico e) = "(" ++ showExp e ++ ")"
showExp (Mais e d) = "(" ++ showExp e ++ "+" ++ showExp d ++ ")"
showExp (Menos e d) = "(" ++ showExp e ++ "-" ++ showExp d ++ ")"
showExp (Mult e d) = "(" ++ showExp e ++ "*" ++ showExp d ++ ")"

instance Show a => Show (Exp a) where
  show = showExp

-- (b)
comparaExp ::
     Eq a
  => Num a =>
       Exp a -> Exp a -> Bool
comparaExp e1 e2 = calculaExp e1 == calculaExp e2

calculaExp :: Num a => Exp a -> a
calculaExp (Const n) = n
calculaExp (Simetrico e) = -calculaExp e
calculaExp (Mais e d) = calculaExp e + calculaExp d
calculaExp (Menos e d) = calculaExp e - calculaExp d
calculaExp (Mult e d) = calculaExp e * calculaExp d

instance (Eq a, Num a) => Eq (Exp a) where
  (==) = comparaExp

-- (c)
instance Num a => Num (Exp a) where
  e1 + e2 = Const $ calculaExp e1 + calculaExp e2
  e1 * e2 = Const $ calculaExp e1 * calculaExp e2
  e1 - e2 = Const $ calculaExp e1 - calculaExp e2
  negate e = Simetrico e
  abs e = Const $ abs $ calculaExp e
  signum e = Const $ signum $ calculaExp e
  fromInteger i = Const (fromInteger i)
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
