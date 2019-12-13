function [f] = QN5(x)
    i = 1 : length(x);
    f = 1 + (1/4000) * sum(x .^ 2) - prod(cos(x ./ sqrt(i)));
end