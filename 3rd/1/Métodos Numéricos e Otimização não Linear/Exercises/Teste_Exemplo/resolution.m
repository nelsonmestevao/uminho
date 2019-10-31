% -----------------------------------------------------------------------------
% 1
% -----------------------------------------------------------------------------

format long

x_inicial = [0 0.1]

options=optimset('TolX',0.01,'TolFun',0.1)
[x, fval, exitflag, output] = fsolve('equation_1', x_inicial, options)


