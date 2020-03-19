%{
#include <stdio.h>
int yylex();
int yyerror(char* s);
%}

%union {int n;}
%type <n> d i ints

%%     // (1,2,3)

lista : '(' ints ')'  { printf("cheguei ao fim %d!\n", $2); return 0 ; }
      ;

ints : i           { $$ = $1; }
     | i ',' ints  { $$ = $1 + $3; }
     ;

i : i d { $$ = $1 * 10 + $2; }
  | d { $$ = $1; }
  ;

d : '0' { $$ = 0; }
  | '1' { $$ = 1; }
  | '2' { $$ = 2; }
  | '3' { $$ = 3; }
  | '4' { $$ = 4; }
  | '5' { $$ = 5; }
  | '6' { $$ = 6; }
  | '7' { $$ = 7; }
  | '8' { $$ = 8; }
  | '9' { $$ = 9; }
  ;

%%

int yylex(){
   return getchar();
}

int main(){
   yyparse();
   return 0;
}

int yyerror(char* s){
   printf("erro: %s\n",s);
}

