#include <stdio.h>
#include <stdlib.h>

#include <sys/types.h>
#include <sys/wait.h>

#include <signal.h>
#include <unistd.h>

// PID do programa que está neste momento a correr
int fork_index = 0;
// Total de programas para se fazer o escalonamento (os por terminar)
int total_progs = 0;
// Array com os pids dos processos
pid_t *pids;

void troca_processos(int pid_stop, int pid_start) {
    kill(pid_stop, SIGSTOP);
    kill(pid_start, SIGCONT);
}

void handler_sigalrm(int signum) {
    troca_processos(pids[fork_index], pids[fork_index = ((fork_index + 1) % total_progs)]);
    alarm(1);
}

// Quando um filho morre, esta função faz o tratamento do seu sinal
void handler_sigchld(int signum) {
    int i;
    pid_t pid_dead;

    // descobre o filho que morreu
    while ((pid_dead = waitpid(-1, NULL, WNOHANG)) > 0) {
        for (i = 0; i < total_progs && pid_dead != pids[i]; i++)
            ;  // o i tem o index do que morreu

        total_progs--;  // morreu um, então há menos um para escalonar

        // remover o pid do que morreu da lista, dando shift de um para trás no
        // array de pids
        for (; i < total_progs; i++) pids[i] = pids[i + 1];
    }
}

// No macOS e na minha distribuição o SIGCONT é ignorado, então redefino o seu
// comportamento para não o ser com noop
void handler_sigcont(int signum) {}

int main(int argc, char **argv) {
    pids = (pid_t *)malloc(sizeof(pid_t) * (argc - 1));
    total_progs = argc - 1;

    if (signal(SIGCONT, handler_sigcont) == SIG_ERR) {
        perror("SIGCONT failed");
    }

    for (int i = 0; i < total_progs; i++) {
        if ((pids[i] = fork()) == 0) {
            printf("PID fork #%d: %d\n", i, getpid());
            pause();
            // os filhos estão criados e à espera de receber um sinal para
            // começarem
            execlp(argv[i + 1], argv[i + 1], NULL);
            perror("execlp");
            _exit(1);
        }
    }

    if (signal(SIGALRM, handler_sigalrm) == SIG_ERR) {
        perror("SIGALRM failed");
    }

    if (signal(SIGCHLD, handler_sigchld) == SIG_ERR) {
        perror("SIGCHLD failed");
    }

    // colocar o primeiro a correr
    if (total_progs > 0) kill(pids[fork_index], SIGCONT);
    alarm(1);  // lançar alarme para quando deve fazer a primeira pausa

    while (total_progs > 0) {
        pause();
    }

    free(pids);
    return 0;
}
