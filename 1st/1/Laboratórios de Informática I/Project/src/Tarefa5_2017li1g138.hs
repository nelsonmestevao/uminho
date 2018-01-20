{-|
Module      : Tarefa5_2017li1g138
Description : Implementação do Jogo em Gloss
Copyright   : Nelson Estevão <a76434@alunos.uminho.pt>;
            : Pedro Ribeiro  <a85493@alunos.uminho.pt>;

Módulo para a realização da Tarefa 5 de LI1 em 2017/18.
-}

module Main where

import LI11718
import Graphics.Gloss                      -- interface gloss
import Graphics.Gloss.Data.Picture         -- importar o tipo Picture
import Graphics.Gloss.Interface.Pure.Game  -- importar o tipo Event
import Tarefa1_2017li1g138
import Tarefa4_2017li1g138
import Tarefa3_2017li1g138
import Tarefa6_2017li1g138
import Testing


{-|
Função principal usada para animar um jogo completo.
Compilar com o GHC.
-}
main :: IO ()
main = do reta         <- loadBMP "pictures/reta.bmp"
          lava         <- loadBMP "pictures/lava.bmp"
          curva        <- loadBMP "pictures/curva.bmp"
          rampa        <- loadBMP "pictures/rampa.bmp"
          carro        <- loadBMP "pictures/carro.bmp"
          carro2       <- loadBMP "pictures/carro2.bmp"
          menuState    <- loadBMP "pictures/menuState.bmp"
          creditsState <- loadBMP "pictures/creditsState.bmp"
          singleplayer <- loadBMP "pictures/singleButton.bmp"
          multiplayer  <- loadBMP "pictures/multiplayerButton.bmp"
          credits      <- loadBMP "pictures/creditsButton.bmp"
          mapa1        <- loadBMP "pictures/pista1.bmp"
          mapa2        <- loadBMP "pictures/pista2.bmp"
          mapa3        <- loadBMP "pictures/pista3.bmp"
          mapa4        <- loadBMP "pictures/pista4.bmp"
          play window
               black
               frameRate
               (inicialState (initJogos) ([reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4]) (initAcoes) (1))
               drawState
               reactEvent
               reactTime

-------------------------------------------------------------------------------
----- AUTÓDROMOS ---------------------------------------------------------------
--------------------------------------------------------------------------------

{- | Pista que é a primeira opção do menu. -}
autodromo1 :: Mapa
autodromo1 = constroi [Avanca,CurvaDir,Avanca,CurvaDir,Avanca,CurvaDir,Avanca,CurvaDir]

{- | Pista que é a segunda opção do menu. -}
autodromo2 :: Mapa
autodromo2 = constroi [Avanca,Sobe,Sobe,Avanca,CurvaDir,CurvaDir,CurvaEsq,CurvaDir,Avanca,Desce,Desce,Avanca,CurvaDir,Avanca,CurvaDir,Avanca]

{- | Pista que é a terceira opção do menu. -}
autodromo3 :: Mapa
autodromo3 = constroi [Avanca,CurvaDir,Avanca,CurvaDir,Avanca,CurvaDir,Avanca,Avanca,Avanca,CurvaEsq,Avanca,CurvaEsq,Avanca,CurvaEsq,Avanca]

{- | Pista que é a quarta opção do menu. -}
autodromo4 :: Mapa
autodromo4 = constroi [Avanca,CurvaDir,CurvaEsq,CurvaDir,Sobe,Sobe,CurvaEsq,Avanca,CurvaDir,Desce,CurvaDir,Desce,Avanca,CurvaDir,Avanca,Avanca,Avanca,CurvaEsq,Avanca,CurvaDir,Avanca,CurvaDir]

{- | Primeiro carro da lista incial de carros. -}
listaCarros1 :: [Carro]
listaCarros1 = [(Carro (2.0,1.2) 0 (0,0)),(Carro (2.0,1.8) 0 (0,0))]

{- | Segundo carro da lista incial de carros. -}
listaCarros2 :: [Carro]
listaCarros2 = [(Carro (3.0,1.2) 0 (0,0)),(Carro (3.0,1.8) 0 (0,0))]

{- | Terceiro carro da lista incial de carros. -}
listaCarros3 :: [Carro]
listaCarros3 = [(Carro (4.0,3.2) 0 (0,0)),(Carro (4.0,3.8) 0 (0,0))]

{- | Quarto carro da lista de inicial de carros.  -}
listaCarros4 :: [Carro]
listaCarros4 =  [(Carro (2.0,1.2) 0 (0,0)),(Carro (2.0,1.8) 0 (0,0))]

{- | Lista incial de nitros. -}
initNitros :: [Tempo]
initNitros = [5.0,5.0]

{- | Histórico do estado inicial. -}
initHistorico :: [[Posicao]]
initHistorico = [[],[]]

{- | Primeiro jogo da lista incial de jogos. -}
jogo1 :: Jogo
jogo1 = (Jogo autodromo1 propriedadesPista listaCarros1 initNitros initHistorico)

{- | Segundo jogo da lista incial de jogos. -}
jogo2 :: Jogo
jogo2 = (Jogo autodromo2 propriedadesPista listaCarros2 initNitros initHistorico)

