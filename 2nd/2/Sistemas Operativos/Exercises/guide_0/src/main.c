#include <stdio.h>
#include <stdlib.h>

#include "person.h"

int main() {
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

    return 0;
}
