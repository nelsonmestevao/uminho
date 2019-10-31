h = 0.125

x = 0:h:1

% como o x é vetor e queremos ponto a ponto, temos de colocar um ponto antes
% das operações aritméticas
y = x.^2 + 1./(x+1)

simpson = (h/3) * (y(1) + 4*y(2) + 2*y(3) + 4*y(4) + 2*y(5) + 4*y(6) + 2*y(7) + 4*y(8) + y(9))
