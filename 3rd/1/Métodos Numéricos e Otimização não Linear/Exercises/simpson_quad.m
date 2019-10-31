% quad(@função, a, b, tol); tol é a tolerancia e é opcional, a e b é o intervalo
% para o método de simpson

anonymous_function = @(x) x.^2+1./(x+1)

quad(anonymous_function, 0, 1, 0.0005)
