#include <stdio.h>
#include <stdlib.h>

#include <signal.h>
#include <sys/types.h>

#include <unistd.h>

int fork_index = -1;
int total_progs = 0;

void handler_sigalrm(int signum) {
  fork_index = fork_index + 1 % total_progs;
  alarm(1);
}

int main(int argc, char **argv) {
  pid_t pids[argc - 1];
  total_progs = argc - 1;

  for (int i = 0; i < argc - 1; i++) {
    if ((pids[i] = fork()) == 0) {
      pause();
      execlp(argv[i + 1], argv[i + 1], NULL);
      perror("execlp");
      _exit(1);
    }
  }

  if (signal(SIGALRM, handler_sigalrm) == SIG_ERR) {
    perror("SIGOUT failed");
  }

  /* while(remaining_process < 0) pause(); */

  return 0;
}
