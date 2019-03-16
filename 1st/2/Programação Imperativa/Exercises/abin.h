#include <stdio.h>
#include <stdlib.h>

typedef struct nodo {
  int valor;
  struct nodo *esq, *dir;
} * ABin;

ABin newABin(int v, ABin e, ABin d);
