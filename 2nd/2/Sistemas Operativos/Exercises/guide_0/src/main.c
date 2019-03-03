#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include "person.h"

void appendPerson(const char *path, Person new) {
    int fd = open(path, O_CREAT | O_TRUNC | O_WRONLY, 0777);

    write(fd, &new, sizeof(Person));

    close(fd);
}

int main(int argc, char **argv) {
    if (argc == 3) {
        Person dada = new_person(argv[1], atoi(argv[2]));
        printf("Nome: %s\n",  dada.name);
        printf("Idade: %d\n", dada.age);

        appendPerson("out/people.bin", dada);
    } else {
        Person andre = new_person("Andre", 20);

        printf("Idade anterior André %d\n", andre.age);
        person_change_age(&andre, 30);
        printf("Idade modificada André %d\n", andre.age);

        Person new_andre = clone_person(&andre);

        printf("Idade anterior André %d\n", andre.age);
        person_change_age(&andre, 30);
        printf("Idade modificada André %d\n", andre.age);

        destroy_person(&new_andre);
        destroy_person(&andre);
    }

    return 0;
}
