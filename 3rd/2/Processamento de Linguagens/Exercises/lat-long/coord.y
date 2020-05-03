%{
#include <stdio.h>

extern int yylex();
int yyerror();
%}

%union{
  float vreal;
}

%token ERRO num

%type <vreal> num

%%

ListCoord : ListCoord Coord
          | Coord
          ;


Coord : '(' num ',' num ')'   {
      if (($2 >= -90 && $2 <= +90) &&  ($4 >= -180 && $4 <= +180)) printf("Válido\n");
      else printf("Inválido\n");
}
      ;

%%

int main() {
  yyparse();
  return 0;
}

int yyerror() {
  printf("Erro sintático...\n");
  return 0;
}

