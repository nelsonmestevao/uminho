{-|
Module      : LI11718
Description : Módulo auxiliar para LI1 17/18

Tipos de dados e funções auxiliares para a realização do projeto de LI1 em 2017/18.
-}

module LI11718 (
    -- * Tipos de dados
    -- ** Básicos
    Altura,Orientacao(..),Posicao,Ponto,Angulo,Tempo,Velocidade,
    -- ** Caminhos
    Caminho(..),Passo(..),
    -- ** Mapas
    Mapa(..),Tabuleiro,Peca(..),Tipo(..),Dimensao,Carro(..),
    -- ** Jogo
    Jogo(..),Propriedades(..),Acao(..),
    -- * Funções auxiliares fornecidas
    dimensao, partida, dirInit, altInit, altLava
    ) where

-- | Uma sequência de passos que dá origem a um mapa.
type Caminho = [Passo]
-- | Tipos de passos que podem occorrer num 'Caminho'.
data Passo 
  -- | Segue em frente e mantem o nível
  = Avanca
  -- | Segue em frente e sobe um nível
  | Sobe
  -- | Segue em frente e desce um nível
  | Desce 
  -- | Curva à esquerda e mantem o nível
  | CurvaEsq
  -- | Curva à direita e mantem o nível
  | CurvaDir
  deriving (Eq,Read,Show)

-- | Mapa de um jogo, composto por um tabuleiro, uma posição inicial e uma altura inicial.
data Mapa = Mapa (Posicao,Orientacao) Tabuleiro
  deriving (Eq,Read,Show)

-- | O tabuleiro do mapa, representado por uma matriz de 'Peca'.
type Tabuleiro = [[Peca]]

-- | Uma peça num 'Tabuleiro'. A altura atribuída é sempre a do ponto mais /baixo/ da peça.
data Peca = Peca Tipo Altura
  deriving (Eq,Read,Show) 

-- | Tipos de peças contidos num 'Tabuleiro'.
data Tipo = Rampa Orientacao | Curva Orientacao | Recta | Lava
  deriving (Eq,Read,Show)

-- | Posições num 'Tabuleiro'.
type Posicao  = (Int,Int)
-- | Dimensões de um 'Tabuleiro'.
type Dimensao = (Int,Int)
-- | Altura de uma peça num 'Tabuleiro'.
type Altura = Int 

-- | Orientações no mapa.
data Orientacao = Norte | Este | Sul | Oeste
  deriving (Eq,Read,Show,Enum)
-- | Ponto no mapa.
type Ponto = (Double,Double)
-- | Ângulo em graus.
type Angulo = Double
-- | Períodos de tempo.
type Tempo = Double
-- | Vectores de velocidade.
type Velocidade = Ponto

{- | 
  O estado de um carro dentro de um 'Mapa'.
  A direção da velocidade (movimento) /não/ é necessariamente a mesma da direção do carro.
-}
data Carro = Carro
    { posicao    :: Ponto      -- ^ a posição atual do carro
    , direcao    :: Angulo     -- ^ a direção atual do carro
    , velocidade :: Velocidade -- ^ a velocidade atual do carro
    }
  deriving (Eq,Read,Show)

{- | Direção inicial na construção de um caminho.

prop> dirInit == Este
-}
dirInit :: Orientacao
dirInit = Este

{- | Altura inicial na construção de um caminho.

prop> altInit == 0
-}
altInit :: Altura
altInit = 0

{- | Altura da lava.

prop> altLava == 0
-}
altLava :: Altura
altLava = 0

{- | Dado um caminho, calcula a dimensão do tabuleiro correspondente.

>>> dimensao [CurvaDir,CurvaDir,CurvaDir,CurvaDir]
(4,4)
-}
dimensao :: Caminho -> Dimensao
dimensao c = (2+m'+abs m+1,2+n'+abs n+1)
  where ((m,m'),(n,n')) = bB ((0,0),(0,0)) (0,0) dirInit c
        
{- |
Dado um caminho, calcula a sua posição inicial no tabuleiro correspondente.

>>> partida [CurvaDir,CurvaDir,CurvaDir,CurvaDir]
(2,1)
-}
partida :: Caminho -> Posicao
partida c = (1+abs m,1+abs n)
  where ((m,m'),(n,n')) = bB ((0,0),(0,0)) (0,0) dirInit c

bB m i _ [] = up m i
bB m i d (s:c) = bB (up m i) (mx i d') d' c
  where d' = toEnum (((fromEnum d) + k) `mod` 4)
        k | s == CurvaDir = 1
          | s == CurvaEsq = (-1)
          | otherwise = 0
up ((m,m'),(n,n')) (i,j) = ((min m i, max m' i), (min n j, max n' j))
mx (x,y) d = (x+round (sin a),y-round (cos a))
  where a = ((toEnum.fromEnum) d)*(pi/2)

{- | 
  O estado de um jogo dentro, incluindo o mapa e as suas propriedades e o estado dos vários jogadores.
  Os campos 'carros', 'nitros' e 'historico' devem ter a mesma dimensão, o número de jogadores.
-}
data Jogo = Jogo 
  { mapa        :: Mapa         -- ^ o mapa do percurso
  , pista       :: Propriedades -- ^ as propriedades do percurso
  , carros      :: [Carro]      -- ^ o estado do carro de cada jogador
  , nitros      :: [Tempo]      -- ^ a quantidade de nitro disponível para cada jogador
  , historico   :: [[Posicao]]  -- ^ o histórico de posições de cada jogador
  }
  deriving (Eq,Read,Show)

-- | As propriedades físicas de um percurso.
data Propriedades = Propriedades 
  { k_atrito    :: Double -- ^ o atrito do piso
  , k_pneus     :: Double -- ^ o atrito dos pneus 
  , k_acel      :: Double -- ^ a intensidade da aceleração
  , k_peso      :: Double -- ^ o peso do carro
  , k_nitro     :: Double -- ^ a intensidade do nitro
  , k_roda      :: Double -- ^ a sensibilidade do guiador
  }
  deriving (Eq,Read,Show)

-- | As ações que podem ser tomadas por cada jogador em cada instante.
data Acao = Acao 
  { acelerar :: Bool      -- ^ se está a acelerar
  , travar   :: Bool      -- ^ se está a travar
  , esquerda :: Bool      -- ^ se está a curvar para a esquerda
  , direita  :: Bool      -- ^ se está a curvar para a direita
  , nitro    :: Maybe Int -- ^ se o nitro está ativo em algum jogador
  }
  deriving (Eq,Read,Show)
