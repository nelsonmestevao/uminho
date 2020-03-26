% vim: syntax=prolog
%-----------------------------------------------------------------------------
% SRCR
%-----------------------------------------------------------------------------

% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :-
  Questao, !, fail.
nao( Questao ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado demo: Questao,Resposta -> {V,F}
%                            Resposta = { verdadeiro,falso,desconhecido }

demo( Questao,verdadeiro ) :-
  Questao.
demo( Questao,falso ) :-
  -Questao.
demo( Questao,desconhecido ) :-
  nao( Questao ),
  nao( -Questao ).

%--------------------------------- - - - - - - - - - questãao i


voa( X ) :-
  ave( X ),nao( excecao( voa( X ) ) ).

voa( X ) :-
  excecao( -voa( X ) ).

%--------------------------------- - - - - - - - - - -  questãao ii


-voa( X ) :-
  mamifero( X ),nao( excecao( -voa( X ) ) ).  % o morcego voa....
-voa( X ) :-
  excecao( voa( X ) ).