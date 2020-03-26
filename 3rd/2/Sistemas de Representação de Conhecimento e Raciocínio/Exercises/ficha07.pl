% vim: syntax=prolog
%-----------------------------------------------------------------------------
% SRCR - Ficha 7
%-----------------------------------------------------------------------------
% SICStus PROLOG: Declaracoes iniciais
:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).
%-----------------------------------------------------------------------------
% SICStus PROLOG: definicoes iniciais
:-op(900,xfy,'::').
:-dynamic jogo/3.
:-dynamic excecao/1.
%-----------------------------------------------------------------------------

%-----------------------------------------------------------------------------
% questão i

jogo( 1,aa,500 ).



%-----------------------------------------------------------------------------
% questão ii

jogo( 2,bb,xpto0123 ).
excecao( jogo( Jogo,Arbitro,Ajudas ) ) :-
  jogo( Jogo,Arbitro,xpto0123 ).

%-----------------------------------------------------------------------------
% questão iii

excecao( jogo( 3,cc,500 ) ).
excecao( jogo( 3,cc,2500 ) ).

%-----------------------------------------------------------------------------
% questão iv

excecao( jogo( 4,cc,valor ) ) :-
  valor >= 250, valor < 750.

%-----------------------------------------------------------------------------
% questão v

nulo(xpto).

excecao( jogo( 5,ee,xpto )).

%-----------------------------------------------------------------------------
% questão vi

excecao( jogo( 6,ff,250)).

excecao( jogo( 7,ff,valor ) ) :-
  valor > 5000.

%-----------------------------------------------------------------------------
% questão vii

-jogo( 7,gg,2500 ).

nulo( x7 ).

jogo( 7,gg, x7).

%-----------------------------------------------------------------------------
% questão ix

excecao(9,ii,Ajudas):-
  Ajudas >= Inf,
  Ajudas < Sup,
  cerca(3000,Sup,Inf).


