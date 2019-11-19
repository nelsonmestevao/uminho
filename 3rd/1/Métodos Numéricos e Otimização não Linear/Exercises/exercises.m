%% 57)

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

%%

clear all