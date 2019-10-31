function [f] = equation_1(x)
  f(1) = -5 * x(1) + 3 * sin(x(1)) + cos(x(2));
  f(2) = 4 * cos(x(1)) + 2 * sin(x(2)) - 5 * x(2);
end
