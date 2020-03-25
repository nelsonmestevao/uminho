%{
#include "y.tab.h"
%}

%%

[ \t\n\r]   ;

\(          { return yytext[0]; }

\)

%%