{- | Terceiro jogo da lista incial de jogos. -}
jogo3 :: Jogo
jogo3 = (Jogo autodromo3 propriedadesPista listaCarros3 initNitros initHistorico)

{- | Quarto jogo da lista incial de jogos. -}
jogo4 :: Jogo
jogo4 = (Jogo autodromo4 propriedadesPista listaCarros4 initNitros initHistorico)

{- | Lista incial de jogos. -}
initJogos :: [Jogo]
initJogos = [jogo1,jogo2,jogo3,jogo4]

{- | Primeira ação do jogo. -}
fstAcao :: Acao
fstAcao = (Acao False False False False Nothing)

{- | Primeira lista de ações. -}
initAcoes :: [Acao]
initAcoes = [fstAcao,fstAcao]

{- | Propriedades das aulas. -}
propriedadesPista :: Propriedades
propriedadesPista = Propriedades 2 3 4 2 15 180

--------------------------------------------------------------------------------
----- ESTADO INICIAL -----------------------------------------------------------
--------------------------------------------------------------------------------

{- | Declaração da constituição de um estado. -}
type Estado = ([Jogo]     -- lista de jogos
              ,[Picture]  -- lista das imagens carregadas em 'main'
              ,[Acao]     -- lista de ações
              ,Bool       -- booleano que identifica se algum jogador já cruzou a meta
              ,Int)       -- identificador do estado

{- | Função que recebe a lista de jogos inciais, a lista das imagens carregadas, a lista de ações inciais, o identificador do estado incial e cria deste modo o estado inicial. -}
inicialState :: [Jogo] -> [Picture] -> [Acao] -> Int -> Estado
inicialState jogos [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] initAcoes 1 = (jogos,[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],initAcoes,False,1)
inicialState jogos [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] initAcoes 2 = (jogos,[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],initAcoes,False,2)
inicialState jogos [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] initAcoes 3 = (jogos,[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],initAcoes,False,3)
inicialState jogos [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] initAcoes 4 = (jogos,[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],initAcoes,False,4)
inicialState jogos [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] initAcoes 5 = (jogos,[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],initAcoes,False,5)
inicialState jogos [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] initAcoes 6 = (jogos,[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],initAcoes,False,6)
inicialState jogos [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] initAcoes 7 = (jogos,[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],initAcoes,False,7)
inicialState jogos [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] initAcoes 8 = (jogos,[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],initAcoes,False,8)
inicialState jogos [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] initAcoes 9 = (jogos,[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],initAcoes,False,9)
inicialState jogos [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] initAcoes 10 = (jogos,[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],initAcoes,False,10)
inicialState jogos [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] initAcoes 11 = (jogos,[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],initAcoes,False,11)
inicialState jogos [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] initAcoes 12 = (jogos,[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],initAcoes,False,12)


--------------------------------------------------------------------------------
----- DESENHA ESTADO INICIAL ---------------------------------------------------
--------------------------------------------------------------------------------

{- | Função que recebe um estado e devolve a sua imagem. -}
drawState :: Estado -> Picture
drawState e@((jogos,[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],a,b,estado)) | estado == 1 = Pictures [menuState]
                                                                                                                                                      | estado == 2 = Pictures (a ++ b)
                                                                                                                                                      | estado == 3 = Pictures (a ++ b)
                                                                                                                                                      | estado == 4 = Pictures [creditsState]
                                                                                                                                                      | estado == 5 = Pictures [mapa1]
                                                                                                                                                      | estado == 6 = Pictures [mapa2]
                                                                                                                                                      | estado == 7 = Pictures [mapa3]
                                                                                                                                                      | estado == 8 = Pictures [mapa4]
                                                                                                                                                      | estado == 9 = Pictures [mapa1]
                                                                                                                                                      | estado == 10 = Pictures [mapa2]
                                                                                                                                                      | estado == 11 = Pictures [mapa3]
                                                                                                                                                      | estado == 12 = Pictures [mapa4]
                                                                                                                                                      | estado == 13 = Pictures (c ++ d)
                                                                                                                                                      | estado == 14 = Pictures (f ++ g)
                                                                                                                                                      | estado == 15 = Pictures (h ++ i)
                                                                                                                                                      | estado == 16 = Pictures (c ++ d)
                                                                                                                                                      | estado == 17 = Pictures (f ++ g)
                                                                                                                                                      | estado == 18 = Pictures (h ++ i)
                                                                                                                                          where a = translateListaPictures m1 [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] -- imagem do primeiro mapa
                                                                                                                                                c = translateListaPictures m2 [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] -- imagem do segundo mapa
                                                                                                                                                f = translateListaPictures m3 [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] -- imagem do terceiro mapa
                                                                                                                                                h = translateListaPictures m4 [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] -- imagem do quarto mapa
                                                                                                                                                b = scaleImages 0.5 (drawCarros e) -- imagem de ambos os carros no primeiro mapa
                                                                                                                                                d = scaleImages 0.5 (drawCarros e) -- imagem de ambos os carros no segundo mapa
                                                                                                                                                g = scaleImages 0.5 (drawCarros e) -- imagem de ambos os carros no terceiro mapa
                                                                                                                                                i = scaleImages 0.5 (drawCarros e) -- imagem de ambos os carros no quarto mapa
                                                                                                                                                m1 = getMapaFromJogo (jogos !! 0)  -- mapa correspondente ao primeiro jogo
                                                                                                                                                m2 = getMapaFromJogo (jogos !! 1)  -- mapa correspondente ao segundo jogo
                                                                                                                                                m3 = getMapaFromJogo (jogos !! 2)  -- mapa correspondente ao terceiro jogo
                                                                                                                                                m4 = getMapaFromJogo (jogos !! 3)  -- mapa correspondente ao quarto jogo


