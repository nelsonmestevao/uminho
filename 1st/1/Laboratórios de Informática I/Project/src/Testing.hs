{-|
Module      : Testing
Description : Conjuntos de Casos de Teste
Copyright   : Nelson Estevão <a76434@alunos.uminho.pt>;
            : Pedro Ribeiro  <a85493@alunos.uminho.pt>;

Módulo para a realização de Testes do Projeto de LI1 em 2017/18.
-}
module Testing where

import LI11718

{-|
Os testes a serem considerados pelo sistema de /feedback/
para a função 'atualiza'.
-}
tu01, tu02, tu03, tu04, tu05, tu06, tu07, tu08, tu09, tu10, tu11, tu12, tu13, tu14, tu15, tu16, tu17, tu18, tu19, tu20, tu21, tu22 :: (Tempo,Jogo,Acao)
tu01 = (1,j01,ac01)
tu02 = (1,j02,ac01)
tu03 = (1,j03,ac01)
tu04 = (1,j01,ac06)
tu05 = (1,j02,ac06)
tu06 = (1,j03,ac06)
tu07 = (1,j01,ac07)
tu08 = (1,j02,ac07)
tu09 = (1,j03,ac07)
tu10 = (1,j01,ac17)
tu11 = (1,j02,ac17)
tu12 = (1,j03,ac17)
tu13 = (1,j01,ac18)
tu14 = (1,j02,ac18)
tu15 = (1,j03,ac18)
tu16 = (1,j04,ac19)
tu17 = (5,j05,ac17)
tu18 = (5,j06,ac18)
tu19 = (5,j07,ac19)
tu20 = (4,j08,ac19)
tu21 = (9,j09,ac12)
tu22 = (2,j10,ac17)

{-|
__Jogos__ de Teste.
-}
j01, j02, j03, j04, j05, j06, j07, j08, j09, j10 :: Jogo
j01 = Jogo m01 terra   cs01 n01 h01
j02 = Jogo m01 gelo    cs01 n01 h01
j03 = Jogo m01 asfalto cs01 n01 h01
j04 = Jogo m01 terra   cs01 n03 h01
j05 = Jogo m01 gelo    cs01 n04 h02
j06 = Jogo m01 asfalto cs01 n04 h02
j07 = Jogo m02 terra   cs02 n04 h02
j08 = Jogo m02 gelo    cs02 n03 h02
j09 = Jogo m02 asfalto cs02 n03 h02
j10 = Jogo m01 terra   cs01 n02 h02


{-|
__Mapas__ de Teste.
-}
m01, m02 :: Mapa
m01 = Mapa ((2,1),Este) tb02
m02 = Mapa ((1,2),Este) tb03
-- m03 = Mapa ((1,2),Este) tb01
-- m04 = Mapa ((2,1),Este) tb04
-- m05 = Mapa ((2,1),Este) tb05
-- m06 = Mapa ((2,1),Este) tb06
-- m07 = Mapa ((2,1),Este) tb07
-- m08 = Mapa ((2,1),Este) tb08
-- m09 = Mapa ((2,1),Este) tb09
-- m10 = Mapa ((2,1),Este) tb10
-- m11 = Mapa ((2,1),Este) tb11
-- m12 = Mapa ((2,1),Este) tb12
-- m13 = Mapa ((2,1),Este) tb13
-- m14 = Mapa ((2,1),Este) tb14
-- m15 = Mapa ((2,1),Este) tb15
-- m16 = Mapa ((2,1),Este) tb16

{-|
__Ações__ de Teste.
-}
ac01, ac06, ac07, ac12, ac17, ac18, ac19 :: Acao
ac01 = Acao { acelerar = True,  travar = True,  esquerda = True,  direita  = True,  nitro = Nothing }
-- ac02 = Acao { acelerar = True,  travar = True,  esquerda = True,  direita  = False, nitro = Nothing }
-- ac03 = Acao { acelerar = True,  travar = True,  esquerda = False, direita  = True,  nitro = Nothing }
-- ac04 = Acao { acelerar = True,  travar = True,  esquerda = False, direita  = False, nitro = Nothing }
-- ac05 = Acao { acelerar = True,  travar = False, esquerda = True,  direita  = True,  nitro = Nothing }
ac06 = Acao { acelerar = True,  travar = False, esquerda = True,  direita  = False, nitro = Nothing }
ac07 = Acao { acelerar = True,  travar = False, esquerda = False, direita  = True,  nitro = Nothing }
-- ac08 = Acao { acelerar = True,  travar = False, esquerda = False, direita  = False, nitro = Nothing }
-- ac09 = Acao { acelerar = False, travar = True,  esquerda = True,  direita  = True,  nitro = Nothing }
-- ac10 = Acao { acelerar = False, travar = True,  esquerda = True,  direita  = False, nitro = Nothing }
-- ac11 = Acao { acelerar = False, travar = True,  esquerda = False, direita  = True,  nitro = Nothing }
ac12 = Acao { acelerar = False, travar = True,  esquerda = False, direita  = False, nitro = Nothing }
-- ac13 = Acao { acelerar = False, travar = False, esquerda = True,  direita  = True,  nitro = Nothing }
-- ac14 = Acao { acelerar = False, travar = False, esquerda = True,  direita  = False, nitro = Nothing }
-- ac15 = Acao { acelerar = False, travar = False, esquerda = False, direita  = True,  nitro = Nothing }
-- ac16 = Acao { acelerar = False, travar = False, esquerda = False, direita  = False, nitro = Nothing }
ac17 = Acao { acelerar = True,  travar = False, esquerda = True,  direita  = False, nitro = Just 1  }
ac18 = Acao { acelerar = True,  travar = False, esquerda = False, direita  = True,  nitro = Just 1  }
ac19 = Acao { acelerar = True,  travar = False, esquerda = False, direita  = True,  nitro = Just 0  }


