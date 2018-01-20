{- |
Module      : Tarefa3_2017li1g138
Description : Movimentar o Carro
Copyright   : Nelson Estevão <a76434@alunos.uminho.pt>;
            : Pedro Ribeiro  <a85493@alunos.uminho.pt>;

Módulo para a realização da Tarefa 3 de LI1 em 2017/18.
-}

module Tarefa3_2017li1g138 where

import LI11718

{- | Caso de teste número 1. -}
tu1 :: (Tabuleiro,Tempo,Carro)
tu1 = ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca (Rampa Este) 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], (0.20), Carro {posicao=(2.5,1.5),direcao=45,velocidade=(2,0)})
{- | Caso de teste número 2. -}
tu2 :: (Tabuleiro,Tempo,Carro)
tu2 = ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca (Rampa Este) 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], (10), Carro {posicao=(2.5,1.5),direcao=45,velocidade=(2,0)})
{- | Caso de teste número 3. -}
tu3 :: (Tabuleiro,Tempo,Carro)
tu3 = ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Recta 0,Peca Recta 0,Peca Recta 0,Peca Recta 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], (3), Carro {posicao = (1.1,1.9), direcao =45, velocidade = (0.6,-0.25)})
{- | Caso de teste número 4. -}
tu4 :: (Tabuleiro,Tempo,Carro)
tu4 = ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Recta 0,Peca (Curva Norte) 0,Peca Recta 0,Peca Recta 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0, Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], (4), Carro {posicao = (1.1,1.9), direcao = 45, velocidade = (0.6,-0.15)})
{- | Caso de teste número 5. -}
tu5 :: (Tabuleiro,Tempo,Carro)
tu5 = ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca (Curva Este) 0,Peca Recta 0,Peca Recta 0,Peca Recta 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0, Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], (4), Carro {posicao = (4.5,1.1), direcao = 45, velocidade = (-0.6,0.15)})
{- | Caso de teste número 6. -}
tu6 :: (Tabuleiro,Tempo,Carro)
tu6 = ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Recta (-1),Peca Recta 0,Peca Recta 0,Peca Recta 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0, Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], (4), Carro {posicao = (4.5,1.1), direcao = 45, velocidade = (-0.6,0.15)})

{- | Conjunto dos casos de teste da Tarefa 3. -}
testesT3 :: [(Tabuleiro,Tempo,Carro)]
testesT3 = [tu1,tu2,tu3,tu4,tu5,tu6]

{- | Função que recebe um tabuleiro, um tempo, um carro e devolve o estado desse carro, passado o tempo fornecido. Sendo assim, é a função objetivo da Tarefa 3. -}
movimenta :: Tabuleiro   -- ^ lista de peças em que está o carro
          -> Tempo       -- ^ a duração da ação
          -> Carro       -- ^ o carro a movimentar
          -> Maybe Carro -- ^ resultado final do movimento
movimenta m t c | sobrevive p v t m && seraQueSaiDaPeca p v t = resultadoSobrevivencia t c m
                | seraQueSaiDaPeca p v t == False = Just Carro {posicao=p2,direcao=ang,velocidade=v}
                | otherwise = Nothing
                where
                  (Carro {posicao=p,direcao=ang,velocidade=v}) = c
                  p2 = pontoFinal v t p

{- | Função que recebe a velocidade, um tempo e o ponto inicial calcula o seu ponto final, não considerando as colisões. -}
pontoFinal :: Velocidade -> Tempo -> Ponto -> Ponto
pontoFinal (vx,vy) t (x,y) = (x+vx*t,y+vy*t)

{- | Função que utiliza `pontoFinal`, `transformaPontoPosicao`, recebe o ponto inicial, a velocidade, o tempo e devolve /True ou /False consoante o tempo e a velocidade forem suficientes para que ele abandone a peça em que começa. -}
seraQueSaiDaPeca :: Ponto -> Velocidade -> Tempo -> Bool
seraQueSaiDaPeca (x,y) (vx,vy) t | (floor a, floor b) /= transformaPontoPosicao (x,y) = True
                                 | otherwise = False
                                  where (a,b) = pontoFinal (vx,vy) t (x,y)

{- | Função que recebe um qualquer ponto de um carro dentro de uma peça e devolve o índice da peça em que se encontra. -}
transformaPontoPosicao :: Ponto -> Posicao
transformaPontoPosicao (x,y) = (floor x, floor y)

{- | Função que recebe o indice de uma peça, um tabuleiro e devolve a própria peça. -}
pecaSearch :: Posicao -> Tabuleiro -> Peca
pecaSearch (0,0) (lp:lps) = head lp
pecaSearch (x,y) (lp:lps) | x == 0 && y == 0 = head lp
                          | y > 0 = pecaSearch (x,y-1) lps
                          | x > 0 = pecaSearch (x-1,y) (tail lp:lps)

