#ifndef _PERSON_H_
#define _PERSON_H_

typedef struct person {
  char *name;
  int age;
} Person;

Person new_person(char *name, int age);

Person clone_person(Person *p);

void destroy_person(Person *p);

int get_person_age(Person *p);

void set_person_age(Person *p, int age);

#endif
