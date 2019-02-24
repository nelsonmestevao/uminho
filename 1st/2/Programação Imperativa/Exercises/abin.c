#include <abin.h>

ABin newABin (int r, ABin e, ABin d) {
    ABin new = (ABin) malloc (sizeof (struct nodo));

    if (new != NULL) {
        new->valor = r;
        new->esq   = e;
        new->dir   = d;
    }

    return new;
}
