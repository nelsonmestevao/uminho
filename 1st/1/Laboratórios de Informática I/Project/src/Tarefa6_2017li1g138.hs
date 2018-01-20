{-|
Module      : Tarefa6_2017li1g138
Description : Implementar uma Estratégia de Corrida
Copyright   : Nelson Estevão <a76434@alunos.uminho.pt>;
            : Pedro Ribeiro  <a85493@alunos.uminho.pt>;

Módulo para a realização da Tarefa 6 de LI1 em 2017/18.
-}

module Tarefa6_2017li1g138 where
import LI11718
import Data.List
import Testing

{-|
Função usada para simular um /bot/ no jogo /Micro Machines/.
Em cada instante, dado o tempo decorrido, o estado do jogo
e o identificador do jogador, toma uma ação.
-}
bot :: Tempo  -- ^ tempo decorrido desde a última decisão
    -> Jogo   -- ^ estado atual do jogo
    -> Int    -- ^ identificador do jogador dentro do estado
    -> Acao   -- ^ a decisão tomada pelo /bot/
bot tick e j = Acao
   { acelerar = regularVelAccel p c
   , travar = regularVelTravar p c
   , esquerda = checkTurnLeft c or
   , direita = checkTurnRight c or
   , nitro = checkApplyNitro2 e j}
   where c = getCarroFromJogo e j
         p = getPecaFromCarro m c
         pos = getPosFromCarro c
         m = getMapaFromJogo e
         lpsos = indicesPercurso m
         w = getTabFromMap m
         or = showMeNextOr e j

------------------------------------------------------------------------------------------------------------------------
-- Secção de código relativa à mudança de direção ----------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

{- | Função que retira apenas o inteiro de uma expressão do tipo "Just Int". -}
remMaybe :: Maybe a
         -> a
remMaybe (Just a) = a

{- | Função que recebe um Mapa e devolve um Tabuleiro. -}
getTabFromMap :: Mapa
              -> Tabuleiro
getTabFromMap (Mapa ((x,y),or) tb) = tb

{- | Função que recebe um Jogo, o identificador do jogador e devolve o Carro correspondente. -}
getCarroFromJogo :: Jogo
                 -> Int
                 -> Carro
getCarroFromJogo (Jogo m p c n h) i = c !! i

{- | Função que recebe um Jogo e devolve um Mapa. -}
getMapaFromJogo :: Jogo
                -> Mapa
getMapaFromJogo (Jogo m p c n h) = m

{- | Função que recebe um carro e retorna a sua posição. -}
getPosFromCarro :: Carro
                -> Posicao
getPosFromCarro (Carro (x,y) dir (vx,vy)) = (floor x, floor y)

{- | Função que recebe um Mapa e um Carro e devolve a peça em que este se encontra. -}
getPecaFromCarro :: Mapa
                 -> Carro
                 -> Peca
getPecaFromCarro (Mapa ((x,y),or) tb) c = pecaSearch a tb
                                    where a = getPosFromCarro c

{- | Função que recebe o tabuleiro e devolve o índice máximo do tabuleiro. -}
getIndiceMax :: Tabuleiro
             -> Posicao
getIndiceMax (lp:lps) = (a,b)
            where a = length lp - 1
                  b = length (lp:lps) - 1

{- | Função que recebe um índice do tabuleiro, o tabuleiro e devolve a peça correspondente. -}
pecaSearch :: Posicao
           -> Tabuleiro
           -> Peca
pecaSearch (0,0) (lp:lps) = head lp
pecaSearch (x,y) (lp:lps) | x == 0 && y == 0 = head lp
                          | y > 0 = pecaSearch (x,y-1) lps
                          | x > 0 = pecaSearch (x-1,y) (tail lp:lps)

{- | Função que recebe um índice, uma orientação, uma peça e devolve a próxima posição e a próxima orientação. -}
nextOrPos :: Posicao
          -> Orientacao
          -> Peca
          -> (Posicao, Orientacao)
nextOrPos (x,y) Este (Peca t h) | Peca t h == Peca Recta h = ((x+1,y),Este)
                                | Peca t h == Peca (Curva Este) h = ((x,y+1),Sul)
                                | Peca t h == Peca (Curva Sul) h = ((x,y-1),Norte)
                                | Peca t h == Peca (Rampa Este) h = ((x+1,y),Este)
                                | Peca t h == Peca (Rampa Oeste) h = ((x+1,y),Este)
nextOrPos (x,y) Norte (Peca t h)| Peca t h == Peca Recta h = ((x,y-1),Norte)
                                | Peca t h == Peca (Curva Norte) h = ((x+1,y),Este)
                                | Peca t h == Peca (Curva Este) h = ((x-1,y),Oeste)
                                | Peca t h == Peca (Rampa Norte) h = ((x,y-1),Norte)
                                | Peca t h == Peca (Rampa Sul) h = ((x,y-1),Norte)