{- | Função que recebe um mapa e desenha os carros no respetivo estado. -}
drawCarros :: Estado -> [Picture]
drawCarros ([j1,j2,j3,j4],[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],[a1,a2],bool,estado) | ((estado == 2) || (estado == 3)) = auxDrawCarros (j1,[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],[a1,a2],bool,estado)    -- desenho dos carros no primeiro mapa
                                                                                                                                                                    | ((estado == 13) || (estado == 16)) = auxDrawCarros (j2,[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],[a1,a2],bool,estado)  -- desenho dos carros no segundo mapa
                                                                                                                                                                    | ((estado == 14) || (estado == 17)) = auxDrawCarros (j3,[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],[a1,a2],bool,estado)  -- desenho dos carros no terceiro mapa
                                                                                                                                                                    | ((estado == 15) || (estado == 18)) = auxDrawCarros (j4,[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],[a1,a2],bool,estado)  -- desenho dos carros no quarto mapa
{- | Função auxiliar de 'drawCarros'. -}
auxDrawCarros :: (Jogo,[Picture],[Acao],Bool,Int) -> [Picture]
auxDrawCarros (j,[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],[a1,a2],bool,estado) = [translateImage pos1 scaleCarro1] ++ [translateImage pos2 scaleCarro2]
                                                                                                                                               where carros = getPlayersFromJogo j -- carros correspondentes ao jogo a ser desenhado
                                                                                                                                                     c1 = head carros              -- primeiro carro da lista de carros
                                                                                                                                                     c2 = last carros              -- segundo carro da lista de carros
                                                                                                                                                     p1 = getPosicaoFromCar c1     -- posição do primeiro carro
                                                                                                                                                     p2 = getPosicaoFromCar c2     -- posição do segundo carro
                                                                                                                                                     scaling = realToFrac (newScalingFactor mapa)   -- fato de "scaling" corresponde ao mapa relativo ao jogo
                                                                                                                                                     mapa = getMapaFromJogo j    -- mapa relativo ao jogo em questão
                                                                                                                                                     pos1 = convertToWindowPos mapa (realToFrac (fst p1),realToFrac (snd p1))  -- posição na janela do jogo respetiva ao primeiro carro
                                                                                                                                                     pos2 = convertToWindowPos mapa (realToFrac (fst p2),realToFrac (snd p2))  -- posição na janela do jogo respetiva ao segundo carro
                                                                                                                                                     dir1 = realToFrac (getDirFromCarro c1)   -- direção respetiva ao primeiro carro
                                                                                                                                                     dir2 = realToFrac (getDirFromCarro c2)   -- direção respetiva ao segundo carro
                                                                                                                                                     scaleCarro1 = Rotate (-dir1) (Scale scaling scaling $ carro)   -- imagem respetiva ao primeiro com o fator de "scaling" já aplicado
                                                                                                                                                     scaleCarro2 = Rotate (-dir2) (Scale scaling scaling $ carro2)  -- imagem respetiva ao segundo com o fator de "scaling" já aplicado

{- | Função que recebe um jogo e devolve uma lista de carros. -}
getPlayersFromJogo :: Jogo -> [Carro]
getPlayersFromJogo (Jogo m p c n h) = c

{- | Função que recebe um carro e devolve a sua posição. -}
getPosicaoFromCar :: Carro -> (Double,Double)
getPosicaoFromCar (Carro (x,y) dir (vx,vy)) = (x,y)

{- | Função que recebe um carro e devolve a sua direção. -}
getDirFromCarro :: Carro -> Double
getDirFromCarro (Carro (x,y) dir (vx,vy)) = dir

-----------------------------------------------------------------------------------------------------------------------
-----  CONSTRUÇÃO DO MAPA ---------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

{- | Função que recebe um mapa e devolve o fator de "scaling" necessário para desenhar o mapa. -}
newScalingFactor :: Mapa -> Double
newScalingFactor m@(Mapa ((x,y),or) tb) = minimo (a,b)
         where a = 1000/realToFrac c
               b = 1000/realToFrac d
               c = (fromIntegral e) * 600
               d = (fromIntegral f) * 600
               (e,f) = getDimensaoTab2 m

{- | Função que recebe um número, uma lista de números e retorna todos os pares possíveis associando o primeiro aos elementos da lista. -}
auxGimmeAllIndex :: Float -> [Float] -> [(Float,Float)]
auxGimmeAllIndex n [] = []
auxGimmeAllIndex n (p:ps) = (n,p) : auxGimmeAllIndex n ps

