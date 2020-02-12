%%
(\.|\_)\d+[a-zA-Z]{3,}(\_|[a-zA-Z])$ { // Exercício Nº 12: Username Alien
  printf("%s: VÁLIDO\n", yytext);
}

.+$ printf("%s: INVÁLIDO\n", yytext);

\n ;

