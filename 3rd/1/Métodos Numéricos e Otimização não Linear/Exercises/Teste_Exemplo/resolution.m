%% Métodos Numéricos e Otimização não Linear
% Teste Tipo: _Prático-Laboratorial_

format long

%% Questão 1

x_inicial = [0 0.1];

options = optimset('TolX',0.01,'TolFun',0.1);
[x, fval, exitflag, output] = fsolve(@equation_1, x_inicial, options)


%% Questão 2

x_inicial = 0.04;

options = optimset('TolX', 0.1);
[x, fval, exitflag, output] = fsolve(@equation_2, x_inicial, options)


%% Questão 3

% | $x_i$    | 1.5 | 2.0 | 2.2 | 3.0 | 3.8  | 4.0 |
% |----------|-----|-----|-----|-----|------|-----|
% | $f(x_i)$ | 4.9 | 3.3 | 3.0 | 2.0 | 1.75 | 1.5 |

xi = [1.5 2.0 2.2 3.0 3.8 4.0];
f_xi = [4.9 3.3 3.0 2.0 1.75 1.5];

% escolhemos os 3 pontos mais próximos
est_grau_2 = polyfit(xi(2:4), f_xi(2:4), 2);

%%
% a)
x = 2.8;
polyval(est_grau_2, x)

%%
% b)
est_grau_2
%%
% $f(x) = 0.249999999999990 * x^2 + (-2.549999999999950) * x + 7.399999999999936$

%%
% c)
x = 2.5;
spline(xi, [-2 f_xi 3], x)

%%
% d)
est_cubica = spline(xi, [-2 f_xi 3]);
est_cubica.coefs
%%
% excluindo o terceiro segmento (terceira linha)
% $$(1.681348086453748 * (X - 2.2)^3) + (-1.330162444933926 * (X - 2.2)^2)
% + (-1.261932819383257 * (X - 2.2)) + (3.000000000000000)$$


%% Questão 4

t = [0 10 15 25 30 48 60 70 90];
v = [0 10 30 25 10 28 40 42 30];

trapz(t,v)

%% Questão 5
% $\int_0^{10} x \times ( 1 - e^{-x}) + x^3 dx$

integral(@(x) x .* (1 - exp(-x)) + x .^ 3, 0, 10) % também há o quad e quadl