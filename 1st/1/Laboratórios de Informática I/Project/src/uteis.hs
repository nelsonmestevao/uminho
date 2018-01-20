{- |
Função que converte radianos em graus.
-}
toDegrees :: Angulo -> Angulo
toDegrees rad = rad * 180 / pi

{- |
Função que converte coordenadas cartesianas em coordenadas polares.
-}
fromCartesian :: Velocidade -> Velocidade
fromCartesian (vx,vy) = (m,a)
              where
                m = sqrt (vx^2+vy^2) -- ^ modulo do vetor velocidade
                a = atan2 (-vy) vx   -- ^ angulo do vetor velocidade

{- |
Função que devolve só o tabuleiro de um jogo.
-}
getTabuleiroFromJogo :: Jogo -> Tabuleiro
getTabuleiroFromJogo (Jogo (Mapa pr tb) p cs ns hs) = tb

{- |
Função que devolve só a lista de carros de um Jogo.
-}
getCarrosFromJogo :: Jogo -> [Carro]
getCarrosFromJogo (Jogo m p (c:cs) ns hs) = c:cs

{-|
Função que devolve só as propriedades de um jogo.
-}
getPropriedadesFromJogo :: Jogo -> Propriedades
getPropriedadesFromJogo (Jogo m p (c:cs) ns hs) = p

{- |
A função @sumPair@ é usada para dois pares.
-}
sumPair :: Num a => (a,a) -> (a,a) -> (a,a)
sumPair (a,b) (c,d) = (a+c,b+d)
