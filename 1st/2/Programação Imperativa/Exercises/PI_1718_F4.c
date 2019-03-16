/* ========================================================================== *
 * Programação Imperativa                                           2017/2018 *
 * Ficha 4                                                                    *
 * ========================================================================== */
#include <ctype.h>
#include <stdio.h>
#include <string.h>

// 1
int minusculas(char s[]) {
  int i = 0;

  for (; *s; s++)
    if (*s >= 'A' && *s < 'Z') {
      (*s) += 'a' - 'A';
      i++;
    }

  return i;
}

// 2
int contalinhas(char s[]) {
  int n = 1;  // número de linhas

  if (s[0] == '\0') {
    n = 0;
  } else {
    for (; *s; s++) n = (*s == '\n') ? n + 1 : n;
  }

  return n;
}

// 3
int contaPal(char s[]) {
  int n = 1;  // número de espaços
  for (; *s; s++)
    if (isspace(*s)) {
      n += 1;
    }
  return n;
}

// 4
int procura(char *p, char *ps[], int N) {
  int i;
  for (i = 0; i < N; i++)
    if (strcmp(p, ps[i]) == 0)
      return i;
    else
      return 0;
}

int main() {
  //  char s[] = "Nelson Miguel de Oliveira Estevão";
  //  int n = minusculas(s);
  //  printf("A string %s tinha %d maiusculas\n", s, n);

  //  char s[] = "Nelson \n Miguel \n de\n Oliveira \n Estevão";
  //  int n = contalinhas (s);
  //  printf("A string %s tinha %d linhas\n", s, n);

  //  char s[] = "Nelson Miguel de Oliveira Estevão";
  //  int n = contaPal(s);
  //  printf("A string %s tem %d palavras\n", s, n);

  return 0;
}
