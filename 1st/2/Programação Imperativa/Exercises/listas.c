#include "listas.h"

LInt newLInt (int v, LInt t) {
    LInt new = (LInt) malloc (sizeof (struct lligada));

    if (new != NULL) {
        new->valor = v;
        new->prox  = t;
    }

    return new;
}