{- | Função que recebe dois listas de números e retorna todos os pares possíveis associando os elementos da primeira lista aos da segunda. -}
gimmeAllIndex :: [Float] -> [Float] -> [(Float,Float)]
gimmeAllIndex [] _ = []
gimmeAllIndex _ [] = []
gimmeAllIndex (i:is) (u:us) = auxGimmeAllIndex i (u:us) ++ gimmeAllIndex is (u:us)


{- | Função que recebe um mapa e devolve todos as suas posições. (posições que necessitam ainda que as suas componentes sejam invertidas) -}
gimmeAllIndexsInverted :: Mapa -> [(Float,Float)]
gimmeAllIndexsInverted m@(Mapa ((x,y),or) tb) = gimmeAllIndex d e
                     where (z,p) = getDimensaoTab2 m
                           d = map (fromIntegral) [0..(z-1)]
                           e = map (fromIntegral) [0..(p-1)]

{- | Função que recebe um mapa e devolve todos as suas posições. -}
gimmeAllIndexsFinal :: Mapa -> [(Float,Float)]
gimmeAllIndexsFinal m@(Mapa ((x,y),or) tb) = map (invertHem) l
                where l = gimmeAllIndexsInverted m

{- | Função que recebe um mapa e devolve os centros de todas as peças. -}
gimmePiecesCenter :: Mapa -> [(Float,Float)]
gimmePiecesCenter m@(Mapa ((x,y),or) tb) = map (add5) l
                where l = gimmeAllIndexsFinal m

{- | Função que recebe um mapa e devolve as posições do centro de cada peça na janela do jogo. -}
windowPositions :: Mapa -> [(Float,Float)]
windowPositions m@(Mapa ((x,y),or) tb) = map (convertToWindowPos m) l
                   where l = gimmePiecesCenter m

{- | Função que recebe um mapa, uma posição e converte essa posição para uma posição na janela. -}
convertToWindowPos :: Mapa -> (Float,Float) -> (Float,Float)
convertToWindowPos m@(Mapa ((x,y),or) tb) (z,p) = (-500 + (z*600*b),-(-500 + (p*600*b)))
                      where a = newScalingFactor m
                            b = realToFrac a

{- | Função que recebe um tabuleiro e devolve a lista das peças que o constituem. -}
convertTabToList :: Tabuleiro -> [Peca]
convertTabToList tb = concat tb

{- | Função que recebe a lista de imagens carregadas em 'main' uma peça e lhe faz corresponder uma imagem. -}
pecaToPicture :: [Picture] -> Peca -> Picture
pecaToPicture [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] (Peca Recta h)         = reta
pecaToPicture [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] (Peca Lava h)          = lava
pecaToPicture [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] (Peca (Curva Norte) h) = Rotate (-90) curva
pecaToPicture [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] (Peca (Curva Este) h)  = curva
pecaToPicture [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] (Peca (Curva Sul) h)   = Rotate 90 curva
pecaToPicture [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] (Peca (Curva Oeste) h) = Rotate 180 curva
pecaToPicture [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] (Peca (Rampa Norte) h) = Rotate (-90) rampa
pecaToPicture [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] (Peca (Rampa Este) h)  = rampa
pecaToPicture [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] (Peca (Rampa Sul) h)   = Rotate 90 rampa
pecaToPicture [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] (Peca (Rampa Oeste) h) = Rotate 180 rampa


{- | Função que adiciona "0.5" a ambas as componentes de uma posição. -}
add5 :: (Float,Float) -> (Float,Float)
add5 (x,y) = (x + 0.5, y + 0.5)

{- | Função que recebe uma posição e inverte as suas componentes. -}
invertHem :: (a,a) -> (a,a)
invertHem (x,y) = (y,x)

{- | Função que recebe um mapa, a lista de imagens carregadas em 'main' e devolve a lista de imagens correspondentes às peças do tabuleiro. -}
getListaPictures :: Mapa -> [Picture] -> [Picture]
getListaPictures m@(Mapa ((x,y),or) tb) [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] = l2
                    where l = convertTabToList a
                          a = getTabFromMapa m
                          l2 = map (pecaToPicture [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4]) l

{- | Função que recebe um mapa, a lista de imagens carregadas em 'main' e devolve a lista de imagens correspondentes às peças do tabuleiro já com o fator de "scaling" aplicado. -}
scaleListaPictures :: Mapa -> [Picture] -> [Picture]
scaleListaPictures m@(Mapa ((x,y),or) tb) [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] = scaleImages (realToFrac a) p
                      where a = newScalingFactor m
                            p = getListaPictures m [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4]

{- | Função que recebe um mapa, a lista de imagens carregadas em 'main' e devolve a lista de imagens corresponedentes às peças do tabuleiro já com o fator de "scaling" aplicado, assim como os fatores de translação. -}
translateListaPictures :: Mapa -> [Picture] -> [Picture]
translateListaPictures m@(Mapa ((x,y),or) tb) [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4] = translateImages a b
                       where a =  windowPositions m
                             b = scaleListaPictures m [reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4]

