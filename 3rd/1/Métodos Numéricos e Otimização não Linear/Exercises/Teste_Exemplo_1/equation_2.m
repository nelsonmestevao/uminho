function [f] = equation_2(x)
  pp = 315; % preço a pronto pagamento
  p = 12; % numero de prestações
  pm = 24; % valor das prestações mensais
  e = 91; % valor de entrada
  f = ((1 - ((1 + x) ^ (-p))) / x) - ((pp - e) / pm);
end