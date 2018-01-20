{- |
Module      : Tarefa1_2017li1g138
Description : Construir Mapas
Copyright   : Nelson Estevão <a76434@alunos.uminho.pt>;
            : Pedro Ribeiro  <a85493@alunos.uminho.pt>;

Módulo para a realização da Tarefa 1 de LI1 em 2017/18.
-}

module Tarefa1_2017li1g138 where

import LI11718
import Testing

{-|
Os testes a serem considerados pelo sistema de /feedback/
para a função 'constroi'.
-}
testesT1 :: [Caminho]
testesT1 = [cm01,cm02,cm03,cm04,cm05,cm06,cm07,cm08,cm09,cm10,cm11,cm12,cm13,cm14,cm15,cm16]

{-|
__Caminhos__ de Teste.
-}
cm01, cm02, cm03, cm04, cm05, cm06, cm07, cm08, cm09, cm10, cm11, cm12, cm13, cm14, cm15, cm16 :: Caminho
cm01 = [Avanca,CurvaDir,Sobe,CurvaDir,Avanca,CurvaDir,Desce,CurvaDir]
cm02 = [CurvaDir,Avanca,Avanca,CurvaDir,CurvaEsq,CurvaDir,CurvaDir,Avanca,Avanca,Avanca,CurvaDir,Avanca]
cm03 = [CurvaDir,CurvaEsq,Sobe,Avanca,Avanca,CurvaDir,Desce,CurvaEsq]
cm04 = [Avanca,Avanca,CurvaDir,Avanca,Avanca,CurvaDir,Avanca,Avanca,CurvaDir,Avanca,Avanca,CurvaDir]
cm05 = [Avanca,Avanca,CurvaDir,Avanca,Avanca,CurvaDir,Avanca,Avanca,Avanca,CurvaEsq,Avanca,Avanca,Avanca,CurvaEsq,Avanca,Avanca,CurvaEsq,Avanca,CurvaEsq,Avanca,CurvaDir,Avanca,Avanca,Avanca,Avanca,CurvaDir]
cm06 = [Avanca,Avanca,CurvaDir,Sobe,CurvaDir,CurvaEsq,Avanca,CurvaDir,Avanca,Avanca,CurvaDir,Avanca,CurvaDir,CurvaEsq,Desce,CurvaDir]
cm07 = [Avanca,Avanca,CurvaDir,Avanca,Avanca,Desce,Desce,Desce,CurvaDir,CurvaEsq,Avanca,CurvaEsq,CurvaDir,Avanca,CurvaEsq,Avanca,Avanca,CurvaDir,CurvaDir,Avanca,Avanca,Avanca,Avanca,Avanca,CurvaDir,Avanca,Avanca,Avanca,CurvaDir,CurvaEsq,CurvaEsq,Sobe,CurvaDir,Sobe,Avanca,Sobe,Avanca,Avanca,Avanca,Avanca,CurvaDir,Avanca,CurvaDir,CurvaDir,CurvaEsq,CurvaEsq]
cm08 = [Avanca,CurvaDir,Sobe,CurvaDir,Avanca,CurvaDir,Desce,CurvaDir,Sobe,CurvaDir,Avanca,CurvaDir]
cm09 = [Avanca,CurvaDir,Sobe,CurvaDir,Avanca,CurvaDir,Desce,Avanca,Avanca,Avanca,CurvaEsq,Desce,CurvaEsq,Avanca,CurvaEsq,Sobe,CurvaEsq,Desce]
cm10 = [Avanca,CurvaDir,Sobe,Sobe,Sobe,CurvaDir,Avanca,CurvaDir,Desce,Desce,Desce,Avanca,Desce,Desce,Desce,CurvaEsq,Avanca,CurvaEsq,Sobe,Sobe,Sobe,CurvaEsq,Avanca]
cm11 = [Sobe,Desce,Sobe,Desce,CurvaDir,Avanca,CurvaEsq]
cm12 = [Avanca,CurvaDir,Sobe,CurvaDir,Avanca,CurvaDir,Desce,CurvaDir,Sobe,CurvaDir,Avanca,CurvaDir]
cm13 = [Avanca,CurvaDir,Sobe,CurvaDir,Avanca,CurvaDir,Desce,CurvaDir]
cm14 = [Avanca,Avanca, CurvaDir, Avanca, Avanca, CurvaEsq, Avanca, Avanca, CurvaDir, CurvaDir, Avanca, Avanca, Avanca, Avanca, Avanca, CurvaDir, Avanca, Avanca, Avanca, CurvaDir]
cm15 = [Avanca,Avanca, CurvaDir, Avanca, Avanca,Desce,Desce,Desce,CurvaDir,CurvaEsq,Avanca,CurvaEsq,CurvaDir,Avanca, CurvaEsq, Avanca, Avanca, CurvaDir, CurvaDir, Avanca, Avanca, Avanca, Avanca, Avanca, CurvaDir, Avanca, Avanca, Avanca, CurvaDir,CurvaEsq, CurvaEsq, Sobe, CurvaDir,Sobe,Avanca,Sobe,Avanca,Avanca, Avanca,Avanca,CurvaDir,Avanca,CurvaDir,CurvaDir,CurvaEsq,CurvaEsq]
cm16 = [Avanca,Avanca,CurvaDir,Sobe,CurvaDir,CurvaEsq,Avanca,CurvaDir,Avanca,Avanca,CurvaDir,Avanca,CurvaDir,CurvaEsq,Desce,CurvaDir]