{- | Função que utiliza `pecaSearch`, `transformaPontoPosicao`, `pontoDeSaida`, `tempoGastoPecaParaSair`, recebe o ponto incial do carro, a velocidade, o tabuleiro e retorna a próxima peça que este intersetará. -}
getNextPeca :: Ponto -> Velocidade -> Tabuleiro -> Peca
getNextPeca p v tb = pecaSearch a tb
           where a = transformaPontoPosicao b
                 b = pontoDeSaida t v p
                 t = tempoGastoPecaParaSair p v 0

{- | Função que recebe o ponto e a velocidade retorna o tempo que o carro demora a sair da peça em questão. -}
tempoGastoPecaParaSair:: Ponto -> Velocidade -> Tempo -> Tempo
tempoGastoPecaParaSair (x,y) (vx,vy) t | (floor x /= floor (x+vx*t)) || (floor y /= floor (y+vy*t)) = t
                                       | otherwise = tempoGastoPecaParaSair (x,y) (vx,vy) (t+0.00001)

{- | Função que utiliza `tempoGastoPecaParaSair` e retorna o tempo de movimento restante após o carro intersetar a próxima peça. -}
tempoDeSobra :: Ponto -> Velocidade -> Tempo -> Tempo
tempoDeSobra p v t = t - a
                   where a = tempoGastoPecaParaSair p v 0

{- | Função que utiliza `pontoFinal`, `tempoGastoPecaParaSair` e retorna o tempo que o carro demora a sair da peça em que está. -}
pontoDeSaida :: Tempo -> Velocidade -> Ponto -> Ponto
pontoDeSaida t (vx,vy) (x,y) =  pontoFinal (vx,vy) t (x,y)
                               where
                               t = tempoGastoPecaParaSair (x,y) (vx,vy) 0

{- | Função que retorna um par, sendo o primeiro componente o declive da reta que contem o vetor velocidade e o segundo componente a ordenada na origem da mesma reta -}
equacaoVelocidade :: Velocidade -> Ponto -> (Double, Double)
equacaoVelocidade (vx,vy) (x,y) = (a,b)
                        where a = (vy/vx)
                              b = (y-a*x)

{- | Função que recebe uma peça e devolve apenas a sua altura. -}
soAltura :: Peca -> Altura
soAltura (Peca t a) = a

{- | Função que recebe uma peça e retorna apenas o tipo da mesma. -}
soTipo :: Peca -> Tipo
soTipo (Peca t a) = t

{- | Função que recebe o ponto inicial do carro, velocidade e o tabuleiro em questao dizendo se o carro "morre" de imediato ou pode continuar o seu movimento. -}
sobreviveAux :: Ponto -> Velocidade -> Tempo -> Tabuleiro -> Bool
sobreviveAux p v tempo tb | z == Peca Lava 0 = False
                          | a1 > a2 && abs(a1-a2) >= 1 = False
                          | a1 == a2 && o == (Este,Este) && (z == Peca (Curva Norte) a2 || z == Peca (Curva Oeste) a2) = False
                          | a1 == a2 && o == (Oeste,Oeste) && (z == Peca (Curva Sul) a2 || z == Peca (Curva Este) a2) = False
                          | a1 == a2 && o == (Norte,Norte) && (z == Peca (Curva Sul) a2 || z == Peca (Curva Oeste) a2) = False
                          | a1 == a2 && o == (Sul,Sul) && (z == Peca (Curva Norte) a2 || z == Peca (Curva Este) a2) = False
                          | a1 == a2 && o == (Este,Norte) && (round c1 == b1 && c2 > fromIntegral(b2)) && z == Peca (Curva Norte) a2 = False
                          | a1 == a2 && o == (Este,Norte) && (round c1 == b1 && c2 < fromIntegral(b2+1)) && z == Peca (Curva Oeste) a2 = False
                          | a1 == a2 && o == (Este,Norte) && (c1 < fromIntegral(b1+1) && c2 < fromIntegral(b2+1)) && z == Peca (Curva Oeste) a2 = False
                          | a1 == a2 && o == (Este,Sul) && (round c1 == b1 && c2 > fromIntegral(b2)) && z == Peca (Curva Norte) a2 = False
                          | a1 == a2 && o == (Este,Sul) && (c1 < fromIntegral(b1+1) && round c2 == b2) && z == Peca (Curva Norte) a2 = False
                          | a1 == a2 && o == (Este,Sul) && (round c1 == b1 && c2 > fromIntegral(b2)) && z == Peca (Curva Oeste) a2 = False
                          | a1 == a2 && o == (Oeste,Norte) && (round c1 == b1+1 && c2 > fromIntegral(b2)) && z == Peca (Curva Sul) a2 = False
                          | a1 == a2 && o == (Oeste,Norte) && (c1 > fromIntegral(b1) && round c2 == fromIntegral(b2+1)) && z == Peca (Curva Sul) a2 = False
                          | a1 == a2 && o == (Oeste,Norte) && (c1 > fromIntegral(b1) && round c2 == fromIntegral(b2+1)) && z == Peca (Curva Oeste) a2 = False
                          | a1 == a2 && o == (Oeste,Sul) && (c1 > fromIntegral(b1) && round c2 == fromIntegral(b2)) && z == Peca (Curva Este) a2 = False
                          | a1 == a2 && o == (Oeste,Sul) && (round c1 == fromIntegral(b1+1) && c2 > fromIntegral(b2)) && z == Peca (Curva Este) a2 = False
                          | a1 == a2 && o == (Oeste,Sul) && (round c1 == fromIntegral(b1+1) && c2 > fromIntegral(b2)) && z == Peca (Curva Sul) a2 = False
                          | otherwise = True
                         where
                           z = getNextPeca p v tb
                           a2 = soAltura $ getNextPeca p v tb
                           (b1,b2) = transformaPontoPosicao (c1,c2)
                           (c1,c2) = pontoDeSaida t v p
                           a1 = soAltura $ pecaSearch (transformaPontoPosicao p) tb
                           t = tempoGastoPecaParaSair p v 0
                           o = orientacaoVelocidade v
                           temR = tempoDeSobra p v tempo
                           tipo1 = soTipo $ pecaSearch (transformaPontoPosicao p) tb
                           tipo2 = soTipo z

