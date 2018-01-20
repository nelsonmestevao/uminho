{- |
Module      : Tarefa2_2017li1g138
Description : Validar Mapas
Copyright   : Nelson Estevão <a76434@alunos.uminho.pt>;
            : Pedro Ribeiro  <a85493@alunos.uminho.pt>;

Módulo para a realização da Tarefa 2 de LI1 em 2017/18.
-}

module Tarefa2_2017li1g138 where

import LI11718
import Testing
import Data.List

{-|
Os testes a serem considerados pelo sistema de /feedback/
para a função 'valida'.
-}
testesT2 :: [Tabuleiro]
testesT2 = [tb01,tb02,tb03,tb04,tb05,tb06,tb07,tb08,tb09,tb10,tb11,tb12,tb13,tb14,tb15,tb16]

--------------------------------------------------------------------------------
-- Testa a compatibilidade entre a orientacao inicial e a primeira pecaInicial
--------------------------------------------------------------------------------
{- | Função que lista os casos em que a orientacao e compativel com a primeira peça -}
auxOrientacaoFstPeca :: Orientacao -> Peca -> Bool
auxOrientacaoFstPeca Este  (Peca (t) h)  = (Peca (t) h) == Peca (Rampa Oeste) h || (Peca (t) h) == Peca (Rampa Este) h  || (Peca (t) h) == Peca Recta h || (Peca (t) h) == Peca (Curva Este) h  || (Peca (t) h) == Peca (Curva Sul) h
auxOrientacaoFstPeca Norte (Peca (t) h)  = (Peca (t) h) == Peca (Rampa Norte) h || (Peca (t) h) == Peca (Rampa Sul) h   || (Peca (t) h) == Peca Recta h || (Peca (t) h) == Peca (Curva Norte) h || (Peca (t) h) == Peca (Curva Este) h
auxOrientacaoFstPeca Oeste (Peca (t) h)  = (Peca (t) h) == Peca (Rampa Oeste) h || (Peca (t) h) == Peca (Rampa Este) h  || (Peca (t) h) == Peca Recta h || (Peca (t) h) == Peca (Curva Oeste) h || (Peca (t) h) == Peca (Curva Norte) h
auxOrientacaoFstPeca Sul   (Peca (t) h)  = (Peca (t) h) == Peca (Rampa Sul) h   || (Peca (t) h) == Peca (Rampa Norte) h || (Peca (t) h) == Peca Recta h || (Peca (t) h) == Peca (Curva Sul) h   || (Peca (t) h) == Peca (Curva Oeste) h

{- | Esta função utiliza a função `auxOrientacaoFstPeca` para o mapa, devolvendo /True ou /False conforme a compatibilidade da orientação e da primeira peça -}
orientacaoFstPeca :: Mapa -> Bool
orientacaoFstPeca (Mapa (x,y) tb)= auxOrientacaoFstPeca y (pecaSearch x tb)

--------------------------------------------------------------------------------
-- Testa se os elementos da periferia do tabuleiro sao todos "Peca Lava 0"
--------------------------------------------------------------------------------

{- | Função auxiliar que verifica se se todas as peças da primeira linha são do tipo: /Peca Lava 0. -}
auxLinhaLava :: [Peca] -> Bool
auxLinhaLava [] = True
auxLinhaLava (x:xs) | x == Peca Lava 0 = auxLinhaLava xs
                    | otherwise = False

{- | Função que verifica se todas as pecas da primeira linha sao do tipo /Peca Lava 0. -}
primLinhaLava :: Tabuleiro -> Bool
primLinhaLava [] = True
primLinhaLava (x:xs) = auxLinhaLava x

{- | Função que verifica se todos os elementos da ultima linha do tabuleiro sao todos do tipo /Peca Lava 0. -}
ultLinhaLava :: Tabuleiro -> Bool
ultLinhaLava tab = auxLinhaLava (last tab)

{- | Função que verifica se todos os últimos elementos de cada linha são do tipo /Peca Lava 0. -}
pontaElemLava :: Tabuleiro -> Bool
pontaElemLava [] = True
pontaElemLava (x:xs) | head x == Peca Lava 0 && last x == Peca Lava 0 = pontaElemLava xs
                     | otherwise = False