--------------------------------------------------------------------------------
------- OBTENÇÃO DAS IMAGENS ---------------------------------------------------
--------------------------------------------------------------------------------

{- | Função que aplica os fatores de translação a uma imagem. -}
translateImage :: (Float,Float) -> Picture -> Picture
translateImage (x,y) p = Translate x y $ p

{- | Função que aplica os fatores de translação a uma lista de imagens. -}
translateImages :: [(Float,Float)] -> [Picture] -> [Picture]
translateImages ((x,y):xs) [] = []
translateImages [] t = []
translateImages ((x,y):xs) (h:t) = translateImage (x,y) h : translateImages xs t

{- | Função que aplica o fator de "Scaling" a uma imagem. -}
scaleImage :: Float -> Picture -> Picture
scaleImage scl p = Scale scl scl $ p

{- | Função que aplica o fator de "Scaling" a uma lista de imagens. -}
scaleImages :: Float -> [Picture] -> [Picture]
scaleImages scl [] = []
scaleImages scl (h:t) = scaleImage scl h : scaleImages scl t

--------------------------------------------------------------------------------
------- REAÇÃO A EVENTOS -------------------------------------------------------
--------------------------------------------------------------------------------

{- | Função que altera uma ação consoante um evento no estado identificado com Int = [2,3,13,14,15,16,17,18]. -}
alteraAcao :: Acao -> Event -> Acao
alteraAcao (Acao ba bt be bd mn) (EventKey (SpecialKey KeyUp)    Up _ _)   = (Acao False  bt    be    bd    mn)
alteraAcao (Acao ba bt be bd mn) (EventKey (SpecialKey KeyUp)    Down _ _) = (Acao True bt    be    bd    mn)
alteraAcao (Acao ba bt be bd mn) (EventKey (SpecialKey KeyDown)  Up _ _)   = (Acao ba    False  be    bd    mn)
alteraAcao (Acao ba bt be bd mn) (EventKey (SpecialKey KeyDown)  Down _ _) = (Acao ba    True be    bd    mn)
alteraAcao (Acao ba bt be bd mn) (EventKey (SpecialKey KeyLeft)  Up _ _)   = (Acao ba    bt    False  bd    mn)
alteraAcao (Acao ba bt be bd mn) (EventKey (SpecialKey KeyLeft)  Down _ _) = (Acao ba    bt    True bd    mn)
alteraAcao (Acao ba bt be bd mn) (EventKey (SpecialKey KeyRight) Up _ _)   = (Acao ba    bt    be    False  mn)
alteraAcao (Acao ba bt be bd mn) (EventKey (SpecialKey KeyRight) Down _ _) = (Acao ba    bt    be    True mn)
alteraAcao (Acao ba bt be bd mn) (EventKey (Char '0')            Down _ _) = (Acao ba    bt    be    bd    (Just 0))
alteraAcao (Acao ba bt be bd mn) (EventKey (Char '1')            Down _ _) = (Acao ba    bt    be    bd    (Just 1))
alteraAcao a _ = a -- caso em que o evento não corresponde a uma ação

{- | Função que altera uma ação do segundo carro consoante um evento no estado identificado com Int = [3,16,17,18]. -}
alteraAcaoPlayer2 :: Acao -> Event -> Acao
alteraAcaoPlayer2 (Acao ba bt be bd mn) (EventKey (Char 'w')    Up _ _)   = (Acao False  bt    be    bd    mn)
alteraAcaoPlayer2 (Acao ba bt be bd mn) (EventKey (Char 'w')    Down _ _) = (Acao True bt    be    bd    mn)
alteraAcaoPlayer2 (Acao ba bt be bd mn) (EventKey (Char 's')    Up _ _)   = (Acao ba    False  be    bd    mn)
alteraAcaoPlayer2 (Acao ba bt be bd mn) (EventKey (Char 's')    Down _ _) = (Acao ba    True be    bd    mn)
alteraAcaoPlayer2 (Acao ba bt be bd mn) (EventKey (Char 'a')    Up _ _)   = (Acao ba    bt    False  bd    mn)
alteraAcaoPlayer2 (Acao ba bt be bd mn) (EventKey (Char 'a')    Down _ _) = (Acao ba    bt    True bd    mn)
alteraAcaoPlayer2 (Acao ba bt be bd mn) (EventKey (Char 'd')    Up _ _)   = (Acao ba    bt    be    False  mn)
alteraAcaoPlayer2 (Acao ba bt be bd mn) (EventKey (Char 'd')    Down _ _) = (Acao ba    bt    be    True mn)
alteraAcaoPlayer2 (Acao ba bt be bd mn) (EventKey (Char '8')    Down _ _) = (Acao ba    bt    be    bd    (Just 0))
alteraAcaoPlayer2 (Acao ba bt be bd mn) (EventKey (Char '9')    Down _ _) = (Acao ba    bt    be    bd    (Just 1))
alteraAcaoPlayer2 a _ = a -- caso em que o evento não corresponde a uma ação