nextOrPos (x,y) Oeste (Peca t h)| Peca t h == Peca Recta h = ((x-1,y),Oeste)
                                | Peca t h == Peca (Curva Oeste) h = ((x,y-1),Norte)
                                | Peca t h == Peca (Curva Norte) h = ((x,y+1),Sul)
                                | Peca t h == Peca (Rampa Oeste) h = ((x-1,y),Oeste)
                                | Peca t h == Peca (Rampa Este) h = ((x-1,y),Oeste)
nextOrPos (x,y) Sul (Peca t h)  | Peca t h == Peca Recta h = ((x,y+1),Sul)
                                | Peca t h == Peca (Curva Sul) h = ((x-1,y),Oeste)
                                | Peca t h == Peca (Curva Oeste) h = ((x+1,y),Este)
                                | Peca t h == Peca (Rampa Sul) h = ((x,y+1),Sul)
                                | Peca t h == Peca (Rampa Norte) h = ((x,y+1),Sul)
nextOrPos _ o _ = ((0,0),o)

{- | Função que recebe um mapa e devolve a lista de índices correspondente ao percurso. -}
indicesPercurso :: Mapa
               -> [(Posicao,Orientacao)]
indicesPercurso m@(Mapa ((x,y),or) tb) = auxIndicesPercurso [] m ++ [((x,y),or)]


{- | Função auxiliar de `indicesPercurso` -}
auxIndicesPercurso :: [(Posicao,Orientacao)]
                   -> Mapa
                   -> [(Posicao,Orientacao)]
auxIndicesPercurso l (Mapa ((x,y),o) tb) | null l = auxIndicesPercurso [((x,y),o)] (Mapa a tb)
                                         -- falta y == snd (snd (head l) )
                                         | x == fst (fst (head l)) && o == snd (head l) = l
                                         | otherwise = auxIndicesPercurso (l ++ [((x,y),o)]) (Mapa a tb)
                                       where
                                         a = nextOrPos (x,y) o p
                                         p = pecaSearch (x,y) tb

{- | Função que recebe um angulo e retorna a sua versão simplificada. -}
reduzAngulo :: Angulo
            -> Angulo
reduzAngulo a | a == 0 = 0
              | abs a < 360 && a > 0 = a
              | a > 0 = simplificaAngulo a
              | otherwise = 360 + simplificaAngulo a

{- | Função auxiliar de 'reduzAngulo' que recebe um ângulo e devolve a sua simplificação. -}
simplificaAngulo :: Angulo
                 -> Angulo
simplificaAngulo a | a > 0 = a - 360* fromIntegral (floor (a/360))
                   | a < 0 = a + 360 * fromIntegral (floor (a/(-360)))

{- | Função que recebe um carro e calcula o módulo da velocidade do mesmo. -}
moduloVelocidade :: Carro
                 -> Double
moduloVelocidade (Carro (x,y) dir (vx,vy)) = sqrt (vx^2 + vy^2)

{- | Função que recebe uma Peça, um Carro e retorna um 'Bool' relativo à necessidade de acelerar ou não. -}
regularVelAccel :: Peca
                -> Carro
                -> Bool
regularVelAccel (Peca t h) c | checkCurva (Peca t h) = accelCurva c
                             | checkRampa (Peca t h) = accelarateRampa c
                             | otherwise = accelarateRetas c

{- | Função que recebe uma Peça, um Carro e retorna um 'Bool' relativo à necessidade de travar ou não. -}
regularVelTravar :: Peca
                 -> Carro
                 -> Bool
regularVelTravar (Peca t h) c | checkCurva (Peca t h) = abrandarCurva c
                              | checkRampa (Peca t h) = travarRampa c
                              | otherwise = travarRetas c

{- | Funçaão que recebe uma Peça e testa se ela é ou não uma curva. -}
checkCurva :: Peca
           -> Bool
checkCurva (Peca t h) | t == Curva Este = True
                      | t == Curva Norte = True
                      | t == Curva Oeste = True
                      | t == Curva Sul = True
                      | otherwise = False

{- | Função que recebe uma Peça testa se ela é ou não uma rampa. -}
checkRampa :: Peca
           -> Bool
checkRampa (Peca t h) | t == Rampa Este = True
                      | t == Rampa Norte = True
                      | t == Rampa Oeste = True
                      | t == Rampa Sul = True
                      | otherwise = False

{- | Função evocada caso a próxima peça seja uma curva e o módulo da velocidade seja superior a 0,7. -}
accelCurva :: Carro
           -> Bool
