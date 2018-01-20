{- |
Module      : Tarefa4_2017li1g138
Description : Atualizar Estado
Copyright   : Nelson Estevão <a76434@alunos.uminho.pt>;
            : Pedro Ribeiro  <a85493@alunos.uminho.pt>;

Módulo para a realização da Tarefa 4 de LI1 em 2017/18.
-}

module Tarefa4_2017li1g138 where

import LI11718
import Testing
import Data.Maybe

{- |
Os testes a serem considerados pelo sistema de /feedback/
para a função 'atualiza'.
-}
testesT4 :: [(Tempo,Jogo,Acao)]
testesT4 = [tu01,tu02,tu03,tu04,tu05,tu06,tu07,tu08,tu09,tu10,tu11,tu12,tu13,tu14,tu15,tu16,tu17,tu18,tu19,tu20,tu21,tu22]

{- |
Função usada para atualizar o estado do jogo dadas as
ações de um jogador num determinado período de tempo.
-}
atualiza :: Tempo -- ^ a duração da ação
         -> Jogo  -- ^ o estado do jogo
         -> Int   -- ^ o identificador do jogador
         -> Acao  -- ^ a ação tomada pelo jogador
         -> Jogo  -- ^ o estado atualizado do jogo
atualiza t e@(Jogo m@(Mapa w tb) p@(Propriedades kat kpnn kac kpe kni kro) cs ns hs) j a@(Acao ba bt be bd mn) = Jogo m p lcs lns lhs
               where
                 cj  = elementoJogador j cs
                 ncj = atualizaVelocidade t p cj tb a
                 ncs = devolveElementoJogador j ncj cs
                 lns = if isNothing mn then ns else atualizaNitros j t ns
                 tn = elementoJogador j ns
                 n2cs = carroNitro mn t p tn ncs
                 n2cj = atualizaAngulo t kro (elementoJogador j n2cs) a
                 lcs = devolveElementoJogador j n2cj n2cs
                 lhs = atualizaHistorico j cj hs

{- |
Função que recebendo o identificador do jogador, o carro, e o atual histórico,
acrescenta a posição atual do carro se está ainda não estiver no histórico.
-}
atualizaHistorico :: Int -> Carro -> [[Posicao]] -> [[Posicao]]
atualizaHistorico 0 c ([]:r) = [getPosicaoFromCarro c]:r
atualizaHistorico n c ([]:r) = []:atualizaHistorico (n-1) c r
atualizaHistorico 0 c ((p:ps):r) = if getPosicaoFromCarro c == p then (p:ps):r else (getPosicaoFromCarro c:p:ps):r
atualizaHistorico n c ((p:ps):r) = (p:ps):atualizaHistorico (n-1) c r

{- |
Função que atualiza a lista de tempos de nitro disponivel.
-}
atualizaNitros :: Int -> Tempo -> [Tempo] -> [Tempo]
atualizaNitros 0 t (lt:lts) | t < lt = (lt-t):lts
                            | otherwise = 0:lts
atualizaNitros n t (lt:lts) = lt:atualizaNitros (n-1) t lts

{- |
Função que retira de uma lista o elemento correspondente ao indice do jogador.
-}
elementoJogador :: Int -> [a] -> a
elementoJogador 0 (c:cs) = c
elementoJogador x (c:cs) = elementoJogador (x-1) cs

{- |
Função que substitui um elemento numa lista no indice do jogador.
-}
devolveElementoJogador :: Int -> a -> [a] -> [a]
devolveElementoJogador 0 nc (c:cs) = nc:cs
devolveElementoJogador x nc (c:cs) = c: devolveElementoJogador (x-1) nc cs

{- |
Função que devolve o carro a quem está a ser aplicado nitro
com o seu vetor atualizado.
-}
carroNitro :: Maybe Int -> Tempo -> Propriedades -> Tempo -> [Carro] -> [Carro]
carroNitro Nothing _ _ _ l = l
carroNitro (Just n) t (Propriedades kat kpn kac kpe kni kro) tn l = devolveElementoJogador n ncj l
                                                                where
                                                                  cj = elementoJogador n l
                                                                  ncj = atualizaNitro t cj kni tn

{- |
Função que atualiza o vetor velocidade de um carro adicionando
o vetor da força do nitro.
-}
atualizaNitro :: Tempo  -- ^ tempo da acção
              -> Carro  -- ^ lista de carros
              -> Double -- ^ a componente k_nitro
              -> Tempo  -- ^ tempos de nitro restante
              -> Carro
atualizaNitro t c@(Carro pt d (vx,vy)) k tn | t < tn = Carro pt d (vx + fst v1,vy + snd v1)
                                            | otherwise = Carro pt d (vx + fst v2,vy + snd v2)
                                            where
                                              v1 = vetorNitro t k d
                                              v2 = vetorNitro tn k d

{- |
Função que atualiza a direção do Carro.
-}
atualizaAngulo :: Tempo  -- ^ o tempo da ação
               -> Double -- ^ a componente k_roda
               -> Carro  -- ^ o carro do jogador
               -> Acao   -- ^ a ação do jogador
               -> Carro -- carro com a direção atualizada
atualizaAngulo t k c@(Carro pt d v) a@(Acao ba bt be bd mn) = Carro pt (d + t*k*b) v
                         where
                           b = acontecimento be - acontecimento bd

{- |
Função que atualiza o vetor velocidade do carro.
-}
atualizaVelocidade :: Tempo        -- ^ o tempo da ação
                   -> Propriedades -- ^ as propriedades do jogo
                   -> Carro        -- ^ o carro do jogador
                   -> Tabuleiro    -- ^ o tabuleiro do jogo
                   -> Acao         -- ^ a ação do jogador
                   -> Carro -- carro com velocidade atualizada
