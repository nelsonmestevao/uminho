%{
#include "y.tab.h"
%}
%option noyywrap
%%
[()*,=]				{return(yytext[0]);}
(?i:SELECT) 		{return(SELECT);}
(?i:FROM) 			{return(FROM);}
(?i:WHERE) 			{return(WHERE);}
(?i:ORDER) 			{return(ORDER);}
(?i:GROUP) 			{return(GROUP);}
(?i:BY) 			{return(BY);}
(?i:AND) 			{return(AND);}
(?i:OR) 			{return(OR);}
(?i:AS) 			{return(AS);}
(?i:NOT) 			{return(NOT);}
[a-zA-Z]+			{yylval.str = strdup(yytext); return(id);}
[0-9]+(\.[0-9]+)?	{yylval.valor = atof(yytext); return(num);}
.|\n 				{;}
%%