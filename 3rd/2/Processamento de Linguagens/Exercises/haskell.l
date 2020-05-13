%{
#include "y.tab.h"
%}
%option noyywrap
%%
\[                          { return(yytext[0]); }
\]                          { return(yytext[0]); }
\,                          { return(yytext[0]); }
[0-9]+                      { return(num); }
\.\.                        { return(DOISPONTOS); }
[ \t\n\r]                   { ; }

.                           { return(ERRO); }
%%
