%% Métodos Numéricos e Otimização não Linear
% Teste 2: _Prático-Laboratorial_ (14/12/2019)

clear all
clc

%% Questão 1

x = [0 3 6 10 11 15];
f = [6.7 8.2 9.5 12 14.9 18.5];

l = @(c, x) c(1) * (x .^ 3) + c(2) * exp(1 ./ (x + 1))

[c, S] = lsqcurvefit(l, [5 5], x, f)


%% Questão 2

% a)

l = @(x) 2 * x(1) ^ 3 + x(2) ^ 2 - 0.3 * cos(3 * pi * x(1)) + 0.4 * cos(4 * pi * x(2)) + 0.5;

x0 = [1 1];

[x, f, exitflag, output] = fminunc (l, x0)


%% b)

op = optimset('HessUpdate', 'dfp', 'gradobj', 'on', 'TolX', 1e-8);

x0 = [3 3];

[x, f, exitflag, out] = fminunc(@quasi, x0, op)


%% Questão 3

op = optimset('display', 'iter', 'TolX', 1e-6);

x0 = [10 10];

a = sqrt(1:10);

[x, f, exitflag, out] = fminsearch(@sombreiro, x0, op, a)


%%
clear all
clc