accelCurva c | moduloVelocidade c < 1.0 = True
             | otherwise = False

abrandarCurva :: Carro
              -> Bool
abrandarCurva c | moduloVelocidade c > 1.0 = True
                | otherwise = False


{- | Função evocada caso a próxima peça não seja nem curva nem rampa e a velocidade tiver módulo inferior a 3.0. -}
accelarateRetas :: Carro
                -> Bool
accelarateRetas c | moduloVelocidade c < 3.0 = True
                  | otherwise = False

travarRetas :: Carro
            -> Bool
travarRetas c | moduloVelocidade c > 3.0 = True
              | otherwise = False

{- | Função que recebe um Carro (no caso de este estar numa rampa) e retorna um 'Bool' relativo à necessidade de este acelerar ou não. -}
accelarateRampa :: Carro
                -> Bool
accelarateRampa c | moduloVelocidade c < 4.5 = True
                  | otherwise = False

{- | Função que recebe um Carro (no caso de este estar numa rampa) e retorna um 'Bool' relativo à necessidade de este travar ou não. -}
travarRampa :: Carro
            -> Bool
travarRampa c | moduloVelocidade c > 4.5 = True
              | otherwise = False

{- | Função que recebe um Carro e retorna a  sua direção. -}
getDirecaoFromCarro :: Carro
                    -> Double
getDirecaoFromCarro (Carro (x,y) dir (vx,vy)) = dir

{- | Função que recebe um Histórico, um identificador de jogador e retorna o histórico relativo a esse jogador. -}
getMyHistoricoFromJogo :: [[Posicao]]
                       -> Int
                       -> [Posicao]
getMyHistoricoFromJogo h k = h !! k

{- | Função que recebe um Jogo e retorna a lista de Históricos do mesmo. -}
getFullHistoricoFromJogo :: Jogo
                         -> [[Posicao]]
getFullHistoricoFromJogo (Jogo m p c n h) = h

{- | Função que recebe um Jogo, um identificador de jogador e retorna o tamanho do histórico relativo a esse jogador. -}
tamanhoHistorico :: Jogo
                 -> Int
                 -> Int
tamanhoHistorico j@(Jogo m p c n h) k = length a
               where a = getMyHistoricoFromJogo s k
                     s = getFullHistoricoFromJogo j

{- | Função que recebe um Jogo, um identificador de jogador e retorna a próxima orientação que o jogador deve ter. -}
showMeNextOr :: Jogo
             -> Int
             -> Orientacao
showMeNextOr j@(Jogo m p c n h) k = snd (a !! tg)
               where a = indicesPercurso b
                     b = getMapaFromJogo j
                     h1 = getMyHistoricoFromJogo h k
                     tg = tamanhoHistorico j k


{- | Função que recebe um Ângulo e associa o mesmo a um quadrante. -}
whichQuadrante :: Angulo
               -> Int
whichQuadrante x | a >= 0 && a <= 90 = 1
                 | a > 90 && a <= 180 = 2
                 | a > 180 && a <= 270 = 3
                 | a > 270 && a <= 360 = 4
                 where a = reduzAngulo x


{- | Função que recebe um Carro e a próxima orientação que este deve ter e retorna um 'Bool'conforma ele necessite de virar à direita ou não. -}
checkTurnRight :: Carro
               -> Orientacao
               -> Bool
checkTurnRight c Este   | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 1 = True
                        | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 2 = True
                        | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 3 = False
                        | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 4 = False
checkTurnRight c Norte  | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 1 = False
                        | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 2 = True
                        | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 3 = True
                        | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 4 = False
checkTurnRight c Oeste  | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 1 = False
                        | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 2 = False
                        | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 3 = True
                        | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 4 = True
checkTurnRight c Sul    | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 1 = True
                        | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 2 = False
                        | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 3 = False
                        | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 4 = True


{- | Função que recebe um Carro e a próxima orientação que este deve ter e retorna um 'Bool'conforma ele necessite de virar à direita ou não. -}
checkTurnLeft :: Carro
              -> Orientacao
              -> Bool
checkTurnLeft c Este  | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 1 = False
                      | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 2 = False
                      | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 3 = True
                      | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 4 = True
checkTurnLeft c Norte | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 1 = True
                      | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 2 = False
                      | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 3 = False
                      | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 4 = True
checkTurnLeft c Oeste | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 1 = True
                      | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 2 = True
                      | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 3 = False
                      | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 4 = False
checkTurnLeft c Sul   | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 1 = False
                      | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 2 = True
                      | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 3 = True
                      | whichQuadrante (reduzAngulo (getDirecaoFromCarro c)) == 4 = False