{- | Função que recebe um estado, um evento e devolve um novo estado, no estado identificado com Int = 1. -}
reactMenu :: Estado -> Event -> Estado
reactMenu (j,l,a,b,estado) (EventKey (Char '1') Down _ _) = (j,l,a,b,5)
reactMenu (j,l,a,b,estado) (EventKey (Char '2') Down _ _) = (j,l,a,b,9)
reactMenu (j,l,a,b,estado) (EventKey (Char '3') Down _ _) = (j,l,a,b,4)
reactMenu (j,l,a,b,estado) _                              = (j,l,a,b,estado)

{- | Função que recebe um estado, um evento e devolve um novo estado, no estado identificado com Int = 5. -}
reactMapa1 :: Estado -> Event -> Estado
reactMapa1  (j,l,a,b,estado) (EventKey (SpecialKey KeyRight)  Down _ _) = (j,l,a,b,6)
reactMapa1  (j,l,a,b,estado) (EventKey (SpecialKey KeyLeft)   Down _ _) = (j,l,a,b,1)
reactMapa1  (j,l,a,b,estado) (EventKey (SpecialKey KeyEnter) Down _ _)  = (j,l,a,b,2)
reactMapa1  (j,l,a,b,estado) _                                          = (j,l,a,b,estado)

{- | Função que recebe um estado, um evento e devolve um novo estado, no estado identificado com Int = 6. -}
reactMapa2 :: Estado -> Event -> Estado
reactMapa2  (j,l,a,b,estado) (EventKey (SpecialKey KeyRight)  Down _ _) = (j,l,a,b,7)
reactMapa2  (j,l,a,b,estado) (EventKey (SpecialKey KeyLeft)   Down _ _) = (j,l,a,b,5)
reactMapa2  (j,l,a,b,estado) (EventKey (SpecialKey KeyEnter) Down _ _)  = (j,l,a,b,13)
reactMapa2  (j,l,a,b,estado) _                                          = (j,l,a,b,estado)

{- | Função que recebe um estado, um evento e devolve um novo estado, no estado identificado com Int = 7. -}
reactMapa3 :: Estado -> Event -> Estado
reactMapa3  (j,l,a,b,estado) (EventKey (SpecialKey KeyRight)  Down _ _) = (j,l,a,b,8)
reactMapa3  (j,l,a,b,estado) (EventKey (SpecialKey KeyLeft)   Down _ _) = (j,l,a,b,6)
reactMapa3  (j,l,a,b,estado) (EventKey (SpecialKey KeyEnter) Down _ _)  = (j,l,a,b,14)
reactMapa3  (j,l,a,b,estado) _                                          = (j,l,a,b,estado)

{- | Função que recebe um estado, um evento e devolve um novo estado, no estado identificado com Int = 8. -}
reactMapa4 :: Estado -> Event -> Estado
reactMapa4  (j,l,a,b,estado) (EventKey (SpecialKey KeyRight)  Down _ _) = (j,l,a,b,1)
reactMapa4  (j,l,a,b,estado) (EventKey (SpecialKey KeyLeft)   Down _ _) = (j,l,a,b,7)
reactMapa4  (j,l,a,b,estado) (EventKey (SpecialKey KeyEnter) Down _ _)  = (j,l,a,b,15)
reactMapa4  (j,l,a,b,estado) _                                          = (j,l,a,b,estado)

{- | Função que recebe um estado, um evento e devolve um novo estado, no estado identificado com Int = 9. -}
reactMapa5 :: Estado -> Event -> Estado
reactMapa5  (j,l,a,b,estado) (EventKey (SpecialKey KeyRight)  Down _ _) = (j,l,a,b,10)
reactMapa5  (j,l,a,b,estado) (EventKey (SpecialKey KeyLeft)   Down _ _) = (j,l,a,b,1)
reactMapa5  (j,l,a,b,estado) (EventKey (SpecialKey KeyEnter) Down _ _)  = (j,l,a,b,3)
reactMapa5  (j,l,a,b,estado) _                                          = (j,l,a,b,estado)

{- | Função que recebe um estado, um evento e devolve um novo estado, no estado identificado com Int = 10. -}
reactMapa6 :: Estado -> Event -> Estado
reactMapa6  (j,l,a,b,estado) (EventKey (SpecialKey KeyRight)  Down _ _) = (j,l,a,b,11)
reactMapa6  (j,l,a,b,estado) (EventKey (SpecialKey KeyLeft)   Down _ _) = (j,l,a,b,9)
reactMapa6  (j,l,a,b,estado) (EventKey (SpecialKey KeyEnter) Down _ _)  = (j,l,a,b,16)
reactMapa6  (j,l,a,b,estado) _                                          = (j,l,a,b,estado)

{- | Função que recebe um estado, um evento e devolve um novo estado, no estado identificado com Int = 11. -}
reactMapa7 :: Estado -> Event -> Estado
reactMapa7  (j,l,a,b,estado) (EventKey (SpecialKey KeyRight)  Down _ _) = (j,l,a,b,12)
reactMapa7  (j,l,a,b,estado) (EventKey (SpecialKey KeyLeft)   Down _ _) = (j,l,a,b,10)
reactMapa7  (j,l,a,b,estado) (EventKey (SpecialKey KeyEnter) Down _ _)  = (j,l,a,b,17)
reactMapa7  (j,l,a,b,estado) _                                          = (j,l,a,b,estado)

