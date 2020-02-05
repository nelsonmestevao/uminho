%%
[0-9]{4}-(0[0-9]|1[0-2])-(0[1-9]|1[0-2]) {
  int dia = atoi(yytext + 8);
  int mes = atoi(yytext + 5);
  printf("%s", yytext);
}
. ;

