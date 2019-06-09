#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>
#include <unistd.h>

/**
 * Importante
 * @param argc quantos argumentos
 * */
int main(int argc, char **argv) {
    pid_t pid;

    if ((pid = fork()) == 0) {
        printf("Este é o processo filho: L1\n");
        printf("Indentificador do processo L1:\t%d\n", getpid());
        printf("Identificador do pai do processo L1:\t%d\n", getppid());
    } else {
        printf("Este é o processo pai: L0\n");
        printf("Indentificador do processo L0:\t%d\n", getpid());
        printf("Identificador do pai do processo L0:\t%d\n", getppid());
    }

    return 0;
}