{-|
__Propriedades__ de Teste.
-}
terra, gelo, asfalto :: Propriedades
terra   = Propriedades 2 3 4 2 15 180
gelo    = Propriedades 0.3 0.4 2 1.5 15 270
asfalto = Propriedades 4 5 8 4 10 120


{-|
__Tabuleiros__ de Teste.
-}
tb02, tb03 :: Tabuleiro
-- tb01 = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca (Rampa Este) 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
tb02 = [[Peca Lava 0,Peca Lava 0            ,Peca Lava 0 ,Peca Lava 0        ,Peca Lava 0]
       ,[Peca Lava 0,Peca (Curva Norte) 0   ,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0]
       ,[Peca Lava 0,Peca (Rampa Sul) 0     ,Peca Lava 0 ,Peca (Rampa Sul) 0 ,Peca Lava 0]
       ,[Peca Lava 0,Peca (Curva Oeste) 1   ,Peca Recta 1,Peca (Curva Sul) 1 ,Peca Lava 0]
       ,[Peca Lava 0,Peca Lava 0            ,Peca Lava 0 ,Peca Lava 0        ,Peca Lava 0]
        ]
tb03 = [[Peca Lava 0,Peca Lava 0         ,Peca Lava 0        ,Peca Lava 0 ,Peca Lava 0 ,Peca Lava 0         ,Peca Lava 0        ,Peca Lava 0]
       ,[Peca Lava 0,Peca (Curva Este) 0 ,Peca Lava 0        ,Peca Lava 0 ,Peca Lava 0 ,Peca (Rampa Oeste) 1,Peca (Curva Este) 1,Peca Lava 0]
       ,[Peca Lava 0,Peca (Curva Oeste) 0,Peca (Rampa Este) 0,Peca Recta 1,Peca Recta 1,Peca (Curva Este) 1 ,Peca Recta 1       ,Peca Lava 0]
       ,[Peca Lava 0,Peca Lava 0         ,Peca Lava 0        ,Peca Lava 0 ,Peca Lava 0 ,Peca (Rampa Norte) 0,Peca (Rampa Sul) 0 ,Peca Lava 0]
       ,[Peca Lava 0,Peca Lava 0         ,Peca Lava 0        ,Peca Lava 0 ,Peca Lava 0 ,Peca (Curva Oeste) 0,Peca (Curva Sul) 0 ,Peca Lava 0]
       ,[Peca Lava 0,Peca Lava 0         ,Peca Lava 0        ,Peca Lava 0 ,Peca Lava 0 ,Peca Lava 0         ,Peca Lava 0        ,Peca Lava 0]
       ]
-- tb04 = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) 0,Peca (Rampa Este) 0,Peca (Curva Este) 1,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) 1,Peca (Rampa Este) 1,Peca Recta 2,Peca Recta 2,Peca (Curva Este) 2,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Rampa Norte) 1,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) 1,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
-- tb05 = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca Recta 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Recta 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Curva Sul) 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
-- tb06 = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Recta 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca Recta 0,Peca Recta 0,Peca Recta 0,Peca (Curva Sul) 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Curva Sul) 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
-- tb07 = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca Recta 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Recta 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca Recta 0,Peca Recta 0,Peca (Curva Sul) 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
-- tb08 = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 2,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Norte) 1,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 1,Peca Lava 0,Peca (Rampa Sul) 1,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 2,Peca Recta 2,Peca (Curva Sul) 2,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
-- tb09 = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Recta 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Curva Sul) 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 1]]
-- tb10 = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Rampa Este) 1,Peca (Curva Este) 2,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta 2,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta 2,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Rampa Este) 1,Peca (Curva Sul) 2,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
-- tb11 = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
-- tb12 = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca Recta 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Curva Sul) 0,Peca Recta 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca Recta 0,Peca Recta 0,Peca (Curva Sul) 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
-- tb13 = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca Recta 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0,Peca Recta 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Recta 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Recta 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Curva Sul) 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
-- tb14 = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Recta 0,Peca (Curva Norte) 0,Peca Recta 0,Peca Recta 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0,Peca Recta 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Recta 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Recta 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Curva Sul) 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
-- tb15 = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Recta 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Recta 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca (Curva Norte) 0,Peca (Curva Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca (Curva Sul) 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
-- tb16 = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca (Curva Norte) 0,Peca (Curva Este) 0,Peca Recta 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Recta 0,Peca Recta 0,Peca Recta 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Recta 0,Peca Recta 0,Peca (Curva Sul) 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Curva Sul) 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]