{- | Função que recebe um estado, um evento e devolve um novo estado, no estado identificado com Int = 12. -}
reactMapa8 :: Estado -> Event -> Estado
reactMapa8  (j,l,a,b,estado) (EventKey (SpecialKey KeyRight)  Down _ _) = (j,l,a,b,1)
reactMapa8  (j,l,a,b,estado) (EventKey (SpecialKey KeyLeft)   Down _ _) = (j,l,a,b,11)
reactMapa8  (j,l,a,b,estado) (EventKey (SpecialKey KeyEnter) Down _ _)  = (j,l,a,b,18)
reactMapa8  (j,l,a,b,estado) _                                          = (j,l,a,b,estado)

{- | Função que recebe um estado, um evento e devolve um novo estado, no estado identificado com Int = 4. -}
reactCredits :: Estado -> Event -> Estado
reactCredits (j,l,a,b,estado) (EventKey (SpecialKey KeyEnter) Down _ _) = (j,l,a,b,1)
reactCredits (j,l,a,b,estado) _                                         = (j,l,a,b,estado)

{- | Função que aplica as funções de alteração de estado tem em conta o Int que identifica o corrente estado.-}
reactEvent :: Event -> Estado -> Estado
reactEvent event (j,l,[a1,a2],b,estado) | estado == 1 = reactMenu (j,l,[a1,a2],b,estado) event
                                        | estado == 2 = (j,l, [alteraAcao a1 event,alteraAcaoPlayer2 a2 event],b,estado)
                                        | estado == 3 = (j,l, [alteraAcao a1 event,bot (1/fromIntegral (frameRate)) (j !! 0) (1)],b,estado)
                                        | estado == 4 = reactCredits (j,l,[a1,a2],b,estado) event
                                        | estado == 5 = reactMapa1 (j,l,[a1,a2],b,estado) event
                                        | estado == 6 = reactMapa2 (j,l,[a1,a2],b,estado) event
                                        | estado == 7 = reactMapa3 (j,l,[a1,a2],b,estado) event
                                        | estado == 8 = reactMapa4 (j,l,[a1,a2],b,estado) event
                                        | estado == 9 = reactMapa5 (j,l,[a1,a2],b,estado) event
                                        | estado == 10 = reactMapa6 (j,l,[a1,a2],b,estado) event
                                        | estado == 11 = reactMapa7 (j,l,[a1,a2],b,estado) event
                                        | estado == 12 = reactMapa8 (j,l,[a1,a2],b,estado) event
                                        | estado == 13 = (j,l, [alteraAcao a1 event,alteraAcaoPlayer2 a2 event],b,estado)
                                        | estado == 14 = (j,l, [alteraAcao a1 event,alteraAcaoPlayer2 a2 event],b,estado)
                                        | estado == 15 = (j,l, [alteraAcao a1 event,alteraAcaoPlayer2 a2 event],b,estado)
                                        | estado == 16 = (j,l, [alteraAcao a1 event,bot (1/fromIntegral (frameRate)) (j !! 1) (1)],b,estado)
                                        | estado == 17 = (j,l, [alteraAcao a1 event,bot (1/fromIntegral (frameRate)) (j !! 2) (1)],b,estado)
                                        | estado == 18 = (j,l, [alteraAcao a1 event,bot (1/fromIntegral (frameRate)) (j !! 3) (1)],b,estado)



--------------------------------------------------------------------------------
------- FRAME RATE --------------------------------------- (60 hz) -------------
--------------------------------------------------------------------------------

{- | Número de frames por segundo. -}
frameRate :: Int
frameRate = 60

--------------------------------------------------------------------------------
------- WINDOW ------------------------------------------ (1000*1000) ----------
--------------------------------------------------------------------------------

{- | Dimensões e título da janela do jogo. -}
window :: Display
window = InWindow
            "Micro Machines" -- título da janela
            (1000,1000)      -- dimensão da janela
            (0,0)            -- posição no ecrã


--------------------------------------------------------------------------------
------- REAGE TEMPO ------------------------------------------------------------
--------------------------------------------------------------------------------

