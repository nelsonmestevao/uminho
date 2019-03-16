/* ========================================================================== */
/* Programação Imperativa                                           2017/2018 */
/* Questões: Parte 2                                                          */
/* ========================================================================== */
#include <stdio.h>
#include <stdlib.h>
#include "abin.h"
#include "listas.h"

/* --------------------------------------------------------------------------
    Exercício 1
   -------------------------------------------------------------------------- */

int length(LInt l) {
  int r = 0;

  while (l != NULL) {
    r++;
    l = l->prox;
  }

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 2
   -------------------------------------------------------------------------- */

void freeL(LInt l) {
  LInt aux;

  while (l != NULL) {
    aux = l->prox;
    free(l);
    l = aux;
  }
}

/* --------------------------------------------------------------------------
    Exercício 3
   -------------------------------------------------------------------------- */

void imprimeL(LInt l) {
  while (l != NULL) {
    printf("%d\n", l->valor);
    l = l->prox;
  }
}

/* --------------------------------------------------------------------------
    Exercício 4
   -------------------------------------------------------------------------- */

LInt reverseL(LInt l) {
  LInt aux1, aux2 = NULL;

  while (l != NULL) {
    aux1 = l->prox;
    l->prox = aux2;
    aux2 = l;
    l = aux1;
  }

  return aux2;
}

/* --------------------------------------------------------------------------
    Exercício 5
   -------------------------------------------------------------------------- */

void insertOrd(LInt *el, int x) {
  LInt l = *el;
  LInt pt, ant, new;
  pt = l;
  ant = NULL;

  while (pt != NULL && pt->valor < x) {
    ant = pt;
    pt = pt->prox;
  }

  new = newLInt(x, pt);
  if (ant == NULL)
    l = new;
  else
    ant->prox = new;

  *el = l;
}

/* --------------------------------------------------------------------------
    Exercício 6
   -------------------------------------------------------------------------- */

int removeOneOrd(LInt *el, int x) {
  int r = 0;
  LInt l = *el, ant = NULL;

  while (l != NULL && l->valor < x) {
    ant = l;
    l = l->prox;
  }

  if (l != NULL && l->valor == x) {
    if (ant != NULL)
      ant->prox = l->prox;
    else
      *el = l->prox;
    free(l);
  } else
    r = 1;

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 7
   -------------------------------------------------------------------------- */

void merge(LInt *r, LInt l1, LInt l2) {
  while (l1 != NULL && l2 != NULL)
    if (l1->valor < l2->valor) {
      *r = l1;
      r = &(l1->prox);
      l1 = l1->prox;
    } else {
      *r = l2;
      r = &(l2->prox);
      l2 = l2->prox;
    }

  if (l1 == NULL)
    *r = l2;
  else
    *r = l1;
}

/* --------------------------------------------------------------------------
    Exercício 8
   -------------------------------------------------------------------------- */

void splitQS(LInt l, int x, LInt *mx, LInt *Mx) {
  while (l != NULL) {
    if (l->valor < x) {
      *mx = l;
      mx = &(l->prox);
    } else {
      *Mx = l;
      Mx = &(l->prox);
    }
    l = l->prox;
  }
  *mx = NULL;
  *Mx = NULL;
}

/* --------------------------------------------------------------------------
    Exercício 9
   -------------------------------------------------------------------------- */

LInt parteAmeio(LInt *l) {
  int i, n = length(*l) / 2;
  LInt *p = l, u = *l;

  for (i = 0; i < n; i++) p = &((*p)->prox);

  *l = *p;
  *p = NULL;

  if (n == 0) {
    *l = u;
    u = NULL;
  }

  return u;
}

/* --------------------------------------------------------------------------
    Exercício 10
   -------------------------------------------------------------------------- */

int removeAll(LInt *l, int x) {
  int r = 0;
  LInt aux;

  while (*l != NULL)
    if ((*l)->valor == x) {
      aux = (*l)->prox;
      free(*l);
      *l = aux;
      r++;
    } else
      l = &((*l)->prox);

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 11
   -------------------------------------------------------------------------- */

int removeDups(LInt *l) {
  int r = 0;

  while (*l != NULL) {
    r += removeAll(&((*l)->prox), (*l)->valor);
    l = &((*l)->prox);
  }

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 12
   -------------------------------------------------------------------------- */

int removeMaiorL(LInt *l) {
  int maior;
  LInt *p, tmp;

  for (p = l; *p != NULL; p = &((*p)->prox))
    if ((*l)->valor < (*p)->valor) l = p;

  maior = (*l)->valor;
  tmp = (*l)->prox;
  free(*l);
  *l = tmp;

  return maior;
}

/* --------------------------------------------------------------------------
    Exercício 13
   -------------------------------------------------------------------------- */

void init(LInt *l) {
  while (*l != NULL && (*l)->prox != NULL) l = &((*l)->prox);

  free(*l);
  *l = NULL;
}

/* --------------------------------------------------------------------------
    Exercício 14
   -------------------------------------------------------------------------- */

void appendL(LInt *l, int x) {
  while (*l != NULL) l = &((*l)->prox);

  *l = newLInt(x, NULL);
}

/* --------------------------------------------------------------------------
    Exercício 15
   -------------------------------------------------------------------------- */

void concatL(LInt *a, LInt b) {
  while (*a != NULL) a = &((*a)->prox);

  *a = b;
}

/* --------------------------------------------------------------------------
    Exercício 16
   -------------------------------------------------------------------------- */

LInt cloneL(LInt l) {
  LInt *aux, r;
  aux = &r;

  while (l != NULL) {
    *aux = newLInt(l->valor, NULL);
    aux = &((*aux)->prox);
    l = l->prox;
  }

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 17
   -------------------------------------------------------------------------- */

LInt cloneRev(LInt l) {
  LInt r = NULL;

  while (l != NULL) {
    r = newLInt(l->valor, r);
    l = l->prox;
  }

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 18
   -------------------------------------------------------------------------- */

int maximo(LInt l) {
  int m = l->valor;
  l = l->prox;

  while (l != NULL) {
    if (m < l->valor) m = l->valor;
    l = l->prox;
  }

  return m;
}

/* --------------------------------------------------------------------------
    Exercício 19
   -------------------------------------------------------------------------- */

int take(int n, LInt *l) {
  int i;
  LInt tmp;

  for (i = 0; i < n && *l != NULL; i++) l = &((*l)->prox);

  while (*l != NULL) {
    tmp = *l;
    *l = (*l)->prox;
    free(tmp);
  }

  return i;
}

/* --------------------------------------------------------------------------
    Exercício 20
   -------------------------------------------------------------------------- */

int drop(int n, LInt *l) {
  int i;
  LInt tmp;

  for (i = 0; i < n && *l != NULL; i++) {
    tmp = *l;
    *l = (*l)->prox;
    free(tmp);
  }

  return i;
}

/* --------------------------------------------------------------------------
    Exercício 21
   -------------------------------------------------------------------------- */

LInt NForward(LInt l, int N) {
  int i;

  for (i = 0; i < N; i++) l = l->prox;

  return l;
}

/* --------------------------------------------------------------------------
    Exercício 22
   -------------------------------------------------------------------------- */

int listToArray(LInt l, int v[], int N) {
  int i;

  for (i = 0; i < N && l != NULL; i++) {
    v[i] = l->valor;
    l = l->prox;
  }

  return i;
}

/* --------------------------------------------------------------------------
    Exercício 23
   -------------------------------------------------------------------------- */

LInt arrayToList(int v[], int N) {
  int i;
  LInt r = NULL, *aux = &r;

  for (i = 0; i < N; i++) {
    *aux = newLInt(v[i], NULL);
    aux = &((*aux)->prox);
  }

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 24
   -------------------------------------------------------------------------- */

LInt somasAcL(LInt l) {
  LInt r = NULL, *aux = &r;
  int soma = 0;

  while (l != NULL) {
    soma += l->valor;
    *aux = newLInt(soma, NULL);
    aux = &((*aux)->prox);
    l = l->prox;
  }

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 25
   -------------------------------------------------------------------------- */

void remreps(LInt l) {
  LInt aux, tmp;

  while (l != NULL) {
    aux = l->prox;
    while (aux != NULL && aux->valor == l->valor) {
      tmp = aux->prox;
      free(aux);
      aux = tmp;
    }
    l->prox = aux;
    l = l->prox;
  }
}

/* --------------------------------------------------------------------------
    Exercício 26
   -------------------------------------------------------------------------- */

LInt rotateL(LInt l) {
  LInt r = l;

  if (l != NULL && l->prox != NULL) {
    while (l->prox != NULL) l = l->prox;
    l->prox = r;
    r = r->prox;
    l->prox->prox = NULL;
  }

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 27
   -------------------------------------------------------------------------- */

LInt parte(LInt l) {
  LInt aux, p = NULL;

  if (l != NULL && l->prox != NULL) {
    p = l->prox;
    while (l->prox != NULL) {
      aux = l->prox;
      l->prox = l->prox->prox;
      l = aux;
    }
  }

  return p;
}

/* --------------------------------------------------------------------------
    Exercício 28
   -------------------------------------------------------------------------- */

int altura(ABin a) {
  int e, d, r = 0;

  if (a != NULL) {
    e = 1 + altura(a->esq);
    d = 1 + altura(a->dir);
    r = d > e ? d : e;
  }

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 29
   -------------------------------------------------------------------------- */

ABin cloneAB(ABin a) {
  ABin c = NULL;

  if (a != NULL) {
    c = malloc(sizeof(struct nodo));
    c->valor = a->valor;
    c->esq = cloneAB(a->esq);
    c->dir = cloneAB(a->dir);
  }

  return c;
}

/* --------------------------------------------------------------------------
    Exercício 30
   -------------------------------------------------------------------------- */

void mirror(ABin *a) {
  ABin tmp;

  if (*a != NULL) {
    tmp = (*a)->dir;
    (*a)->dir = (*a)->esq;
    (*a)->esq = tmp;

    mirror(&((*a)->dir));
    mirror(&((*a)->esq));
  }
}

/* --------------------------------------------------------------------------
    Exercício 31
   -------------------------------------------------------------------------- */

void inorder(ABin a, LInt *l) {
  LInt tmp;

  if (a != NULL) {
    inorder(a->dir, l);
    tmp = *l;
    *l = malloc(sizeof(struct nodo));
    (*l)->valor = a->valor;
    (*l)->prox = tmp;
    inorder(a->esq, l);
  }
}

/* --------------------------------------------------------------------------
    Exercício 32
   -------------------------------------------------------------------------- */

void preorder(ABin a, LInt *l) {
  LInt tmp;

  if (a != NULL) {
    preorder(a->dir, l);
    preorder(a->esq, l);
    tmp = *l;
    *l = malloc(sizeof(struct nodo));
    (*l)->valor = a->valor;
    (*l)->prox = tmp;
  }
}

/* --------------------------------------------------------------------------
    Exercício 33
   -------------------------------------------------------------------------- */

void posorder(ABin a, LInt *l) {
  LInt tmp;

  if (a != NULL) {
    tmp = *l;
    *l = malloc(sizeof(struct lligada));
    (*l)->valor = a->valor;
    (*l)->prox = tmp;
    posorder(a->dir, l);
    posorder(a->esq, l);
  }
}

/* --------------------------------------------------------------------------
    Exercício 34
   -------------------------------------------------------------------------- */

int depth(ABin a, int x) {
  int r = -1, e, d;

  if (a != NULL && a->valor == x)
    r = 1;
  else if (a != NULL) {
    e = depth(a->esq, x);
    d = depth(a->dir, x);
    if (e != -1 && d != -1)
      r = 1 + (e < d ? e : d);
    else if (e != -1)
      r = 1 + e;
    else if (d != -1)
      r = 1 + d;
  }

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 35
   -------------------------------------------------------------------------- */

int freeAB(ABin a) {
  int r = 0;

  if (a != NULL) {
    r = 1 + freeAB(a->esq) + freeAB(a->dir);
    free(a);
  }

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 36
   -------------------------------------------------------------------------- */

int pruneAB(ABin *a, int l) {
  int r = 0;

  if (*a != NULL) {
    r = pruneAB(&((*a)->dir), l - 1) + pruneAB(&((*a)->esq), l - 1);
    if (l <= 0) {
      free(*a);
      *a = NULL;
      r++;
    }
  }

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 37
   -------------------------------------------------------------------------- */

int iguaisAB(ABin a, ABin b) {
  int r = 0;

  if (a != NULL && b != NULL) {
    r = (a->valor == b->valor) && iguaisAB(a->dir, b->dir) &&
        iguaisAB(a->esq, b->esq);
  } else if (a == b)
    r = 1;

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 38
   -------------------------------------------------------------------------- */

LInt nivelL(ABin a, int n) {
  LInt l = NULL, e, d;

  if (a != NULL) {
    if (n == 1) {
      l = malloc(sizeof(struct lligada));
      l->valor = a->valor;
      l->prox = NULL;
    } else if (n > 1) {
      e = nivelL(a->esq, n - 1);
      d = nivelL(a->dir, n - 1);
      if (e != NULL) {
        l = e;
        while (e->prox != NULL) e = e->prox;
        e->prox = d;
      } else
        l = d;
    }
  }

  return l;
}

/* --------------------------------------------------------------------------
    Exercício 39
   -------------------------------------------------------------------------- */

int nivelV(ABin a, int n, int v[]) {
  int r = 0;

  if (a != NULL) {
    if (n == 1) {
      v[0] = a->valor;
      r = 1;
    } else if (n > 1) {
      r += nivelV(a->esq, n - 1, v);
      r += nivelV(a->dir, n - 1, v + r);
    }
  }

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 40
   -------------------------------------------------------------------------- */

int dumpAbin(ABin a, int v[], int N) {
  int r = 0;

  if (a != NULL && r < N) {
    r = dumpAbin(a->esq, v, N);
    if (r < N) {
      v[r++] = a->valor;
      r += dumpAbin(a->dir, v + r, N - r);
    }
  }

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 41
   -------------------------------------------------------------------------- */

ABin somasAcA(ABin a) {
  ABin r = NULL;

  if (a != NULL) {
    r = malloc(sizeof(struct nodo));
    r->valor = a->valor;

    r->esq = somasAcA(a->esq);
    if (r->esq != NULL) r->valor += r->esq->valor;

    r->dir = somasAcA(a->dir);
    if (r->dir != NULL) r->valor += r->dir->valor;
  }

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 42
   -------------------------------------------------------------------------- */

int contaFolhas(ABin a) {
  int r = 0;

  if (a != NULL) {
    if (a->esq == NULL && a->dir == NULL) {
      r = 1;
    } else
      r = contaFolhas(a->esq) + contaFolhas(a->dir);
  }

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 43
   -------------------------------------------------------------------------- */

ABin cloneMirror(ABin a) {
  ABin r = NULL;

  if (a != NULL) {
    r = malloc(sizeof(struct nodo));
    r->valor = a->valor;
    r->esq = cloneMirror(a->dir);
    r->dir = cloneMirror(a->esq);
  }

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 44
   -------------------------------------------------------------------------- */

int addOrd(ABin *a, int x) {
  int r = 0;

  while (*a != NULL && r == 0)
    if ((*a)->valor < x)
      a = &((*a)->dir);
    else if ((*a)->valor > x)
      a = &((*a)->esq);
    else
      r = 1;

  if (r == 0) {
    *a = malloc(sizeof(struct nodo));
    (*a)->valor = x;
    (*a)->esq = NULL;
    (*a)->dir = NULL;
  }

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 45
   -------------------------------------------------------------------------- */

int lookupAB(ABin a, int x) {
  int r = 0;

  while (a != NULL && r == 0)
    if (a->valor == x)
      r = 1;
    else if (a->valor > x)
      a = a->esq;
    else
      a = a->dir;

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 46
   -------------------------------------------------------------------------- */

int depthOrd(ABin a, int x) {
  int r = -1, i = 1;

  while (a != NULL && r == -1) {
    if (a->valor == x)
      r = i;
    else if (a->valor > x)
      a = a->esq;
    else
      a = a->dir;
    i++;
  }

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 47
   -------------------------------------------------------------------------- */

int maiorAB(ABin a) {
  int r;

  while (a->dir != NULL) a = a->dir;

  r = a->valor;

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 48
   -------------------------------------------------------------------------- */

void removeMaiorA(ABin *a) {
  ABin tmp;

  while (*a != NULL && (*a)->dir != NULL) a = &((*a)->dir);

  if (*a != NULL) {
    tmp = *a;
    *a = (*a)->esq;
    free(tmp);
  }
}

/* --------------------------------------------------------------------------
    Exercício 49
   -------------------------------------------------------------------------- */

int quantosMaiores(ABin a, int x) {
  int r = 0;

  if (a != NULL) {
    if (a->valor > x)
      r = 1 + quantosMaiores(a->esq, x) + quantosMaiores(a->dir, x);
    else
      r = quantosMaiores(a->dir, x);
  }

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 50
   -------------------------------------------------------------------------- */

void listToBTree(LInt l, ABin *a) {
  LInt menores = parteAmeio(&l);
  *a = NULL;

  if (l != NULL) {
    *a = malloc(sizeof(struct nodo));
    (*a)->valor = l->valor;
    l = l->prox;
    listToBTree(menores, &((*a)->esq));
    listToBTree(l, &((*a)->dir));
  }
}

/* --------------------------------------------------------------------------
    Exercício 51
   -------------------------------------------------------------------------- */

int bigger(ABin a, int x) {
  int r = 1;

  if (a != NULL) {
    if (a->valor > x) {
      r = bigger(a->esq, x) && bigger(a->dir, x);
    } else
      r = 0;
  }

  return r;
}

int smaller(ABin a, int x) {
  int r = 1;

  if (a != NULL) {
    if (a->valor <= x) {
      r = smaller(a->esq, x) && smaller(a->dir, x);
    } else
      r = 0;
  }

  return r;
}

int deProcura(ABin a) {
  int r = 1;

  if (a != NULL) {
    r = smaller(a->esq, a->valor) && bigger(a->dir, a->valor);
    if (r == 1) {
      r = deProcura(a->esq) && deProcura(a->dir);
    } else
      r = 0;
  }

  return r;
}
