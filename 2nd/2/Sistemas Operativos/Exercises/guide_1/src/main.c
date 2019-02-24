#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <fcntl.h>
#include <unistd.h>

#define SIZE_TO_WRITE 10*1024*1024
#define BUFFER_SIZE 100
#define N 1024

void createFile(const char *path, char ch) {
    int i, fd = open(path, O_CREAT | O_TRUNC | O_WRONLY, 0777);
    char buf[BUFFER_SIZE];


    for (i = 0; i < BUFFER_SIZE; i++) {
        buf[i] = ch;
    }

    for (i = 0; i < SIZE_TO_WRITE; i += BUFFER_SIZE) {
        write(fd, buf, BUFFER_SIZE);
    }

    close(fd);
}

void mycat() {
    char byte;
    ssize_t res = 0;

    do {
        res = read(0, &byte, 1);
        write(1, &byte, 1);
    } while(res != 0);
}

void mycat2() {
    char buf[BUFFER_SIZE];
    ssize_t res = 0;

    do {
        res = read(0, buf, BUFFER_SIZE);
        write(1, buf, res);
    } while(res != 0);
}

ssize_t readln(int fildes, void *buf, size_t nbyte) {
    ssize_t res;
    int i = 0;

    while (i < nbyte && (res += read(fildes, buf + i, 1) > 0)) {
        if (((char *) buf)[i] == '\n') {
            return i;
        }

        i += res;
    }

    return -1;
}

/**
 * Important
 * @param argc quantos argumentos
 * */
int main(int argc, char **argv) {

    if (argc < 1) {
        printf("Unexpected number of arguments\n");
        return -1;
    }

    char buffering[N];

    /* createFile(argv[1], 'a'); */
    /* mycat(); */
    /* mycat2(); */

    readln(0, buffering, N);

    return 0;
}

