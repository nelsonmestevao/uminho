function [M] = mq(c,x)
    M = c(1) ./ x + c(2)*x;
end