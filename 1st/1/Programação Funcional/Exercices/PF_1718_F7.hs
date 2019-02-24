-- ========================================================================== --
-- Programação Funcional                                            2017/2018 --
-- Ficha 7: Árvores binárias com conteúdo nos nós                             --
-- ========================================================================== --

module Ficha_7 where

--------------------------------------------------------------------------------
-- Exercício 1 --
--------------------------------------------------------------------------------

data Btree a = Empty
             | N a (Btree a) (Btree a)
             deriving Show

t1 :: Num a => Btree a
t1 = N 1 (N 2 (N 3 Empty Empty) (N 1 Empty Empty))(N 3 Empty (N 4 (N 2 Empty Empty)(N 1 Empty Empty) ))

-- (a)
altura :: Btree a -> Int
altura Empty = 0
altura (N r e d) = 1 + max (altura e) (altura d)

-- (b)
contaNodos :: Btree a -> Int
contaNodos Empty = 0
contaNodos (N r e d) = 1 + ne + nd
                    where
                      ne = contaNodos e
                      nd = contaNodos d

-- (c)
folhas :: Btree a -> Int
folhas Empty = 0
folhas (N r Empty Empty) = 1
folhas (N r e d) = folhas e + folhas d

-- (d)
prune :: Int -> Btree a -> Btree a
prune _ Empty = Empty
prune 1 (N r e d) = N r Empty Empty
prune x (N r e d) = N r (prune (x-1) e) (prune (x-1) d)

-- (e)
path :: [Bool] -> Btree a -> [a]
path _ Empty = []
path [] (N r e d) = [r]
path (True:xs) (N r e d) = r:path xs d
path (False:xs) (N r e d)=r:path xs e

-- (f)
mirror :: Btree a -> Btree a
mirror Empty = Empty
mirror (N r e d) = N r (mirror d) (mirror e)

-- (g)
zipWithBT :: (a -> b -> c) -> Btree a -> Btree b -> Btree c
zipWithBT f Empty _ = Empty
zipWithBT f _ Empty = Empty
zipWithBT f (N r e d) (N x u i) = N (f r x) (zipWithBT f e u) (zipWithBT f d i)

-- (h)
unzipBT :: Btree (a,b,c) -> (Btree a,Btree b,Btree c)
unzipBT Empty = (Empty,Empty,Empty)
unzipBT (N (a,b,c) e d) =(N a ae ad, N b be bd, N c ce cd)
                       where
                        ae = fstT $ unzipBT e
                        ad = fstT $ unzipBT d
                        be = sndT $ unzipBT e
                        bd = sndT $ unzipBT d
                        ce = trdT $ unzipBT e
                        cd = trdT $ unzipBT d

fstT :: (a,b,c) -> a
fstT (x,y,z) = x

sndT :: (a,b,c) -> b
sndT (x,y,z) = y

trdT :: (a,b,c) -> c
trdT (x,y,z) = z

--------------------------------------------------------------------------------
-- Exercício 2 --
--------------------------------------------------------------------------------

-- (a)
minimo :: Ord a => Btree a -> a
minimo (N r Empty _) = r
minimo (N r e d) = minimo e

-- (b)
semMinimo :: Ord a => Btree a -> Btree a
semMinimo (N r Empty Empty) = Empty
semMinimo (N r Empty d) = d
semMinimo (N r e d) = N r (semMinimo e) d

-- (c)
minSmin :: Ord a => Btree a -> (a,Btree a)
minSmin (N r Empty Empty) = (r, Empty)
minSmin (N r Empty d) = (r, d)
minSmin (N r e d) = (fst (minSmin e), snd (minSmin d))

-- (d)
-- remove :: Ord a => a -> Btree a -> Btree a
-- remove b a@(N r e d) | b < r = N r (snd(minSmin e)) d
--                      | b > r = N r e (remove b d)
--                      |
--------------------------------------------------------------------------------
-- Exercício 3 --
--------------------------------------------------------------------------------

-- (a)
type Aluno = (Numero,Nome,Regime,Classificacao)

type Numero = Int

type Nome = String

data Regime = ORD | TE | MEL
            deriving Show

data Classificacao = Aprov Int
                   | Rep
                   | Faltou
                   deriving Show

type Turma = Btree Aluno -- árvore binária de procura (ordenada por número)

-- (b)

-- (c)

-- (d)

-- (e)

-- (f)

-- (g)
