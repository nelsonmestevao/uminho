#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "person.h"

Person new_person(char *name, int age) {
  return (Person){
      .name = strdup(name),
      .age = age,
  };
}

Person clone_person(Person *p) {
  return (Person){
      .name = strdup(p->name),
      .age = p->age,
  };
}

void destroy_person(Person *p) { free(p->name); }

int get_person_age(Person *p) { return p->age; }

void set_person_age(Person *p, int age) { p->age = age; }
