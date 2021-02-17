OBJECTS=lodepng.o mandelbrot.o
CC ?= gcc
FLAGS_OPENMP ?= -fopenmp
CFLAGS = -g -O0 $(FLAGS_OPENMP)
LINKERFLAGS=-lm

release debug: clean $(OBJECTS)
	$(CC) $(CFLAGS) -Wall -o mandelbrot $(OBJECTS) $(LINKERFLAGS)

mandelbrot.o:mandelbrot.c
	$(CC) $(CFLAGS) -c -o$@ $?

lodepng.o:lib/lodepng.c
	$(CC) $(CFLAGS) -c -o$@ $?

run go:
	./mandelbrot && eog out.png

clean:
	rm -f *.o mandelbrot out.png
