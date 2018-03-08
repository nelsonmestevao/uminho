/* ========================================================================== *
 * Programação Imperativa                                           2017/2018 *
 * Ficha 1                                                                    *
 * ========================================================================== */
#include <stdio.h>

// 1
int mult (int n,int p)
{
  int c,resultado=0;
  for (c=0;c<p;c++)
    resultado+=n;
  return resultado;
}

// 2
float multInt (int n, float m) {

  float r = 0;

  while (n > 0) {
    if (n%2 == 1) r += m;
    n >>= 1;
    m *= 2;
  }

  return r;
}

int main()
{
  printf ("%d\n",mult(4,3)); // 1

  printf ("%f\n", multInt(81,423)); //2
}
