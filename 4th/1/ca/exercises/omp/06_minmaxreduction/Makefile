PROG=MinMaxReduction

CC ?= gcc
FLAGS_OPENMP ?= -fopenmp

debug:
	$(CC) -Wall -g $(FLAGS_OPENMP) -O0 ${PROG}.c -o ${PROG}.exe -lm

release:
	$(CC) -Wall -g $(FLAGS_OPENMP) -O3 ${PROG}.c -o ${PROG}.exe -lm

run go:
	ulimit -s 1000000 && OMP_DYNAMIC=false ./${PROG}.exe

clean:
	rm -f ${PROG}.exe ${PROG}.o *~