---------------------------------------------------------------------------------------------------------------
-- Secção do código relativa à utilização do nitro ------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------

{- | Função que recebe um Jogo, um identificador de jogador e devolve a lista com as posições dos outros jogadores. -}
getOpponentsPositions :: Jogo
                      -> Int
                      -> [(Int,Int)]
getOpponentsPositions j@(Jogo m p c n h) k = rmvByIndex k a
                    where l = c
                          a = map getPosFromCarro l

{- | Função que recebe um Jogo, um identificador de jogador e devolve a posição ocupada pelo mesmo. -}
getPlayersPosition :: Jogo
                   -> Int
                   -> (Int,Int)
getPlayersPosition j@(Jogo m p c n h) k = getPositionFromCarro a
                                   where a = getByIndex k c

{- | Função que recebe um Carro e devolve a posição ocupada pelo mesmo. -}
getPositionFromCarro :: Carro
                     -> Posicao
getPositionFromCarro (Carro (x,y) dir (vx,vy)) = (floor x,floor y)

{- | Função que recebe um inteiro "i", uma lista e remove da lista o elemento de índice "i". -}
rmvByIndex :: Int
           -> [a]
           -> [a]
rmvByIndex 0 (x:xs) = xs
rmvByIndex n (x:xs) | n >= length (x:xs) = x:xs
                    | otherwise = x : rmvByIndex (n-1) xs

{- | Função que recebe um inteiro "i", uma lista e devolve o elemento de índice "i". -}
getByIndex :: Int
           -> [a]
           ->  a
getByIndex 0 (x:xs) = x
getByIndex k (x:xs) | k >= length (x:xs) = last (x:xs)
                    | otherwise = getByIndex (k-1) xs

{- | Função que calcula a distância entre dois pontos. -}
distance :: (Int,Int)
         -> (Int,Int)
         -> Double
distance (x,y) (x2,y2) = sqrt $ (fromIntegral x - fromIntegral x2)^2 + (fromIntegral y  - fromIntegral y2)^2

{-| Função que recebe uma Posição e uma lista de posições e devolve as distâncias da primeira às restantes, pela mesma ordem. -}
calculateDistancess :: (Int,Int)
                    -> [(Int,Int)]
                    -> [Double]
calculateDistancess a = map (distance a)

{- | Função que recebe uma lista de distâncias e devolve o indice da menor distância. -}
chooseSmallerDistance :: [Double]
                      -> Int
chooseSmallerDistance l = remMaybe a
                where a = elemIndex (minimum l) l

{- | Função que recebe um Jogo, um identificador de jogador e devolve o identificador do jogador que se encontrar a menor distância
jogador com o primeiro indentificador. -}
chooseSmallerDistanceComplete :: Jogo
                              -> Int
                              -> Int
chooseSmallerDistanceComplete j@(Jogo m p c n h) k = chooseSmallerDistance a
                            where a = calculateDistancess b c
                                  b = getPlayersPosition j k
                                  c = getOpponentsPositions j k

{- | Função que recebe uma Peça, e testa se esta é uma curva com altura superior a "-1". -}
checkCurvaNaltura :: Peca
                  -> Bool
checkCurvaNaltura (Peca t h) | t == Curva Este && h > -1 = True
                             | t == Curva Norte && h > -1 = True
                             | t == Curva Oeste && h > -1 = True
                             | t == Curva Sul && h > -1 = True
                             | otherwise = False

{- | Função que recebe um Jogo, um identificador de jogador e atesta se o jogador que está mais perto está numa curva. -}
checkCloserCurva :: Jogo
                 -> Int
                 -> Bool
checkCloserCurva j@(Jogo m p c n h) k = checkCurvaNaltura a
              where a = pecaSearch b d
                    b = getPlayersPosition2 j k
                    d = getTabFromMap m

{- | Função que recebe um jogo, um identificador de jogador e devolve a posição ocupada pelo jogador que se encontra mais perto
do jogador identificado. -}
getPlayersPosition2 :: Jogo
                    -> Int
                    -> (Int,Int)
getPlayersPosition2 j@(Jogo m p c n h) k = getPlayersPosition j kappa
                       where car = getCarroFromJogo j kappa
                             kappa = chooseSmallerDistanceComplete j k


{- | Função que recebe um Jogo, um identificador de jogador e retorna uma aplicação de nitro. -}
checkApplyNitro2 :: Jogo
                 -> Int
                 -> Maybe Int
checkApplyNitro2 j@(Jogo m p c n h) k | not a = Nothing
                                      | otherwise = Just b
                           where a = checkCloserCurva j k
                                 b = chooseSmallerDistanceComplete j k
