-- ========================================================================== --
-- Programação Funcional                                            2017/2018 --
-- Ficha 1: Funções Não Recursivas                                            --
-- ========================================================================== --
module Ficha_1 where

import Data.Char

--------------------------------------------------------------------------------
-- Exercício 1 --
--------------------------------------------------------------------------------
-- (a)
perimetro r = 2 * pi * r

-- (b)
dist :: (Double, Double) -> (Double, Double) -> Double
dist (x1, y1) (x2, y2) = sqrt ((x2 - x1) ^ 2 + (y2 - y1) ^ 2)

-- (c)
primUlt l = (head l, last l)

-- (d)
multiplo m n = mod n m == 0

-- (e)
truncaImpar l =
  if length l `mod` 2 /= 0
    then tail l
    else l

-- (f)
max2 :: Integer -> Integer -> Integer
max2 x y =
  if x < y
    then y
    else x

-- (g)
max3 x y z =
  if max2 x y < z
    then z
    else max2 x y

--------------------------------------------------------------------------------
-- Exercício 2 --
--------------------------------------------------------------------------------
-- (a)
nRaizes a b c
  | (b ^ 2 - 4 * a * c) < 0 = 0
  | (b ^ 2 - 4 * a * c) > 0 = 2
  | (b ^ 2 - 4 * a * c) == 0 = 1

-- (b)
raizes :: Double -> Double -> Double -> [Double]
raizes a b c
  | nRaizes a b c == 2 =
    [ (((-b) + sqrt (b ^ 2 - 4 * a * c)) / (2 * a))
    , (((-b) - sqrt (b ^ 2 - 4 * a * c)) / (2 * a))
    ]
  | nRaizes a b c == 1 = [(-b) / (2 * a)]
  | nRaizes a b c == 0 = []

--------------------------------------------------------------------------------
-- Exercício 3 --
--------------------------------------------------------------------------------
type Hora = (Int, Int)

-- (a)
validaHora (h, m) =
  if h < 24 && m < 60
    then True
    else False

-- (b)
maiorHora (h1, m1) (h2, m2) =
  if h1 > h2 || (h1 == h2 && m1 > m2)
    then (h1, m1)
    else (h2, m2)

-- (c)
converterMinutos :: Hora -> Int
converterMinutos (h, m) = 60 * h + m

-- (d)
converterHoras :: Int -> Hora
converterHoras m = (div m 60, mod m 60)

-- (e)
diferencaHoras :: Hora -> Hora -> Int
diferencaHoras (h1, m1) (h2, m2)
  | converterMinutos (h1, m1) >= converterMinutos (h2, m2) =
    converterMinutos (h1, m1) - converterMinutos (h2, m2)
  | converterMinutos (h1, m1) < converterMinutos (h2, m2) =
    converterMinutos (h2, m2) - converterMinutos (h1, m1)

-- (f)
somarMinutos :: Int -> Hora -> Hora
somarMinutos m (h1, m1)
  | converterMinutos (h1, m1) + m < 1440 =
    converterHoras (converterMinutos (h1, m1) + m)
  | converterMinutos (h1, m1) + m >= 1440 =
    converterHoras (converterMinutos (h1, m1) + m - 1440)

--------------------------------------------------------------------------------
-- Exercício 4 --
--------------------------------------------------------------------------------
data Hora4 =
  H Int
    Int
  deriving (Show, Eq)

-- (a)
validaHora4 :: Hora4 -> Bool
validaHora4 (H h m) =
  if h < 24 && m < 60
    then True
    else False

-- (b)
maiorHora4 :: Hora4 -> Hora4 -> Hora4
maiorHora4 (H h1 m1) (H h2 m2) =
  if h1 > h2 || (h1 == h2 && m1 > m2)
    then (H h1 m1)
    else (H h2 m2)

-- (c)
converterMinutos4 :: Hora4 -> Int
converterMinutos4 (H h m) = 60 * h + m

-- (d)
converterHoras4 :: Int -> Hora4
converterHoras4 m = H (div m 60) (mod m 60)

-- (e)
diferencaHoras4 :: Hora4 -> Hora4 -> Int
diferencaHoras4 (H h1 m1) (H h2 m2) =
  converterMinutos4 (H h1 m1) - converterMinutos4 (H h2 m2)

-- (f)
somarMinutos4 :: Int -> Hora4 -> Hora4
somarMinutos4 m (H h1 m1)
  | converterMinutos4 (H h1 m1) + m < 1440 =
    converterHoras4 (converterMinutos4 (H h1 m1) + m)
  | converterMinutos4 (H h1 m1) + m >= 1440 =
    converterHoras4 (converterMinutos4 (H h1 m1) + m - 1440)

--------------------------------------------------------------------------------
-- Exercício 5 --
--------------------------------------------------------------------------------
data Semaforo
  = Verde
  | Amarelo
  | Vermelho
  deriving (Show, Eq)

-- (a)
next :: Semaforo -> Semaforo
next Verde = Amarelo
next Amarelo = Vermelho
next Vermelho = Verde

-- (b)
stop :: Semaforo -> Bool
stop s =
  if s == Vermelho
    then True
    else False

stop2 :: Semaforo -> Bool
stop2 Vermelho = True
stop2 _ = False

stop3 :: Semaforo -> Bool
stop3 semaforo =
  case semaforo of
    Vermelho -> True
    _ -> False

-- (c)
safe :: Semaforo -> Semaforo -> Bool
safe s1 s2 =
  if s1 == Vermelho || s2 == Vermelho
    then True
    else False

--------------------------------------------------------------------------------
-- Exercício 6 --
--------------------------------------------------------------------------------
data Ponto
  = Cartesiano Double
               Double
  | Polar Double
          Double
  deriving (Show, Eq)-- (a)
-- (b)
-- (c)
-- (d)
-- (e)
--------------------------------------------------------------------------------
-- Exercício 7 --
--------------------------------------------------------------------------------
-- (a)
-- (b)
-- (c)
-- (d)
--------------------------------------------------------------------------------
-- Exercício 8 --
--------------------------------------------------------------------------------
-- (a)
-- (b)
-- (c)
-- (d)
-- (e)
-- (f)
