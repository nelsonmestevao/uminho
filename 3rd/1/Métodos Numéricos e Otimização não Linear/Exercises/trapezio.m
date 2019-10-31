% para tabelas, regra do trapézio

x = 1:1:4
y = 1:1:4

r = sprintf('Resultado: %d',trapz(x,y));

disp(r)
