PROG=hello

CC ?= gcc
FLAGS_OPENMP ?= -fopenmp

debug:
	$(CC) -Wall -g $(FLAGS_OPENMP) -O0 ${PROG}.c -o ${PROG}.exe

release:
	$(CC) -Wall -g $(FLAGS_OPENMP) -O3 ${PROG}.c -o ${PROG}.exe

run go:
	./${PROG}.exe

clean:
	rm -f ${PROG}.exe ${PROG}.o *~
