% vim: syntax=prolog
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

mdc( X,Y,R ) :-
  X > Y,
  X1 is X-Y,
  mdc( X1,Y,R ).
mdc( X,Y,R ) :-
  Y > X,
  Y1 is Y-X,
  mdc( X,Y1,R ).
mdc( X,X,X ).

%------------------------------------------------------------------------------

fib(0,0).
fib(1,1).
fib(N,R) :-
  N1 is N - 1,
  N2 is N - 2,
  fib(N1, R1),
  fib(N2, R2),
  R is R1 + R2.

