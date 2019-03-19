#include <stdio.h>
#include <unistd.h>

int main(int argc, char **argv) {
  execl("/bin/ls", "ls++", "--color=always", "-l", NULL);

  printf("Didn't work\n");
  return 1;
}