{- | Função que utiliza `auxLinhaLava`, `primLinhaLava`, `ultLinhaLava`, `pontaElemLava` e devolve /True ou /False consoante todas as peças da periferia do tabuleiro sejam /Peca Lava 0 ou não. -}
periferiaLava :: Tabuleiro -> Bool
periferiaLava (x:xs) = a && b && c && d
                     where
                       a = primLinhaLava (x:xs)
                       b = ultLinhaLava (x:xs)
                       c = pontaElemLava (x:xs)
                       d = pontaElemLava (x:xs)

--------------------------------------------------------------------------------
-- Testar se lava tem altura zero
--------------------------------------------------------------------------------

{- | Função que verifica se a peca em questao e do tipo /Lava. -}
verificaTipo :: Peca -> Tipo
verificaTipo (Peca Lava h) = Lava
verificaTipo (Peca Recta h) = Recta
verificaTipo (Peca (Curva o) h) = Curva o
verificaTipo (Peca (Rampa o) h) = Rampa o

{- | Função que, caso a peca seja do tipo /Lava verifica se tem altura 0. -}
auxiliarLava :: [Peca] -> Bool
auxiliarLava [] = True
auxiliarLava (pc:pcs) = if verificaTipo pc == Lava
                       then pc == Peca Lava 0 && auxiliarLava pcs
                       else auxiliarLava pcs

{- | Função que utiliza `auxiliarLava` e testa se todas as pecas do tipo /Lava têm altura igual a 0. -}
testaLava :: Tabuleiro -> Bool
testaLava tbs = foldr ((&&) . auxiliarLava) True tbs

--------------------------------------------------------------------------------
-- Sera que se consegue dar uma volta completa e as peças são compativeis entre si (encaixam e altura bate certo)?
--------------------------------------------------------------------------------

{- | Função que recebendo a peça em questão assim como a orientação nesse mommento, devolve uma lista de peças seguintes possiveis. -}
pecasPossiveis :: Peca -> Orientacao -> [Peca]
pecasPossiveis (Peca (Curva Este) h) Este   = [Peca (Rampa Sul) h,Peca (Rampa Norte) (h-1),Peca (Curva Sul) h,Peca (Curva Oeste) h,Peca Recta h]
pecasPossiveis (Peca (Curva Sul) h)  Este   = [Peca (Rampa Norte) h,Peca (Rampa Sul) (h-1),Peca (Curva Norte) h,Peca (Curva Este) h,Peca Recta h]
pecasPossiveis (Peca (Rampa Este) h) Este   = [Peca (Rampa Este) (h+1),Peca (Rampa Oeste) h,Peca (Curva Este) (h+1),Peca (Curva Sul) (h+1),Peca Recta (h+1)]
pecasPossiveis (Peca t h)            Este   = [Peca (Rampa Este) h,Peca (Rampa Oeste) (h-1),Peca (Curva Este) h,Peca (Curva Sul) h,Peca Recta h]
pecasPossiveis (Peca (Curva Norte) h) Norte = [Peca (Rampa Este) h,Peca (Rampa Oeste) (h-1),Peca (Curva Este) h,Peca (Curva Sul) h,Peca Recta h]
pecasPossiveis (Peca (Curva Este) h)  Norte = [Peca (Rampa Oeste) h,Peca (Rampa Este) (h-1),Peca (Curva Oeste) h,Peca (Curva Norte) h,Peca Recta h]
pecasPossiveis (Peca (Rampa Norte) h) Norte = [Peca (Rampa Norte) (h+1),Peca (Rampa Sul) h,Peca (Curva Norte) (h+1),Peca (Curva Este) (h+1),Peca Recta (h+1)]
pecasPossiveis (Peca t h)             Norte = [Peca (Rampa Norte) h,Peca (Rampa Sul) (h-1),Peca (Curva Norte) h,Peca (Curva Este) h,Peca Recta h]
pecasPossiveis (Peca (Curva Oeste) h) Oeste = [Peca (Rampa Norte) h,Peca (Rampa Sul) (h-1),Peca (Curva Este) h,Peca (Curva Norte) h,Peca Recta h]
pecasPossiveis (Peca (Curva Norte) h) Oeste = [Peca (Rampa Sul) h,Peca (Rampa Norte) (h-1),Peca (Curva Sul) h,Peca (Curva Oeste) h,Peca Recta h]
pecasPossiveis (Peca (Rampa Oeste) h) Oeste = [Peca (Rampa Oeste) (h+1),Peca (Rampa Este) h,Peca (Curva Oeste) (h+1),Peca (Curva Norte) (h+1),Peca Recta (h+1)]
pecasPossiveis (Peca t h)             Oeste = [Peca (Rampa Oeste) h,Peca (Rampa Este) (h-1),Peca (Curva Oeste) h,Peca (Curva Norte) h,Peca Recta h]
pecasPossiveis (Peca (Curva Sul) h)   Sul   = [Peca (Rampa Este) h,Peca (Rampa Oeste) (h-1),Peca (Curva Norte) h,Peca (Curva Oeste) h,Peca Recta h]
pecasPossiveis (Peca (Curva Oeste) h) Sul   = [Peca (Rampa Oeste) h,Peca (Rampa Este) (h-1),Peca (Curva Sul) h,Peca (Curva Este) h,Peca Recta h]
pecasPossiveis (Peca (Rampa Sul) h)   Sul   = [Peca (Rampa Sul) (h+1),Peca (Rampa Norte) h,Peca (Curva Sul) (h+1),Peca (Curva Oeste) (h+1),Peca Recta (h+1)]
pecasPossiveis (Peca t h)             Sul   = [Peca (Rampa Sul) h,Peca (Rampa Norte) (h-1),Peca (Curva Sul) h,Peca (Curva Oeste) h,Peca Recta h]


