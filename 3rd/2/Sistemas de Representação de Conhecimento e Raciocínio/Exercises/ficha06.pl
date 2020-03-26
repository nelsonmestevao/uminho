% vim: syntax=prolog
%-----------------------------------------------------------------------------
% SRCR - Ficha 6
%-----------------------------------------------------------------------------
% SICStus PROLOG: Declaracoes iniciais
:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).
%-----------------------------------------------------------------------------
% SICStus PROLOG: definicoes iniciais
:- dynamic '-'/1.
:- dynamic mamifero/1.
:- dynamic morcego/1.
:- op( 1100,xfy,'??' ).
%-----------------------------------------------------------------------------

% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :-
  Questao, !, fail.
nao( Questao ).

%-----------------------------------------------------------------------------
% Extensao do meta-predicado demo: Questao,Resposta -> {V,F}
%                            Resposta = { verdadeiro,falso,desconhecido }

demo( Questao,verdadeiro ) :-
  Questao.
demo( Questao,falso ) :-
  -Questao.
demo( Questao,desconhecido ) :-
  nao( Questao ),
  nao( -Questao ).

%-----------------------------------------------------------------------------
% questão i

voa( X ) :-
  ave( X ),nao( excecao( voa( X ) ) ).
voa( X ) :-
  excecao( -voa( X ) ).


%-----------------------------------------------------------------------------
% questão ii
-voa( X ) :-
  mamifero( X ),nao( excecao( -voa( X ) ) ).  % o morcego voa....
-voa( X ) :-
  excecao( voa( X ) ).

ave(tweety).
excecao(voa(tweety)).

ave(pitigui).

ave(X) :- canario(X).

ave(X) :- periquito(X).

canario(piupiu).

mamifero(silvestre).

mamifero(X) :- cao(X).

mamifero(X) :- gato(X).

cao(bobby).

ave(X) :- avestruz(X).
excecao( voa( X ) ) :- avestruz(X).

ave(X) :- pinguim(X).
excecao( voa( X ) ) :- pinguim(X).

avestruz(trux).

pinguim(pingu).

mamifero(X) :- morcego(X).
excecao( -voa( X ) ) :- morcego(X).

morcego(batman).

