function [f] = NM3(x)
    n = length(x);
    f = n * max(x) - sum(x);
end
