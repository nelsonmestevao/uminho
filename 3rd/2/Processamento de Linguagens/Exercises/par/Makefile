
par: y.tab.o lex.yy.o
	gcc -o $@ $^ -lfl

y.tab.o: y.tab.c
	gcc -c $^

lex.yy.o: lex.yy.c
	gcc -c $^

y.tab.c y.tab.h: par.y
	yacc -d $^

lex.yy.c: par.l y.tab.h
	flex par.l

clean:
	rm -rf par lex.yy.c y.tab.h y.tab.c lex.yy.o y.tab.o

