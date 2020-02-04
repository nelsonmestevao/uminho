%{
#include <stdio.h>
#include <strings.h>
/* Declaracoes C diversas */
%}

%token
%type

%%
X : Y
  | W
  ;
%%

int yyerror(char *s)
{
  fprintf(stderr, "ERRO: %s \n", s);
}

int main()
{
  yyparse();
  return(0);
}
