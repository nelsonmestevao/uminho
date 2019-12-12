function [f] = NM1(x)
    f = max(abs(x(1)), abs(x(2) - 1));
end

