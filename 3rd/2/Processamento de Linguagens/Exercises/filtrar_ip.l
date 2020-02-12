%%
((\d{1,3})\.){3}(\d{1,3}) { // IPv4
  printf("%s", yytext);
// Exercício Nº 13: Endereços IP
}

([0-9a-f]{1,4}:){7}[0-9a-f]{1,4} { // IPv6
  printf("%s", yytext);
}
. ;

