PROG=quicksort

CXX ?= g++
FLAGS_OPENMP ?= -fopenmp

debug:
	$(CXX) -Wall -g $(FLAGS_OPENMP) -O0 ${PROG}.cpp -o ${PROG}.exe

release:
	$(CXX) -Wall -g $(FLAGS_OPENMP) -O3 ${PROG}.cpp -o ${PROG}.exe

run go:
	./${PROG}.exe

clean:
	rm -f ${PROG}.exe ${PROG}.o *~