{- |
Função que recebe o ponto, a velocidade, um tabuleiro e devolve qual o tipo de
movimento seguinte ou, se for caso disso, devolve "Morreu" caso o carro
desapareça.
-}
verificaCasoPecaSeguinte :: Ponto -> Velocidade -> Tabuleiro -> Bool
verificaCasoPecaSeguinte p v tb | a2 == a1 = True -- o carro continua em movimento
                                | a2 > a1 = False -- o carro faz ricochete
                                where
                                  a2 = soAltura $ getNextPeca p v tb
                                  a1 = soAltura (pecaSearch (transformaPontoPosicao p) tb)


{- | Função que recebe um /Tempo/ e um /Carro/ e devolve um /Carro/ que percorreu um movimento linear. -}
movimento :: Tempo -> Carro -> Carro
movimento t (Carro {posicao=p,direcao=ang,velocidade=v}) = Carro {posicao=p2, direcao=ang, velocidade=v}
       where
        p2 = pontoDeSaida t v p

{- | Função que recebe um /Tempo/ e um /Carro/ e devolve um /Carro/ que sofreu alteração na sua velocidade devido a ricochete. -}
ricochetes :: Tempo -> Carro -> Carro
ricochetes t (Carro {posicao=p,direcao=ang,velocidade=(vx,vy)}) | floor (fst p2) /= floor (fst p) = Carro {posicao=p2, direcao=ang, velocidade=((-vx),vy)}
                                                                | otherwise = Carro {posicao=p2, direcao=ang, velocidade=(vx,(-vy))}
                                                                where
                                                                  p2 = pontoDeSaida t (vx,vy) p

{- | Função que recebe /Tempo/, /Carro/ e um /Tabuleiro/ e devolve o próximo estado do carro. -}
resultadoSobrevivencia :: Tempo -> Carro -> Tabuleiro -> Maybe Carro
resultadoSobrevivencia tempo carro tabuleiro | tempo > 0 && sobreviveAux ponto vel tempo tabuleiro && alt1 == alt2 = resultadoSobrevivencia t2 m tabuleiro
                                             | tempo > 0 && sobreviveAux ponto vel tempo tabuleiro && alt1 <  alt2 = resultadoSobrevivencia t2 r tabuleiro
                                             | otherwise = Just carro
                                            where
                                              alt1 = soAltura pec1
                                              alt2 = soAltura pec2
                                              pec1 = pecaSearch (transformaPontoPosicao ponto) tabuleiro
                                              pec2 = getNextPeca ponto vel tabuleiro
                                              (Carro {posicao=ponto,direcao=ang,velocidade=vel}) = carro
                                              m = movimento tempo carro
                                              r = ricochetes tempo carro
                                              t2 = tempoDeSobra ponto vel tempo

{- | Função que associa uma orientação a cada uma das componentes da velocidade. -}
orientacaoVelocidade :: Velocidade -> (Orientacao, Orientacao)
orientacaoVelocidade (vx,vy) | vx > 0 && vy > 0 = (Este,Sul)
                             | vx > 0 && vy < 0 = (Este,Norte)
                             | vx > 0 && vy == 0 = (Este,Este)
                             | vx < 0 && vy > 0 = (Oeste,Sul)
                             | vx < 0 && vy < 0 = (Oeste,Norte)
                             | vx < 0 && vy == 0 = (Oeste,Oeste)
                             | vx == 0 && vy > 0 = (Sul,Sul)
                             | vx == 0 && vy < 0 = (Norte,Norte)


{- | Função que determina se ao fim de um determinado intervalo de tempo o carro continua suscetível de se movimentar ou se já desapareceu. -}
sobrevive :: Ponto -> Velocidade -> Tempo -> Tabuleiro -> Bool
sobrevive p v t tab = if seraQueSaiDaPeca p v t
                      then if sobreviveAux p v t tab
                           then sobrevive pr v tr tab
                           else False
                      else True
                      where
                        tr = tempoDeSobra p v t
                        pr = pontoDeSaida t v p
