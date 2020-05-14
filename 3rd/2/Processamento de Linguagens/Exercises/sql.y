%{
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
extern int yylex();
extern int yyerror();
%}

%union {float valor; char* str;}
%token SELECT FROM WHERE ORDER GROUP BY AND OR AS NOT
%token <str>id
%token <valor>num

%%
STMSQL : Projection Source Filter Optns
       ;
Projection : SELECT Cols
           ;
Source : FROM Tabs
       ;
Filter : WHERE '(' Conds ')'
       ;
Optns :
      | Optns Optn
      ;
Optn : ORDER BY id
     | GROUP BY id
     ;
Tabs : Tabs ',' Tab
     | Tab
     ;
Tab : id
    | id AS id
    ;
Cols : '*'
     | Ids
     ;
Ids : id
    | Ids ',' id
    ;
Conds : Expb
      | Expb Opr Expb
      ;
Opr : '='
    ;
Expb : Termo
     | Expb OR Termo
     ;
Termo : Fator
      | Termo AND Fator
      ;
Fator : id
      | num
      | NOT Fator
      | '(' Conds ')'
      ;
%%

int yyerror(char *s) { printf("ERRO: %s\n", s); return(0); }

int main(){
  yyparse();
  return 0;
}
