%{
/* Declaracoes C diversas */
%}

Abrev ER
%%
ER       { ; }
{Abrev}  { AccaoSemantica em C; }
%%
int yywrap()
{ return(1); }

int main()
{ yylex(); return 0; }