--------------------------------------------------------------------------------
-- Etapa 1 --
--------------------------------------------------------------------------------

{- | Função que gera um /Tabuleiro/ só com peças do tipo lava. Para tal recebe apenas um /Caminho/,
usando duas funções auxiliares, `auxiliarConstroiBaseColunas` e `auxiliarConstroiBaseLinhas`. -}
constroiTabuleiroBase :: Caminho -> Tabuleiro
constroiTabuleiroBase c = y
                        where
                          x = auxiliarConstroiBaseColunas (fst d)
                          y = auxiliarConstroiBaseLinhas (snd d) x
                          d = dimensao c

{- | Função que  dado um número de colunas, gera uma linha com esse número de elementos. -}
auxiliarConstroiBaseColunas :: Int -> [Peca]
auxiliarConstroiBaseColunas 0 = []
auxiliarConstroiBaseColunas x = Peca Lava 0:auxiliarConstroiBaseColunas (x-1)

{- | Função que dado um número /(y)/ de linhas e uma linha (lista de peças), replica essa linha /y/ vezes. -}
auxiliarConstroiBaseLinhas :: Int -> [Peca] -> Tabuleiro
auxiliarConstroiBaseLinhas 0 (x:xs) = []
auxiliarConstroiBaseLinhas y (x:xs) = (x:xs): auxiliarConstroiBaseLinhas (y-1) (x:xs)

--------------------------------------------------------------------------------
-- Etapa 2 --
--------------------------------------------------------------------------------

{- | Função que recebendo um /Caminho/ e uma /Altura/ inicial, retorna a lista de alturas que as peças do percurso irão tomar. -}
listaAlturas :: Caminho -> Altura -> [Altura]
listaAlturas [] _ = []
listaAlturas (p:ps) h | p == Desce = (h-1):listaAlturas ps (h-1)
                      | p == Sobe  = h:listaAlturas ps (h+1)
                      | otherwise  = h:listaAlturas ps h

{- | Função que recebe uma orientação atual e consoante o próximo /Passo/ retorna a nova /Orientacao/ atual. -}
auxiliarOrientacoes :: Passo -> Orientacao -> Orientacao
auxiliarOrientacoes p Norte | p == CurvaDir = Este
                            | p == CurvaEsq = Oeste
auxiliarOrientacoes p Este  | p == CurvaDir = Sul
                            | p == CurvaEsq = Norte
auxiliarOrientacoes p Sul   | p == CurvaDir = Oeste
                            | p == CurvaEsq = Este
auxiliarOrientacoes p Oeste | p == CurvaDir = Norte
                            | p == CurvaEsq = Sul
auxiliarOrientacoes p o = o

{- | Função que recebe o /Caminho/ geral e a orientação inical, resultando numa lista com todas as orientações de cada peça do percurso. Para tal usa a `auxiliarOrientacoes` e a `listaOrientacoes` -}
listaOrientacoes :: Caminho -> Orientacao -> [Orientacao]
listaOrientacoes [] _ = []
listaOrientacoes (p:ps) o = auxiliarOrientacoes p o: listaOrientacoes ps (auxiliarOrientacoes p o)

{- | Função que recebe a orientação que o /Passo/ que irá tomar, assim como a altura, retornando a peça correspondente a tal movimento. -}
auxiliarListaPecas :: Orientacao -> Passo -> Altura -> Peca
auxiliarListaPecas Este  p h | p == Desce = Peca (Rampa Oeste) h
                             | p == CurvaEsq = Peca (Curva Sul) h
