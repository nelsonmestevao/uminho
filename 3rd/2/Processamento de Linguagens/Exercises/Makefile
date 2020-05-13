TRASH =  *.o *.yy.c *.tab.c *.tab.h *.out
p = lisp

run: build
	./$(p).out

build: $(p).out

$(p).out: y.tab.o lex.yy.o
	@gcc -o $@ $^ -lfl

y.tab.o: y.tab.c
	@gcc -c $^

lex.yy.o: lex.yy.c
	@gcc -c $^

y.tab.c y.tab.h: $(p).y
	@yacc -d $^

lex.yy.c: $(p).l y.tab.h
	@flex $(p).l

clean:
	@-rm $(TRASH)

