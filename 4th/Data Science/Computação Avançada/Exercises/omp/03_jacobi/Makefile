PROG=jacobi

CC ?= gcc
FLAGS_OPENMP ?= -fopenmp

debug:
	$(CC) -Wall -g $(FLAGS_OPENMP) -O0 ${PROG}.c -o ${PROG}.exe -lm

release:
	$(CC) -Wall -g $(FLAGS_OPENMP) -O3 ${PROG}.c -o ${PROG}.exe -lm

run go:
	OMP_DYNAMIC=false ./${PROG}.exe < input

clean:
	rm -f ${PROG}.exe ${PROG}.o *~
