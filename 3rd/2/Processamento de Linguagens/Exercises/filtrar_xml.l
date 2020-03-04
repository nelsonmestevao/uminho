%{
int abre = 0, fecha = 0, atributos = 0, commentarios = 0, selfclosing = 0;
%}

%x abertura xml
qname         [a-zA-Z][a-zA-Z0-9_\-.:]*
whitespace    [ \t]*

%%

                    BEGIN 0;

[ \t\n]             ;

<xml>\<!\-\-[^-]*\-\-\>   commentarios++;

\<\?xml[^?]+\?\>    BEGIN xml;

<xml>\<\/[^>]+\>    fecha++;

<xml>\<{qname}      BEGIN abertura;

<abertura>\/\>      { selfclosing++; BEGIN xml; }

<abertura>\>        { abre++; BEGIN xml; }

<abertura>{qname}{whitespace}={whitespace}\"[^"]+\"   atributos++;

<<EOF>>           { printf("\nAbrem: %d, Fecham: %d, Self-closing tags: %d, Atributos: %d, Comentários: %d\n", abre, fecha, selfclosing, atributos, commentarios); return 0; }

