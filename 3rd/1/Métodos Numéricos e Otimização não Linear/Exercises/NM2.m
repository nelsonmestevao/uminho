function [f] = NM2(x)
    f = max([ x(1).^2 + x(2).^4, (2 - x(1)).^2 + (2 - x(2)).^2, 2 * exp(-x(1) + x(2)) ]);
end