auxiliarListaPecas Norte p h | p == Desce = Peca (Rampa Sul) h
                             | p == CurvaEsq = Peca (Curva Este) h
auxiliarListaPecas Oeste p h | p == Desce = Peca (Rampa Este) h
                             | p == CurvaEsq = Peca (Curva Norte) h
auxiliarListaPecas Sul   p h | p == Desce = Peca (Rampa Norte) h
                             | p == CurvaEsq = Peca (Curva Oeste) h
auxiliarListaPecas o     p h | p == Avanca = Peca Recta h
                             | p == Sobe = Peca (Rampa o) h
                             | p == CurvaDir = Peca (Curva o) h


{- | Função que recebendo a lista de orientações que vai tomar, de acordo com o /Caminho/ fornecido, e a altura inicial, retorna a lista de peças que representam esse /Caminho/. -}
auxiliarListaPecas2 :: [Orientacao] -> Caminho -> [Altura] -> [Peca]
auxiliarListaPecas2 [] _ _ = []
auxiliarListaPecas2 _ [] _ = []
auxiliarListaPecas2 (o:os) (p:ps) (a:as) = auxiliarListaPecas o p a : auxiliarListaPecas2 os ps as

{- | Função que recebendo a lista de orientacções a tomar, a lista de alturas a tomar, devolve a lista de peças resultantes. Para tal utiliza as funções `auxiliarListaPecas` e `auxiliarListaPecas2`. -}
listaPecas :: [Orientacao] -> Caminho -> [Altura] -> [Peca]
listaPecas [] _ _ = []
listaPecas _ [] _ = []
listaPecas (o:os) (p:ps) (a:as) = auxiliarListaPecas Este p a : auxiliarListaPecas2 (o:os) ps as

--------------------------------------------------------------------------------
-- Etapa 3 --
--------------------------------------------------------------------------------

{- | Função que recebe um índice matricial e uma orientação, retorna o índice seguinte. -}
auxiliarListaIndices :: Posicao -> Orientacao -> Posicao
auxiliarListaIndices (x,y) Norte = (x,y-1)
auxiliarListaIndices (x,y) Sul   = (x,y+1)
auxiliarListaIndices (x,y) Este  = (x+1,y)
auxiliarListaIndices (x,y) Oeste = (x-1,y)

{- | Função que gera a partir das Orientações tomadas por um caminho
e a posição inicial, gera a lista das posições tomadas por esse caminho. -}
listaIndices :: [Orientacao] -> Posicao -> [Posicao]
listaIndices [] _ = []
listaIndices (o:os) (x,y) = (x,y):listaIndices os p
                          where
                            p = auxiliarListaIndices (x,y) o

{- | Função que recebe uma peça, a posição em que se quer essa peça, e substitui-a no tabuleiro dado. -}
auxiliarConstroiTabuleiro :: Peca -> Posicao -> Tabuleiro -> Tabuleiro
auxiliarConstroiTabuleiro pec (x,y) ((pc:pcs):tbs) | y == 0 && x == 0 = (pec:pcs):tbs
                                                   | y >  0           = (pc:pcs):auxiliarConstroiTabuleiro pec (x,y-1) tbs
                                                   | x >  0           = inserir pc (auxiliarConstroiTabuleiro pec (x-1,y) (pcs:tbs))
                                                  where
                                                    inserir x ((y:ys):resto) = (x:y:ys):resto

{- | Função que recebendo uma lista de peças do percurso, e as posições
 a que correspondem substitui no tabuleiro dado cada um delas. -}
constroiTabuleiro :: [Peca] -> [Posicao] -> Tabuleiro -> Tabuleiro
constroiTabuleiro [] _ tbs = tbs
constroiTabuleiro (pec:pecs) ((x,y):xys) tbs = constroiTabuleiro pecs xys (auxiliarConstroiTabuleiro pec (x,y) tbs)


{- | A função `constroi`, recebe um /Caminho/ e gera um __/Mapa/__. Sendo por isso, a /Função Objetivo/ da __Tarefa 1__. -}
constroi :: Caminho -> Mapa
constroi c = Mapa ((x,y),o) tb
          where
            (x,y) = partida c
            o     = dirInit
            os    = listaOrientacoes c o
            a     = altInit
            as    = listaAlturas c a
            xsys  = listaIndices os (x,y)
            pcs   = listaPecas os c as
            tbB   = constroiTabuleiroBase c
            tb    = constroiTabuleiro pcs xsys tbB
