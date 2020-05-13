%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern int yylex();
extern int yyerror();
%}

%token num DOISPONTOS ERRO

%%

Lista : Lista '[' Elems ']'
      | '[' Elems ']'
      | '[' ']'
      ;

Elems : Lista
      | num
      | Intervalo
      | num ',' Elems
      | Intervalo ',' Elems
      | Elems ',' num
      | Elems ',' Intervalo
      ;

Intervalo: num DOISPONTOS num

%%

int yyerror(char *s){
    printf("ERRO: %s\n",s);
    return 0;
}

int main(){
    yyparse();
    return 0;
}




