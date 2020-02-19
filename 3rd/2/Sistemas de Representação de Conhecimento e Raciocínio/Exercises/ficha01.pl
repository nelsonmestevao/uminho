% vim: syntax=prolog
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Base de Conhecimento com informacao genealogica.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% Extensao do predicado filho: Filho,Pai -> {V,F}

filho(joao,jose).
filho(jose,manuel).
filho(carlos,jose).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pai: Pai,Filho -> {V,F}


pai(paulo,filipe).
pai(paulo,maria).


pai( P,F ) :-
    filho( F,P ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% Extensao do predicado avo: Avo,Neto -> {V,F}

avo(A, N) :-
    pai(A, P), filho(N, P).

avo(A, N) :-
    neto(N, A).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% Extensao do predicado bisavo: Bisavo,Bisneto -> {V,F}









%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% Extensao do predicado descendente: Descendente,Ascendente -> {V,F}















%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% Extensao do predicado descendente: Descendente,Ascendente,Grau -> {V,F}