{- | Função que devolve o novo estado a cada 1/60 segundos. -}
reactTime :: Float -> Estado -> Estado
reactTime t ([j1,j2,j3,j4],[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],[a1,a2],b,estado) | estado == 1 = ([j1,j2,j3,j4],[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],[a1,a2],b,estado)
                                                                                                                                                                  | estado == 2 = ([(atualizaMovimenta (1/realToFrac frameRate) j1 [a1,a2]),j2,j3,j4],[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],[a1,a2],b,estado)
                                                                                                                                                                  | estado == 3 = ([(atualizaMovimenta (1/realToFrac frameRate) j1 [a1,a2]),j2,j3,j4],[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],[a1,a2],b,estado)
                                                                                                                                                                  | estado == 4 = ([j1,j2,j3,j4],[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],[a1,a2],b,estado)
                                                                                                                                                                  | estado == 5 = ([j1,j2,j3,j4],[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],[a1,a2],b,estado)
                                                                                                                                                                  | estado == 6 = ([j1,j2,j3,j4],[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],[a1,a2],b,estado)
                                                                                                                                                                  | estado == 7 = ([j1,j2,j3,j4],[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],[a1,a2],b,estado)
                                                                                                                                                                  | estado == 8 = ([j1,j2,j3,j4],[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],[a1,a2],b,estado)
                                                                                                                                                                  | estado == 9 = ([j1,j2,j3,j4],[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],[a1,a2],b,estado)
                                                                                                                                                                  | estado == 10 = ([j1,j2,j3,j4],[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],[a1,a2],b,estado)
                                                                                                                                                                  | estado == 11 = ([j1,j2,j3,j4],[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],[a1,a2],b,estado)
                                                                                                                                                                  | estado == 12 = ([j1,j2,j3,j4],[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],[a1,a2],b,estado)
                                                                                                                                                                  | estado == 13 = ([j1,(atualizaMovimenta (1/realToFrac frameRate) j2 [a1,a2]),j3,j4],[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],[a1,a2],b,estado)
                                                                                                                                                                  | estado == 14 = ([j1,j2,(atualizaMovimenta (1/realToFrac frameRate) j3 [a1,a2]),j4],[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],[a1,a2],b,estado)
                                                                                                                                                                  | estado == 15 = ([j1,j2,j3,(atualizaMovimenta (1/realToFrac frameRate) j4 [a1,a2])],[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],[a1,a2],b,estado)
                                                                                                                                                                  | estado == 16 = ([j1,(atualizaMovimenta (1/realToFrac frameRate) j2 [a1,a2]),j3,j4],[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],[a1,a2],b,estado)
                                                                                                                                                                  | estado == 17 = ([j1,j2,(atualizaMovimenta (1/realToFrac frameRate) j3 [a1,a2]),j4],[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],[a1,a2],b,estado)
                                                                                                                                                                  | estado == 18 = ([j1,j2,j3,(atualizaMovimenta (1/realToFrac frameRate) j4 [a1,a2])],[reta,lava,curva,rampa,carro,carro2,menuState,creditsState,singleplayer,multiplayer,credits,mapa1,mapa2,mapa3,mapa4],[a1,a2],b,estado)

{- | Função que recebe um mapa e devolve um tabuleiro. -}
getTabFromMapa :: Mapa -> Tabuleiro
getTabFromMapa (Mapa _ tb) = tb

{- | Função que devolve o menor número de um par de números. -}
minimo :: Ord a => (a,a) -> a
minimo (x,y) | x <= y = x
             | otherwise = y

{- | Função que indica o maior indice de um tabuleiro. -}
getDimensaoTab2 :: Mapa -> (Int,Int)
getDimensaoTab2 (Mapa (p,or) tb) = (length b, length a)
                         where a = head tb -- isto está ao contrário
                               b = tb

--------------------------------------------------------------------------------
------- ESTADO INICIAL ----------------------------- (DRAW MAP) ----------------
--------------------------------------------------------------------------------

{-| Função que através das acções dos jogadores atualiza o jogo. -}
atualizaMovimenta :: Tempo  -- ^ a duração do evento
                  -> Jogo   -- ^ o estado do jogo
                  -> [Acao] -- ^ a lista de ações tomadas pelos jogadores
                  -> Jogo   -- ^ o estado atualizado do jogo
atualizaMovimenta t j as = movimentaTodos t va -- posições atualizadas
                        where
                          va = atualizaTodos t j 0 as -- vetores atualizados

{- | Função que através das acções, atualiza o jogo sem movimentar os carros. -}
atualizaTodos :: Tempo  -- ^ a duração do evento
              -> Jogo   -- ^ o estado do jogo
              -> Int    -- ^ indice do primeiro jogador
              -> [Acao] -- ^ a lista de ações tomadas pelos jogadores
              -> Jogo
atualizaTodos t e n [a] = atualiza t e n a
atualizaTodos t e n (a:as) = atualizaTodos t (atualiza t e n a) (n+1) as

{- | Função que através dos vetores velocidades, movimenta os carros. -}
movimentaTodos :: Tempo -- ^ a duração do evento
               -> Jogo  -- ^ o estado do jogo com os vetores atualizados
               -> Jogo
movimentaTodos t e@(Jogo m@(Mapa w tb) p cs ns hs) = Jogo m p ncs ns hs
              where
                mcs = map (movimenta tb t) cs -- criada lista Maybe Carro
                ncs = removeMaybes mcs hs     -- lista de carros nas posições

{- | Função que de uma lista de Maybe Carros, gera uma lista de Carros restaurando os carros que morreram no centro da última peça em que estiveram. -}
removeMaybes :: [Maybe Carro] -> [[Posicao]] -> [Carro]
removeMaybes [] _ = []
removeMaybes ((Just m):ms) (h:hs) = m:removeMaybes ms hs
removeMaybes (Nothing:ms) (h:hs) = (Carro pt 0 (0,0)):removeMaybes ms hs
          where
            pt = (fromIntegral x + 0.5,fromIntegral y + 0.5)
            (x,y) = head h
