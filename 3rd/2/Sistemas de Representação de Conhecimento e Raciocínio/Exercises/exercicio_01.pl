% vim ft=prolog
%-----------------------------------------------------------------------------
% SRCR - Exercício Individual 1
%-----------------------------------------------------------------------------
% SICStus PROLOG
:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).
%-----------------------------------------------------------------------------
:- op( 900,xfy,'::' ).
:- dynamic pais/3.
:- dynamic nascimento/4.
%-----------------------------------------------------------------------------

nao( Questao ) :-
  Questao, !, fail.
nao( Questao ).

evolucao( Termo ) :-
  solucoes( Invariante,+Termo::Invariante,Lista ),
  insercao( Termo ),
  teste( Lista ).

insercao( Termo ) :-
  assert( Termo ).
insercao( Termo ) :-
  retract( Termo ),!,fail.

teste( [] ).
teste( [R|LR] ) :-
  R,
  teste( LR ).

involucao( Termo ) :-
  solucoes( Invariante,-Termo::Invariante,Lista ),
  remocao( Termo ),
  teste( Lista ).

remocao( Termo ) :-
  retract( Termo ).
remocao( Termo ) :-
  assert( Termo ),!,fail.

demo( Questao,verdadeiro ) :-
  Questao.
demo( Questao,falso ) :-
  -Questao.
demo( Questao,desconhecido ) :-
  nao( Questao ),
  nao( -Questao ).

%-----------------------------------------------------------------------------

-pais(P,M,F) :-
  nao(pais(P,M,F)),
  nao(excecao(pais(P,M,F))).

-nascimento(N,D,M,A) :-
  nao(nascimento(N,D,M,A)),
  nao(excecao(nascimento(N,D,M,A))).

%-----------------------------------------------------------------------------
% i.
% O Abel e a Alice são os pais da Ana; a Ana nasceu no dia 01/01/2010;
pais( abel,alice,ana ).
nascimento( ana,01,01,2010 ).

%-----------------------------------------------------------------------------
% ii.
% O António e a Alberta são os pais do Aníbal; o Aníbal nasceu no dia
% 02/01/2010;
pais( antonio,alberta,anibal ).
nascimento( anibal,02,01,2010 ).

%-----------------------------------------------------------------------------
% iii.
% O Brás e a Belém são os pais da Berta e do Berto; a Berta e o Berto nasceram
% no dia 02/02/2010;
pais( bras,belem,berta ).
pais( bras,belem,berto ).
nascimento( berta,02,02,2010 ).
nascimento( berto,02,02,2010 ).

%-----------------------------------------------------------------------------
% iv.
% A Cátia nasceu no dia 03/03/2010;

nascimento( catia,03,03,2010 ).

%-----------------------------------------------------------------------------
% v.
% A Cátia é a mãe do Crispim, mas desconhece-se se o pai é o Celso ou o Caio;

excecao(pais( celso,catia,crispim )).
excecao(pais( caio,catia,crispim )).

%-----------------------------------------------------------------------------
% vi.
% O Daniel é o pai do Danilo, mas desconhece-se o nome da mãe; o Danilo nasceu
% no dia 04/04/2010;
pais( daniel,mae_desconhecida,danilo ).
excecao(pais(P,M,F)) :- pais( P,mae_desconhecida,F ).
nascimento( danilo,04,04,2010 ).

%-----------------------------------------------------------------------------
% vii.
% O Elias e a Elsa são os pais do Eurico; O Eurico nasceu no mês de maio de
% 2010, embora se desconheça se foi no dia 5, no dia 15 ou no dia 25;
pais(elias,elsa,eurico).

excecao(nascimento( eurico,05,05,2010 )).
excecao(nascimento( eurico,15,05,2010 )).
excecao(nascimento( eurico,25,05,2010 )).

%-----------------------------------------------------------------------------
% viii.
% O Fausto não sabe se a filha se chama Fábia ou Octávia e desconhece-se o nome
% da mãe;
excecao(pais(fausto,mae_desconhecida,fabia)).
excecao(pais(fausto,mae_desconhecida,octavia)).
excecao(pais(P,M,F)) :- pais(P,mae_desconhecida,F).

%-----------------------------------------------------------------------------
% ix.
% O Guido e a Guida são os pais do Golias, mas como faleceram antes de
% registarem o filho, nunca será possível saber a data de nascimento do Golias;
pais(guido,guida,golias).

nascimento(golias,dia_impossivel,mes_impossivel,ano_impossivel).
excecao(nascimento(N,D,M,A)) :-
  nascimento(N,dia_impossivel,mes_impossivel,ano_impossivel).
nulo(dia_impossivel,mes_impossivel,ano_impossivel).

+nascimento(N,D,M,A) :: (solucoes((N,D,M,A),
(nascimento(golias,dia_impossivel,mes_impossivel,ano_impossivel),
  nao(nulo(dia_impossivel,mes_impossivel,ano_impossivel))), S),
  comprimento(S,N),N==0).

%-----------------------------------------------------------------------------
% x.
% Embora não se conheça a data de nascimento do Hélder, sabe-se que não nasceu
% no dia 8 de agosto de 2010;
excecao(nascimento(helder,D,M,A)) :- D \= 08, M \= 08, A \= 2010.

%-----------------------------------------------------------------------------
% xi.
% Desconhecendo-se o dia, sabe-se que o Ivo nasceu na primeira quinzena do mês
% de junho de 2010.
excecao(nascimento(ivo,D,06,2010)) :- D >= 1, D =< 15.

%-----------------------------------------------------------------------------

