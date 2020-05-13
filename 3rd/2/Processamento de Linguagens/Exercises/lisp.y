%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern int yylex();
extern int yyerror();

float soma = 0;
int comp = 0;
%}

%union {float valor;}
%token pal «
%token <valor>num

%%

Lisp : Lisp SExp
     | SExp
     ;

SExp : pal
     | num { soma += $1; }
     | '(' SExpLst ')'
     ;

SExpLst : SExp SExpLst { comp++; }
        |
        ;

%%

int yyerror(char *s){
    printf("ERRO: %s\n",s);
    return 0;
}

int main(){
    yyparse();
    printf("Comprimento da lista %d\n",comp);
    printf("Soma dos elementos da lista %f\n",soma);
    return 0;
}

