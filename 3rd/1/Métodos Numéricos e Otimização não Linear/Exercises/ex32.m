% variável independente
x = [1 3 5 7 20]

% variável dependente
f = [800 2310 3090 3940 8000]

% para se fazer o polinímio que se ajusta aos pontos
% só se utiliza os pontos entre os índices (2-1) e (5-1)
p3 = polyfit(x(2:5), f(2:5), 3)

% calcula o valor do polinómio para x = 10
val = polyval(p3, 10)