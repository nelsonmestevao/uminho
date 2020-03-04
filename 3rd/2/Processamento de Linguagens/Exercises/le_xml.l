%{
int abre = 0, fecha = 0, atributos = 0, commentarios = 0, selfclosing = 0;
char * id;
%}

%x abertura xml
qname         [a-zA-Z][a-zA-Z0-9_\-.:]*
whitespace    [ \t]*

%%

                    BEGIN 0;

[ \t\n]             ;

<xml>\<!\-\-[^-]*\-\-\>   commentarios++;

\<\?xml[^?]+\?\>    { printf("XML\n"); BEGIN xml; }

<xml>\<\/[^>]+\>    { yytext[yyleng - 1] = '\0'; fecha++; printf(")%s\n", yytext + 2); }

<xml>\<{qname}      { id = strdup(yytext + 1); printf("(%s\n", yytext + 1); BEGIN abertura; }

<abertura>\/\>      { selfclosing++; printf(")%s\n", id); BEGIN xml; }

<abertura>\>        { abre++; BEGIN xml; }

<abertura>{qname}{whitespace}={whitespace}\"[^"]+\"   { atributos++; printf(yytext); }

<<EOF>>           { printf("\nAbrem: %d, Fecham: %d, Self-closing tags: %d, Atributos: %d, Comentários: %d\n", abre, fecha, selfclosing, atributos, commentarios); return 0; }

