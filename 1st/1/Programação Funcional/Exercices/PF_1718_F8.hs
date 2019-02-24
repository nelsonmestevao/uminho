-- ========================================================================== --
-- Programação Funcional                                            2017/2018 --
-- Ficha 8: Outros tipos de Árvores                                           --
-- ========================================================================== --

module Ficha_8 where

--------------------------------------------------------------------------------
-- Exercício 1 --
--------------------------------------------------------------------------------

data ExpInt = Const Int
            | Simetrico ExpInt
            | Mais ExpInt ExpInt
            | Menos ExpInt ExpInt
            | Mult ExpInt ExpInt

e1 :: ExpInt
e1 = Const 7

e2 :: ExpInt
e2 = Simetrico e3

e3 :: ExpInt
e3 = (Mais (Const 10) (Mult (Const 3) (Mais (Const 2) (Const 3))))

-- (a)
calcula :: ExpInt -> Int
calcula (Const x)     = x
calcula (Simetrico x) = - (calcula x)
calcula (Mais x y)    = (calcula x) + (calcula y)
calcula (Menos x y)   = (calcula x) - (calcula y)
calcula (Mult x y)    = (calcula x) * (calcula y)

-- (b)
infixa :: ExpInt -> String
infixa (Const n)     = show n
infixa (Simetrico e) = "-" ++ (infixa e)
infixa (Mais e d)    = "(" ++ infixa e ++ "+" ++ infixa d ++ ")"
infixa (Menos e d)   = "(" ++ infixa e ++ "-" ++ infixa d ++ ")"
infixa (Mult e d)    = infixa e ++ "*" ++ infixa d

-- (c)
posfixa :: ExpInt -> String
posfixa (Const n)     = show n
posfixa (Simetrico e) = posfixa e ++ "-"
posfixa (Mais e d)    = "(" ++ posfixa e ++" " ++ posfixa d ++ "+" ++ ")"
posfixa (Menos e d)   = "(" ++ posfixa e ++" " ++ posfixa d ++ "-" ++ ")"
posfixa (Mult e d)    = "(" ++ posfixa e ++" " ++ posfixa d ++ "*" ++ ")"


--------------------------------------------------------------------------------
-- Exercício 2 --
--------------------------------------------------------------------------------

data Rtree a = R a [Rtree a]
             deriving Show

rt :: Num a => Rtree a
rt = (R 7 [R 2 [R 15 []
              ]
          ,R 5 [R 6 []
               ,R 4 []
               ]
          ,R 8 [R 1 []
               ,R 2 []
               ,R 3 []
               ]
          ])

-- (a)

soma :: Num a => Rtree a -> a
soma (R x []) = x
soma (R x e)  = x + sum (map soma e)

-- (b)

altura :: Rtree a -> Int
altura (R _ []) = 1
altura (R _ e)  = 1 + maximum (map altura e)

-- (c)

prune :: Int -> Rtree a -> Rtree a
prune 1 (R v l) = R v []
prune n (R v l) = R v (map (prune (n-1)) l)

-- (d)

mirror :: Rtree a -> Rtree a
mirror (R v l) = R v (reverse (map mirror l))

-- (e)
postorder :: Rtree a -> [a]
postorder (R v []) = [v]
postorder (R v l)  = lp ++ [v]
                  where
                   lp = foldr1 (++) (map postorder l)

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