{- | Função que recebendo o índice, orientação e peça atual, devolve um par com o índice e orientação seguintes. -}
proximaOrientacaoPosicao :: Posicao -> Orientacao -> Peca -> (Posicao, Orientacao)
proximaOrientacaoPosicao (x,y) Este (Peca t h)  | Peca t h == Peca Recta h = ((x+1,y),Este)
                                                | Peca t h == Peca (Curva Este) h = ((x,y+1),Sul)
                                                | Peca t h == Peca (Curva Sul) h = ((x,y-1),Norte)
                                                | Peca t h == Peca (Rampa Este) h = ((x+1,y),Este)
                                                | Peca t h == Peca (Rampa Oeste) h = ((x+1,y),Este)
proximaOrientacaoPosicao (x,y) Norte (Peca t h) | Peca t h == Peca Recta h = ((x,y-1),Norte)
                                                | Peca t h == Peca (Curva Norte) h = ((x+1,y),Este)
                                                | Peca t h == Peca (Curva Este) h = ((x-1,y),Oeste)
                                                | Peca t h == Peca (Rampa Norte) h = ((x,y-1),Norte)
                                                | Peca t h == Peca (Rampa Sul) h = ((x,y-1),Norte)
proximaOrientacaoPosicao (x,y) Oeste (Peca t h) | Peca t h == Peca Recta h = ((x-1,y),Oeste)
                                                | Peca t h == Peca (Curva Oeste) h = ((x,y-1),Norte)
                                                | Peca t h == Peca (Curva Norte) h = ((x,y+1),Sul)
                                                | Peca t h == Peca (Rampa Oeste) h = ((x-1,y),Oeste)
                                                | Peca t h == Peca (Rampa Este) h = ((x-1,y),Oeste)
proximaOrientacaoPosicao (x,y) Sul   (Peca t h) | Peca t h == Peca Recta h = ((x,y+1),Sul)
                                                | Peca t h == Peca (Curva Sul) h = ((x-1,y),Oeste)
                                                | Peca t h == Peca (Curva Oeste) h = ((x+1,y),Este)
                                                | Peca t h == Peca (Rampa Sul) h = ((x,y+1),Sul)
                                                | Peca t h == Peca (Rampa Norte) h = ((x,y+1),Sul)
proximaOrientacaoPosicao _ o _                  = ((0,0),o)

{- | Função que recebe um índice e devolve a peça que está nessa posição no tabuleiro. -}
pecaSearch :: Posicao -> Tabuleiro -> Peca
pecaSearch (0,0) (lp:lps) = head lp
pecaSearch (x,y) (lp:lps) | x == 0 && y == 0 = head lp
                          | y > 0 = pecaSearch (x,y-1) lps
                          | x > 0 = pecaSearch (x-1,y) (tail lp:lps)


{- | Função que utiliza `proximaOrientacaoPosicao` e `pecasPossiveis`, recebe uma peça, uma posição, uma orientação e testa se a peça seguinte consta da lisa de peças possíveis nessas condições. -}
testaPecaSeguinte :: Peca -> Posicao -> Orientacao -> Tabuleiro -> Bool
testaPecaSeguinte pc x o tb = pecaSearch b tb `elem` c
                            where
                              (b,d) = proximaOrientacaoPosicao x o pc
                              c = pecasPossiveis pc o

