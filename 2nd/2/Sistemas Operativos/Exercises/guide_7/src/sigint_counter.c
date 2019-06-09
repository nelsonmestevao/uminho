#include <stdio.h>
#include <stdlib.h>

#include <signal.h>
#include <sys/types.h>

#include <unistd.h>

int ctrl_c_counter = 0;
unsigned int time_passed = 0;

void handler_sigint(int signum) {
    printf("Passaram %u segundos\n", time_passed);
    ctrl_c_counter++;
}

void handler_sigquit(int signum) {
    printf("Clicou %d vezes em CTRL+C", ctrl_c_counter);
    exit(0);
}

void handler_sigalrm(int signum) {
    time_passed++;
    alarm(1);
}

int main(int argc, const char* argv[]) {
    if (signal(SIGINT, handler_sigint) == SIG_ERR) {
        perror("SIGINT failed");
    }

    if (signal(SIGQUIT, handler_sigquit) == SIG_ERR) {
        perror("SIGOUT failed");
    }

    if (signal(SIGALRM, handler_sigalrm) == SIG_ERR) {
        perror("SIGOUT failed");
    }

    alarm(1);
    while (1) {
        pause();
    }
}