atualizaVelocidade t p@(Propriedades kat kpn kac kpe kni kro) c@(Carro pt d v@(vx,vy)) tb a@(Acao ba bt be bd mn) = Carro pt d (vx+f,vy+s)
                             where
                                 l = [vat,vac,vpe,vpn]
                                 f = sum $ map fst l
                                 s = sum $ map snd l
                                 vat = vetorAtrito t kat v           -- vetor da força de atrito
                                 vac = vetorAceleracao t kac d ba bt -- vetor da aceleração
                                 vpe = vetorPeso t kpe pt tb         -- vetor da força gravitica (peso)
                                 vpn = vetorPneus t kpn d v          -- vetor da força dos pneus

{- |
A função @mapPair@ é usada para aplicar a mesma função a ambos os elementos de um par.
-}
mapPair :: (a -> b) -> (a, a) -> (b, b)
mapPair f (a1, a2) = (f a1, f a2)

{- |
A função @acontecimento@ é usada para converter um booleano em binário.
-}
acontecimento :: Bool -> Double
acontecimento b = if b then 1 else 0

{- |
Função que dá o __ou__ exclusivo. O mesmo podia ser obtido importando o módulo @Data.Boolean@.
-}
xor :: Bool -> Bool -> Bool
xor True a = not a
xor False a = a

{- |
Função que determina o vetor do __nitro__.
-}
vetorNitro :: Tempo  -- ^ o tempo da ação
           -> Double -- ^ a componente k_nitro
           -> Angulo -- ^ a direção
           -> (Double,Double)
vetorNitro t k d = toCartesian (t*k,fromDegrees d)

{- |
Função que determina o vetor da __Força de Atrito__.
-}
vetorAtrito :: Tempo      -- ^ tempo da ação
            -> Double     -- ^ a componente k_atrito
            -> Velocidade -- ^ o vetor velocidade
            -> (Double,Double) -- coordenadas cartesianas
-- vetorAtrito t k (vx,vy) = (t*k*vx*(-1),t*k*vy*(-1))
vetorAtrito t k (vx,vy) = toCartesian (t*k*m,a)
                      where
                        m = sqrt (vx^2+vy^2)
                        a = pi + atan2 (-vy) vx

{- |
Função que determina o vetor da __Força da Aceleração__.
-}
vetorAceleracao :: Tempo  -- ^ tempo da ação
                -> Double -- ^ a componente k_acel
                -> Angulo -- ^ a direção
                -> Bool   -- ^ bool de acelerar
                -> Bool   -- ^ bool de travar
                -> (Double,Double) -- coordenadas cartesianas
vetorAceleracao t k d ba bt = toCartesian (b*t*k,a)
                             where
                               a = pi * acontecimento bt + fromDegrees d
                               b = acontecimento $ xor ba bt

{- |
Função que determina o vetor da __Força da Gravidade__ consoante a peça em que se está.
-}
vetorPeso :: Tempo      -- ^ o tempo da ação
          -> Double     -- ^ a componente k_peso
          -> Ponto      -- ^ a posição do carro
          -> Tabuleiro  -- ^ o tabuleiro do jogo
          -> (Double,Double) -- coordenadas cartesianas
vetorPeso t k pt tb | tp == Rampa Norte = toCartesian (t*k,3/2*pi)
                    | tp == Rampa Sul   = toCartesian (t*k,pi/2)
                    | tp == Rampa Este  = toCartesian (t*k,pi)
                    | tp == Rampa Oeste = toCartesian (t*k,0)
                    | otherwise = (0,0)
                   where
                     po = mapPair floor pt
                     tp = getTipoFromPeca $ pecaSearch po tb

{- |
Função que determina o vetor da __Força dos pneus__.
-}
vetorPneus :: Tempo      -- ^ tempo da ação
           -> Double     -- ^ a componente k_pneus
           -> Angulo     -- ^ a direção
           -> Velocidade -- ^ o vetor velocidade
           -> (Double,Double) -- coordenadas cartesianas
vetorPneus t k d (vx,vy) = toCartesian (m,a)
                      where
                        m = t*k*r*sin adv
                        r = sqrt (vx^2+vy^2)
                        adv = atan2 (-vy) vx - fromDegrees d
                        a = fromDegrees (d-90)

{- |
Função que devolve a peça que se encontra numa determinada posição.
-}
pecaSearch :: Posicao -> Tabuleiro -> Peca
pecaSearch (x,y) (lp:lps) | x == 0 && y == 0 = head lp
                          | y > 0 = pecaSearch (x,y-1) lps
                          | x > 0 = pecaSearch (x-1,y) (tail lp:lps)

{- |
Função que devolve só o tipo de uma peça.
-}
getTipoFromPeca :: Peca -> Tipo
getTipoFromPeca (Peca t a) = t

{- |
Função que devolve só a posição de um carro.
-}
getPosicaoFromCarro :: Carro -> Posicao
getPosicaoFromCarro (Carro p a v) = mapPair floor p

{- |
Função que converte coordenadas polares em coordenadas cartesianas.
-}
toCartesian :: Velocidade -> Velocidade
toCartesian (m,a) = (vx,-vy)
              where
                vx = m * cos a -- componente em x do vetor velocidade
                vy = m * sin a -- componente em y do vetor Velocidade

{- |
Função que converte graus em radianos.
-}
fromDegrees :: Angulo -> Angulo
fromDegrees deg = deg * pi / 180
