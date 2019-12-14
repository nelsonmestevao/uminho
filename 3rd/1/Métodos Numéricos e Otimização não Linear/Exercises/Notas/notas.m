%% Notas

% exitflag < 0 -> o processo não convergiu
% exitflag = 0 -> não significa que não convergiu, apenas temos de aumentar o número de iterações
% exitflag > 0 -> o processo convergiu
% tolx -> ε1
% tolfun -> ε2
% Colocar “.” antes das operações se estivermos a trabalhar com vetores


%% Mínimos Quadrados

% Polinomial

x = [1 3 5 7 20] % variável independente
f = [800 2310 3090 3940 8000] % variável dependente
[p3, r] = polyfit(x, f, 3) % polinómio de grau 3
S = r.normr^2 % resíduo 
% $p_3 = 2.0387 x^3 - 67.3815 x^2 + 934.1362 x - 39.4401$
val = polyval(p3, 10) % calcula o valor do polinómio para x = 10

% Não Polinomial (Exercício 57)

x = [1.5 2.0 3.0 4.0];
f = [4.9 3.3 2.0 1.5];

% a)

[p1, r] = polyfit(x, f, 1);

polyval(p1, 2.5);

S_p1 = r.normr ^ 2;

% b)

[c, S] = lsqcurvefit(@(x1, xdata) x1(1) ./ xdata + x1(2) * xdata, [1 1], x, f) % este vetor tem a mesma dimensão dos parâmetros e é [1,1] se não for dito nada

mq(c, 2.5)


%% Quasi-Newton

optimset fminunc

% [x,f,exitflag,output] = fminunc (‘m_file’,x0,op,parametros)
op = optimset('HessUpdate', 'dfp') % por defeito é bfgs, usar se pedir a fórmula de atualização dfp

% Exercício 1.1 (ver aluffi)
op = optimset('gradobj', 'on') % para usar o gradiente, temos de fornecer as derivadas


%% Nelder-Mead
optimset fminsearch

op = optimset('display', 'iter', 'TolX', 1e-20, 'MaxFunEvals', 10000, 'MaxIter', 10000)

op = optimset('display', 'iter') % para se ver as iterações

y = [1 1];

[x, f, exitflag, output] = fminsearch(@(x) max(abs(x(1)), abs(x(2) - 1)), y, op)
