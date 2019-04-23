#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "person.h"

#define PATH_DATABASE "out/people.bin"

void write_person(int fd, Person *p) {
  lseek(fd, 0, SEEK_END);
  write(fd, p->name, sizeof(char) * strlen(p->name));
  write(fd, &(p->age), sizeof(int));
}

int main(int argc, char **argv) {
  int fd = open(PATH_DATABASE, O_CREAT | O_RDWR, 0666);

  if (argv[1] != NULL && strcmp(argv[1], "-i") == 0) {
    Person p = new_person(argv[2], atoi(argv[3]));
    write_person(fd, &p);
  } else if (strcmp(argv[1], "-c") == 0) {
    int i;

    read(fd, &i, sizeof(int));

    printf("Idade do primeiro: %d\n", i);
  }

  close(fd);

  return 0;
}
