#include <stdio.h>
#include <stdlib.h>

#include <signal.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/wait.h>

#include <fcntl.h>
#include <unistd.h>

#define N_ROWS 10
#define N_COLS 10

void handler_sigint(int signum) { _exit(2); }

int main(int argc, char* argv[]) {
    int num = atoi(argv[1]);
    int matrix[N_ROWS][N_COLS];
    // Array com os pids dos processos
    pid_t pids[N_ROWS];

    // Gerar valores aleatórios para matriz
    for (int i = 0; i < N_ROWS; i++) {
        for (int j = 0; j < N_COLS; j++) {
            matrix[i][j] = rand() % 100;
        }
    }

    // Mostrar matrix
    printf("ROWS: %d COLS: %d\n", N_ROWS, N_COLS);
    for (int i = 0; i < N_ROWS; i++) {
        for (int j = 0; j < N_COLS; j++) {
            printf("%2d ", matrix[i][j]);
        }
        printf("\n");
    }

    if (signal(SIGINT, handler_sigint) == SIG_ERR) {
        perror("SIGINT failed");
    }

    for (int i = 0; i < N_ROWS; i++) {
        if ((pids[i] = fork()) == 0) {
            for (int j = 0; j < N_COLS; j++) {
                if (matrix[i][j] == num) _exit(1);  // encontrou
            }
            _exit(0);  // não encontrou
        }
    }

    int pid_dead, status;
    while ((pid_dead = wait(&status)) !=
           -1) {  // enquanto houver processos por terminar
        int i;
        for (i = 0; i < N_ROWS && pid_dead != pids[i]; i++)
            ;          // o i tem o index do que morreu
        pids[i] = -2;  // este não vale a pena tentar matar

        if (WEXITSTATUS(status) == 1) {  // é porque encontrou
            printf("O número %d estava na linha %d\n", num, i);
            for (int j = 0; j < N_ROWS; j++) {
                if (pids[j] != -2) kill(pids[j], SIGINT);
            }
        } else {
            if (WEXITSTATUS(status) == 2) {  // morreu com SIGINT
                printf("Linha %d morreu por irmão\n", i);

            } else {
                printf("Nada na linha %d\n", i);
            }
        }
    }

    return 0;
}
