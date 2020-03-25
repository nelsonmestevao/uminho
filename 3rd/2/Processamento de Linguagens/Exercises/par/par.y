%{
#include <stdio.h>
extern int yylex();
%}

%token ERRO
%%

Par : '(' Par ')' Par
    |
    ;

%%

int yyerror() {
  printf("Erro sintático...\n");
  return 0;
}

int main() {
  yyparse();
  return 0;
}
