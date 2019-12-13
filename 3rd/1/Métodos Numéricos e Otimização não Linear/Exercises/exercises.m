%% Métodos Númericos e Otimização não Linear
% Exercícios Práticos                                            2019/2020

%%
clear all
clc

%%
format long

%% Exercício 57
% Mínimos Quadrados


xi = [1.5 2.0 3.0 4.0];

fxi = [4.9 3.3 2.0 1.5];

B0 = sum(xi) / 4

P1 = xi - B0

c0 = sum(fxi) / 4 

c1 = sum(fxi .* P1) / sum(P1 .^ 2)

B1 = sum(xi .* (P1 .^ 2)) / sum(P1 .^ 2)

C1 = sum(P1 .^ 2) / 4

P2 = (xi - B1) .* (xi - 2.625) - C1

c2 = sum(fxi .* P2) / sum(P2 .^ 2)

p1 = c0 + c1 .* P1

p2 = c0 + c1 .* P1 + c2 .* P2

phi1 = 1 ./ xi;
phi2 = xi;

matrize = [sum(phi1 .^ 2), sum(phi1 .* phi2);
          sum(phi1 .* phi2), sum(phi2 .^ 2)];

matrizd = [sum(fxi .* phi1); sum(fxi .* phi2)];

cs = matrize \ matrizd;

M = @(x) cs(1) / x - cs(2) * x;

s1 = sum((fxi - p1) .^ 2)

%% Exercício 57
% Método dos Mínimos Quadrados

x = [1.5 2.0 3.0 4.0];
f = [4.9 3.3 2.0 1.5];

% a)

[p1, r] = polyfit(x, f, 1)

polyval(p1, 2.5)

S_p1 = r.normr ^ 2

[p2, r] = polyfit(x, f, 2)

polyval(p2, 2.5)

% b)

S_p2 = r.normr ^ 2

[c, S] = lsqcurvefit(@mq, [1 1], x, f)

mq(c, 2.5)

%% Exercício 62
% DSC: 

delta = 2

f = @(x) - exp(0.4* x - 0.01 * x^2)

x1 = 30

f(x1)

x2 = x1 + delta

f(x2)

x_1 = x1 - delta

f(x_1)

x_2 = x_1 - 2 * delta

f(x_2)

x_3 = x_2 - 4 * delta

f(x_3)

x_4 = x_3 - 8 * delta

f(x_4)

% ponto medio
xm = (x_4 + x_3) / 2

f(xm)

DELTA = 8

%% MATLAB
%

%% 1.1
optimset fminunc

op = optimset('gradobj', 'on'); % para usar o gradiente

[x, f, exitflag, output] = fminunc(@aluffi, [-1;0.5], op)


%% 1.5 
op = optimset('HessUpdatee', 'dfp')

y = ones(1,10)

[x, f, exitflag, out, grad, hess] = fminunc(@QN5, y, op)


%% 2.1
optimset fminsearch;
op = optimset('display', 'iter');

y = [1 1];

[x, f, exitflag, out] = fminsearch(@NM1, y, op)


%% 2.2
op = optimset('display', 'iter');

y = [1 -0.1]

[x, f, exitflag, out] = fminsearch(@NM2, y, op)


%% 2.3
op = optimset('display', 'iter');

n = 2;
i = 1:n;

y(i) = i - (n/2 + 0.5);

[x, f, exitflag, out] = fminsearch(@NM3, y, op)


%%
op = optimset('display', 'iter', 'TolX', 1e-20, 'MaxFunEvals', 10000, 'MaxIter', 10000);

n = 5;
i = 1:n;

y(i) = i - (n/2 + 0.5);

[x, f, exitflag, out] = fminsearch(@NM3, y, op)


%% 2.4
op = optimset('display', 'iter');

n = 2;
i = 1:n;
y(i) = i - (n/2 + 0.5);

[x, f, exitflag, out] = fminsearch(@NM4, y, op)


%% 2.5
op = optimset('display', 'iter');

y = [-1 5];
w = 500;

[x, f, exitflag, out] = fminsearch(@NM5, y, op, w)


%% 2.6
op = optimset('display', 'iter');

y = ones(1, 4); 

[x, f, exitflag, out] = fminsearch(@NM6, y, op)


%%

clear all
clc