{- | Função que utiliza `testaPecaSeguinte`, `proximaOrientacaoPosicao`, recebe a posicao inicial, a orientacao inicial, o tabuleiro e uma lista de posicoes, e testa se todas essas peças são compativeis entre si. -}
testaPecasSeguintes :: Posicao -> Orientacao -> Tabuleiro -> [Posicao] -> Bool
testaPecasSeguintes _ _ _ [] = True
testaPecasSeguintes (0,0) _ _ _ = False
testaPecasSeguintes x o tb (d:ds) | testaPecaSeguinte a d o tb = testaPecasSeguintes b c tb ds
                                  | otherwise = False
                                 where
                                   a = pecaSearch x tb
                                   (b,c) = proximaOrientacaoPosicao x o a

{- | Função que utiliza `pecaSearch`, `indicesPercurso`, `proximaOrientacaoPosicao` e recebe uma lista de pares : /Posição, Orientação, uma posição, uma orientação e um tabuleiro, devolvendo uma lista de pares com os índices do percurso e as orientações correspondentes a cada índice. -}
indicesPercurso :: [(Posicao,Orientacao)] -> Posicao -> Orientacao -> Tabuleiro -> [(Posicao,Orientacao)]
indicesPercurso l x o tb | null l  = indicesPercurso [(x,o)] a b tb
                         | x == fst (head l) && o == snd (head l) = l
                         | x == (0,0) = l
                         | otherwise = indicesPercurso (l ++ [(x,o)]) a b tb
                        where
                          (a,b) = proximaOrientacaoPosicao x o c
                          c = pecaSearch x tb

{- | Função que utiliza `testaPecasSeguintes`, `indicesPercurso`, recebe um mapa e retorna /True ou /False em função de ser possível chegar à peça incial com a orientação inicial ou não -}
testaPercurso :: Mapa -> Bool
testaPercurso (Mapa (x,o) tb) = testaPecasSeguintes x o tb (d:ds)
                             where
                               (d:ds) = map fst (indicesPercurso [] x o tb)

--------------------------------------------------------------------------------
-- Verificar se o que não é percurso é Lava
--------------------------------------------------------------------------------

{- | Função que retorna o maior índice do tabuleiro. -}
indiceMaximo :: Tabuleiro -> Posicao
indiceMaximo (lp:lps) = (a,b)
                    where
                      a = length lp - 1
                      b = length (lp:lps) - 1

{- | Função que utiliza `indiceMaximo`, `indicesPercurso` e retorna a lista dos índices das posições no mapa que não constam da lista de índices do percurso. -}
indicesNotPercurso :: Mapa -> [Posicao]
indicesNotPercurso (Mapa (p,o) tb) = [(x,y) | x <- [1..(a-1)], y <- [1..(b-1)]] \\ c
                                  where
                                    (a,b) = indiceMaximo tb
                                    c = map fst (indicesPercurso [] p o tb)

{- | Função auxiliar de `verificaNotPercurso` que ultiliza `pecaSearch` e retorna a lista das peças que se encontram nos índices devolvidos por /indicesNotPercurso. -}
verificaNotPercursoAux :: Tabuleiro -> [Posicao] -> [Peca]
verificaNotPercursoAux _ [] = []
verificaNotPercursoAux tb (p:ps) = pecaSearch p tb : verificaNotPercursoAux tb ps

{- | Função que ultiliza `indicesNotPercurso`, `verificaNotPercursoAux` e testa se todas as peças que não pertencem ao percurso principal são do tipo /Peca Lava 0. -}
verificaNotPercurso :: Mapa -> Bool
verificaNotPercurso (Mapa (p,o) tb) = and c
                                  where
                                    a = indicesNotPercurso (Mapa (p,o) tb)
                                    b = verificaNotPercursoAux tb a
                                    c = map (== Peca Lava 0) b

--------------------------------------------------------------------------------
--- Função final
--------------------------------------------------------------------------------

{- | A função constroi recebe um /Mapa e devolve a /True ou /False consoante a sua validade. Sendo por isso, a função objeitvo da Tarefa 2. -}
valida :: Mapa -> Bool
valida (Mapa (p,o) tb) = a && b && c && d && e
                      where
                        a = orientacaoFstPeca (Mapa (p,o) tb)
                        b = periferiaLava tb
                        c = testaLava tb
                        d = testaPercurso (Mapa (p,o) tb)
                        e = verificaNotPercurso (Mapa (p,o) tb)