{-|
__Carros__ de Teste.
-}
car01, car02, car03, car04, car05, car06, car07, car08 :: Carro
car01 = Carro { posicao = (2.5,1.5), direcao = 40, velocidade = ( 2.0, 1.0) }
car02 = Carro { posicao = (3.5,2.5), direcao = 40, velocidade = ( 2.0, 1.0) }
car03 = Carro { posicao = (3.5,3.5), direcao = 40, velocidade = ( 2.0, 1.0) }
car04 = Carro { posicao = (1.5,2.5), direcao = 40, velocidade = ( 2.0, 1.0) }
car05 = Carro { posicao = (2.5,2.2), direcao = 95, velocidade = (-0.8, 0.4) }
car06 = Carro { posicao = (5.3,5.7), direcao = 95, velocidade = (-0.8, 0.4) }
car07 = Carro { posicao = (6.1,5.8), direcao = 95, velocidade = (-0.8, 0.4) }
car08 = Carro { posicao = (5.4,1.5), direcao = 95, velocidade = (-0.8, 0.4) }
-- car09 = Carro { posicao = (5.5,2.0), direcao = 40, velocidade = (-6.5, 3.4) }
-- car10 = Carro { posicao = (5.5,2.0), direcao = 40, velocidade = ( 6.5,-3.4) }
-- car11 = Carro { posicao = (5.5,2.0), direcao = 40, velocidade = (-6.5,-3.4) }
-- car12 = Carro { posicao = (5.5,2.0), direcao = 40, velocidade = (-0.6, 0.1) }
-- car13 = Carro { posicao = (5.5,2.0), direcao = 95, velocidade = (-6.5, 3.4) }
-- car14 = Carro { posicao = (5.5,2.0), direcao = 95, velocidade = ( 6.5,-3.4) }
-- car15 = Carro { posicao = (5.5,2.0), direcao = 95, velocidade = (-6.5,-3.4) }
-- car16 = Carro { posicao = (5.5,2.0), direcao = 95, velocidade = (-0.6, 0.1) }


{-|
__Lista de Carros__ de Teste.
-}
cs01, cs02 :: [Carro]
cs01 = [car01,car02,car03,car04]
cs02 = [car05,car06,car07,car08]
-- cs03 = [car01,car05,car05,car05]
-- cs04 = [car01,car05,car05,car05]
-- cs05 = [car01,car02,car04]
-- cs06 = [car05,car01,car04]
-- cs07 = [car02,car05,car03]
-- cs08 = [car04,car01,car02]

{-|
__Lista de Históricos__ de Teste.
-}
h01, h02 :: [[Posicao]]
h01 = [[],[],[],[]]
h02 = [[(2,1),(2,2)], [(2,1),(2,2)], [(2,1),(2,2)], [(2,1),(2,2)]]
-- h03 = [[(2,1)], [(2,1),(3,2)], [(2,3),(2,2)], [(2,1),(2,2),(3,1)]]
-- h04 = [[(2,1)], [(2,1)], [(1,3),(2,2)], [(2,1),(2,2),(3,1)]]
-- h05 = [[],[],[]]
-- h06 = [[(2,1),(2,2)], [(2,1),(2,2)], [(2,1),(2,2)]]
-- h07 = [[(2,1)], [(2,3),(2,2)], [(2,1),(2,2),(3,1)]]
-- h08 = [[(2,1)], [(2,3)], [(2,1),(2,2),(3,1)]]


{-|
__Lista de Nitros__ de Teste.
-}
n01, n02, n03, n04 :: [Tempo]
-- n0i = [ 1, 1, 1, 1]
n01 = [ 0, 0, 0, 0]
n02 = [ 5, 5, 5, 5]
n03 = [10,10,10,10]
n04 = [15,15,15,15]
-- n05 = [ 0, 0, 0]
-- n06 = [ 5, 5, 5]
-- n07 = [10,10,10]
-- n08 = [15,15,15]
