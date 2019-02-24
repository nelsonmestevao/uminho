/* ========================================================================== */
/* Programação Imperativa                                           2017/2018 */
/* Questões: Parte 1                                                          */
/* ========================================================================== */
#include <stdio.h>

/* --------------------------------------------------------------------------
    Exercício 1
   -------------------------------------------------------------------------- */

void leMaior ()
{
    int leitura;
    int maior=0;

    scanf ("%d",&leitura);

    do {
        scanf ("%d",&leitura);
        maior = (leitura>maior) ? leitura : maior;
        if (leitura == 0)
            printf("%d\n", maior);
    } while (leitura != 0);
}

/* --------------------------------------------------------------------------
    Exercício 2
   -------------------------------------------------------------------------- */

void fazMedia ()
{
  int lista[1024];
  int i = 0;
  int soma = 0;

  do {
    scanf ("%d",&lista[i]);
    soma += lista[i];
    if (lista[i]==0)
    {
      float media = soma/i;
      printf("Média \t %f\n", media);
    }
    i++;
  } while (lista[i-1]!=0);
}

/* --------------------------------------------------------------------------
    Exercício 3
   -------------------------------------------------------------------------- */

void le2Maior () {
    int maior = 0, maior2 = 0, leitura;
    do {
        scanf ("%d",&leitura);
        if (leitura > maior2 && leitura < maior) maior2 = leitura;
        else if (leitura > maior) {
            maior2 = maior;
            maior = leitura;
        }
        if (leitura == 0)
            printf("%d\n", maior2);
    } while (leitura != 0);
}

/* --------------------------------------------------------------------------
    Exercício 4
   -------------------------------------------------------------------------- */

int bitsUm (int x){
  int r=0;

  do {
    if (x%2==1)
     r++;
    x>>=1;
  } while (x!=0);

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 5
   -------------------------------------------------------------------------- */

int trailingZ (unsigned int n) {
  int r = 0;

  while(n%2==0) {
      n>>=1;
      r++;
  };

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 6
   -------------------------------------------------------------------------- */

int qDig (int n) {
    int r = 0;

  do {
    n/=10;
    r++;
  } while (n>0);

  return r;
}

/* --------------------------------------------------------------------------
    Exercício 7
   -------------------------------------------------------------------------- */

char *mystrcat(char s1[], char s2[]) {
  int i,j;

  for(i=0; s1[i] != '\0'; i++);

  for(j=0; s2[j] != '\1';j++)
    s1[i+j] = s2[j];

    s1[i+j] = '\0';

    return s1;
}

/* --------------------------------------------------------------------------
    Exercício 8
   -------------------------------------------------------------------------- */

char *mystrcpy(char s1[], const char s2[]) {
  int i;

  for(i=0; s2[i]!='\0'; i++)
    s1[i] = s2[i];

  s1[i]='\0';

  return s1;
}

/* --------------------------------------------------------------------------
    Exercício 9
   -------------------------------------------------------------------------- */

int mystrcmp(char s1[], char s2[]) {
  int i = 0;

  while(s1[i]==s2[i] && s1[i]!='\0')
    i++;

  return (s1[i]-s2[i]);
}

/* --------------------------------------------------------------------------
    Exercício 10
   -------------------------------------------------------------------------- */

char *mystrstr (char s1[], char s2[]) {

  int i, j;

  for(i=0,j=0; s1[i]!='\0' && s2[j]!='\0'; i++)
    if (s1[i]==s2[j]) j++;
    else j=0;

  if (s2[j]=='\0')
    return s1+=(i-j);
  else
    return NULL;
}

/* --------------------------------------------------------------------------
    Exercício 11
   -------------------------------------------------------------------------- */

void strrev (char s[]) {

  int i,n,t;

  for(n=0; s[n]!='\0'; n++);

  n--;

  for(i=0;i<n;i++) {
    t = s[i];
    s[i] = s[n];
    s[n] = t;
    n--;
  }
}

/* --------------------------------------------------------------------------
    Exercício 12
   -------------------------------------------------------------------------- */

void strnoV (char t[]){

  int l=0,e=0;

  while (t[l]!='\0') {
    if (t[l]=='a'||t[l]=='e'||t[l]=='i'||t[l]=='o'||t[l]=='u'||t[l]=='A'||t[l]=='E'||t[l]=='I'||t[l]=='O'||t[l]=='U')
      l++;
    else
      t[e++]=t[l++];
  }

  t[e]='\0';
}

/* --------------------------------------------------------------------------
    Exercício 13
   -------------------------------------------------------------------------- */

void truncW (char t[], int n) {
  int i=0, a=0, contador=0;

  while (t[i]!='\0')
  {
    if (t[i]==' ') {
      t[a++]=t[i++];
      contador=0;
    } else if (contador==n) {
      i++;
    } else {
      t[a++]=t[i++];
      contador++;
    }
  }

  t[a]='\0';
}

/* --------------------------------------------------------------------------
    Exercício 14
   -------------------------------------------------------------------------- */

int contaChar (char s [], char a) {
  int i,count=0;
  for (i=0; s[i]!='\0'; i++)
  {
    if (s[i]==a)
      count ++;
  }
  return count;
}

char charMaisfreq (char s[]) {
  int i,nmax=0;
  char max;
  for (i=0; s[i]!='\0'; i++)
  {
    if (nmax < contaChar (s,s[i]))
    {
      nmax = contaChar (s,s[i]);
      max = s[i];
    }
  }
  if (s[0]=='\0')
  max ='\0';
    return max;
}

/* --------------------------------------------------------------------------
    Exercício 15
   -------------------------------------------------------------------------- */

int iguaisConsecutivos (char s[]) {
    int i, n=0, max=0;
    char last = '\0';

    for(i=0; s[i]!='\0'; i++)
    {
        if (last==s[i])
            n++;
        else {
          last = s[i];
          if (n>max)
            max = n;
          n=1;
       }
    }

    if (n>max)
        max = n;

    return max;
}

/* --------------------------------------------------------------------------
    Exercício 16
   -------------------------------------------------------------------------- */

int prefixoSrep (char s[]){
    int i;
    int r = 0; int stop = 0;

    while (s[r]!='\0' && stop==0) {
        for(i=0; i<r && s[i]!=s[r]; i++);
        if (i==r) r++;
        else stop=1;
    }

    return r;
}

int difConsecutivos(char s[])
{
    int i, // percorrer a string
        r, // ?? até à altura
        m;
    r = 0;
    for (i=0;s[i]!='\0';i++){
        m = prefixoSrep(s+i);
        if (m>r) r=m;
    }

 return r;
}


/* --------------------------------------------------------------------------
    Exercício 17
   -------------------------------------------------------------------------- */

int maiorPrefixo (char s1 [], char s2 []) {
    int i = 0;

    while (s1[i]!='\0' && s2[i]!='\0' && s1[i]==s2[i])
        i++;

    return i;
}

/* --------------------------------------------------------------------------
    Exercício 18
   -------------------------------------------------------------------------- */

int maiorSufixo (char s1 [], char s2 []) {
    int i, j; int counter = 0;

    for(i=0;s1[i]!='\0';i++);
    i--;
    for(j=0;s2[j]!='\0';j++);
    j--;

    while(i>=0 && j>=0 && s1[i]==s2[j]){
        i--;
        j--;
        counter++;
    }

    return counter;
}

/* --------------------------------------------------------------------------
    Exercício 19
   -------------------------------------------------------------------------- */

int sufPref (char s1[], char s2[]) {
    int i,j,r;
    for(i=j=r=0; s1[i]!='\0';i++){
        if (s1[i]==s2[j]){
            j++;
            r++;
        } else {
            j=0;
            r=0;
        }
    }
    return r;
}

/* --------------------------------------------------------------------------
    Exercício 20
   -------------------------------------------------------------------------- */

int contaPal (char s[]) {
    int i; int nPalavras=0;

    if (s[0]!='\0'){
        for(i=1;s[i]!='\0';i++){
            if(s[i]==' ' && s[i-1]!=' ' && s[i-1]!='\n'){
                nPalavras++;
            } else if (s[i+1]=='\0' && s[i]!=' ' && s[i]!='\n'){
                nPalavras++;
            }
        }
    }

    return nPalavras;
}

/* --------------------------------------------------------------------------
    Exercício 21
   -------------------------------------------------------------------------- */

int contaVogais (char s[]) {
    int i;
    int nVogais = 0;
    for(i=0;s[i]!='\0';i++){
        if (s[i]=='A'||s[i]=='E'||s[i]=='I'||s[i]=='O'||s[i]=='U'
        ||  s[i]=='a'||s[i]=='e'||s[i]=='i'||s[i]=='o'||s[i]=='u')
            nVogais++;
    }
    return nVogais;
}

/* --------------------------------------------------------------------------
    Exercício 22
   -------------------------------------------------------------------------- */

int elemC (char x, char p[]){
    int i; int r = 0;

    for(i=0;p[i]!='\0';i++)
        if (p[i]==x) r=1;

    return r;
    }

int contida (char a[], char b[]) {
    int i; int r=1;

    for(i=0;a[i]!='\0';i++)
        if( !elemC(a[i],b) ) r=0;

    return r;
}

/* --------------------------------------------------------------------------
    Exercício 23
   -------------------------------------------------------------------------- */

int palindroma (char s[]) {
    int i,j; int r=1;

    for(i=0;s[i]!='\0';i++);
    i--;

    j=0;
    while (j<i){
        if(s[j++]!=s[i--]) r=0;
    }

    return r;
}

/* --------------------------------------------------------------------------
    Exercício 24
   -------------------------------------------------------------------------- */

int remRep (char texto []) {
    int r,w=0;

    if(texto[0]!='\0'){
        for(r=1,w=1;texto[r]!='\0';r++)
            if (texto[r-1]!=texto[r]) {
                texto[w]=texto[r];
                w++;
            }

        texto[w]='\0';
    }

    return w;
}

/* --------------------------------------------------------------------------
    Exercício 25
   -------------------------------------------------------------------------- */

int limpaEspacos (char texto[]) {
    int r, w=0;

    if(texto[0]!='\0'){
        for(r=1,w=1;texto[r]!='\0';r++)
            if(texto[r]==' ' && texto[w-1]==' ');
            else texto[w++]=texto[r];

        texto[w]='\0';
    }

    return w;
}

/* --------------------------------------------------------------------------
    Exercício 26
   -------------------------------------------------------------------------- */

void insere (int s[], int N, int x){
    int i=N; int stop = 1;
    while(i>0 && stop){
        if(x>=s[i-1]){
            stop = 0;
        } else {
            s[i]=s[i-1];
            i--;
        }
        s[i]=x;
    }
}

/* --------------------------------------------------------------------------
    Exercício 27
   -------------------------------------------------------------------------- */

void merge (int r [], int a[], int b[], int na, int nb){
   int i;
   int ia,ib;
   ia=ib=0;

   for(i=0;ia<na && ib<nb;i++){
       if(a[ia]<=b[ib]){
        r[i] = a[ia++];
       } else {
        r[i] = b[ib++];
       }
   }

   while(ia<na) r[i++]=a[ia++];
   while(ib<nb) r[i++]=b[ib++];
}

/* --------------------------------------------------------------------------
    Exercício 28
   -------------------------------------------------------------------------- */

int crescente (int a[], int i, int j){
   int r=1;
   while(i<j){
    if(a[i]>a[i+1]) r=0;
    i++;
   }

   return r;
}

/* --------------------------------------------------------------------------
    Exercício 29
   -------------------------------------------------------------------------- */

int retiraNeg (int v[], int N){
   int n=N;
   int r,w;

   for(r=0,w=0;r<N;r++){
       if(v[r]>-1){ // ver se é positivo
           v[w]=v[r];
           w++;
       } else {
           n--;
       }
   }

   return n;
}

/* --------------------------------------------------------------------------
    Exercício 30
   -------------------------------------------------------------------------- */

int menosFreq (int v[], int N){
    int lowNumb=v[0],r=16384,count=1,i,last=v[0];
    for (i = 1; i <= N; ++i)
    {
        if (last ==v[i])
            count++;
        else if (count < r)
        {
            lowNumb=v[i-1];
            r=count;
            last = v[i];
            count=1;
        }
        else if (last !=v[i])
        {
            last = v[i];
            count=1;
        }
    }
    return lowNumb;
}

/* --------------------------------------------------------------------------
    Exercício 31
   -------------------------------------------------------------------------- */

int maisFreq (int v[], int N){
    int frequente=v[0];
    int frequencia=1;
    int atual = v[0];
    int contador = 1;
    int i;


    for(i=1;i<N;i++){
        if(v[i]==atual){
            contador++;
        } else {
            if(contador>frequencia){
                frequencia = contador;
                frequente = atual;
            }
            atual = v[i];
            contador = 1;
        }
    }


    return frequente;
}

/* --------------------------------------------------------------------------
    Exercício 32
   -------------------------------------------------------------------------- */

int maxCresc (int v[], int N) {
    int i, contador, maior;
    maior = 0;

    for(i=0,contador=1;i<N;i++){
        if(v[i]<=v[i+1]){
            contador++;
        } else{
            if(contador>maior){
                maior = contador;
            }
            contador = 1;
        }
    }

    return maior;
}

/* --------------------------------------------------------------------------
    Exercício 33
   -------------------------------------------------------------------------- */

int elem (int v[], int N, int x) {
    int i, r=0;

    for(i=0;i<N;i++){
        if(v[i]==x) r=1;
    }

    return r;
}

int elimRep (int v[], int N) {
    int n, // até onde já vi
        i;

    for(i=1,n=1;i<N;i++){
        if( !elem(v,n,v[i]) ) v[n++]=v[i];
    }

    return n;
}

/* --------------------------------------------------------------------------
    Exercício 34
   -------------------------------------------------------------------------- */

int elimRepOrd (int v[], int N) {
    int i;
    int w = 1;

    for(i=1;i<N;i++){
        if(v[i]==v[w-1]);
        else v[w++]=v[i];
    }

    return w;
}

/* --------------------------------------------------------------------------
    Exercício 35
   -------------------------------------------------------------------------- */

int comunsOrd (int a[], int na, int b[], int nb){
   int r = 0;
   int ia,ib;
   ia=ib=0;

   while(ia<na && ib<nb){
       if(a[ia]>b[ib]) ib++;
       if(a[ia]<b[ib]) ia++;
       if(a[ia]==b[ib]){
           ia++;
           ib++;
           r++;
       }
   }

   return r;
}

/* --------------------------------------------------------------------------
    Exercício 36
   -------------------------------------------------------------------------- */

int elemVector(int v[], int nv, int x){
    int i; int r=0;

    for(i=0;i<nv;i++){
        if(v[i]==x){
            r=1;
        }
    }

    return r;
}

int comuns (int a[], int na, int b[], int nb){
    int i;
    int n=0;

    for(i=0;i<na;i++)
        if(elemVector(b,nb,a[i])) n++;

    return n;
}

/* --------------------------------------------------------------------------
    Exercício 37
   -------------------------------------------------------------------------- */

int minInd (int v[], int n) {
    int x = v[0], // menor
        m = 0;    // indice do menor
    int i;

    for(i=1;i<n;i++){
        if(v[i]<x){
            x = v[i];
            m = i;
        }
    }

    return m;
}

/* --------------------------------------------------------------------------
    Exercício 38
   -------------------------------------------------------------------------- */

void somasAc (int v[], int Ac [], int N){
    int i,sum=0;
    for (i = 0; i < N; ++i)
    {
        sum+=v[i];
        Ac[i]= sum;
    }
}

/* --------------------------------------------------------------------------
    Exercício 39
   -------------------------------------------------------------------------- */

int triSup (int N, int m [N][N]) {
    int l,c, r=1;

    for(l=1;l<N;l++){
        for(c=0;c<l;c++)
                if(m[l][c]!=0) r=0;
    }

    return r;
}


/* --------------------------------------------------------------------------
    Exercício 40
   -------------------------------------------------------------------------- */

void transposta (int N, float m [N][N]) {
    int l,c; int tmp;

    for(l=0;l<N;l++)
        for(c=0;c<l;c++){
            tmp = m[c][l];
            m[c][l]=m[l][c];
            m[l][c]=tmp;
        }
}

/* --------------------------------------------------------------------------
    Exercício 41
   -------------------------------------------------------------------------- */

void addTo(int N, int M, int a [N][M], int b[N][M]) {
    int l,c;

    for(l=0;l<N;l++)
        for(c=0;c<M;c++)
            a[l][c]+=b[l][c];
}

/* --------------------------------------------------------------------------
    Exercício 42
   -------------------------------------------------------------------------- */

int unionSet(int N, int v1[N], int v2[N], int r[N])
{
    int i;
    for (i = 0; i < N; i++)
        r[i] = (v1[i] || v2[i]);
    return 0;
}

/* --------------------------------------------------------------------------
    Exercício 43
   -------------------------------------------------------------------------- */

int intersectSet (int N, int v1[N], int v2[N], int r[N]){
  int i;
  for(i=0;i<N;i++)
    r[i] = (v1[i] && v2[i]);
  return 0;
}

/* --------------------------------------------------------------------------
    Exercício 44
   -------------------------------------------------------------------------- */

int menor (int a, int b){
    int r;

    if(a<=b) r=a;
    else r=b;

    return r;
}

int intersectMSet (int N, int v1[N], int v2[N], int r[N]){
   int i;

   for(i=0;i<N;i++)
    r[i] = menor(v1[i], v2[i]);

   return 0;
}

/* --------------------------------------------------------------------------
    Exercício 45
   -------------------------------------------------------------------------- */

int maior (int a, int b){
    int r;

    if(a<=b) r=b;
    else r=a;

    return r;
}

int unionMSet (int N, int v1[N], int v2[N], int r[N]){
   int i;

   for(i=0;i<N;i++)
    r[i] = maior(v1[i], v2[i]);

   return 0;
}

/* --------------------------------------------------------------------------
    Exercício 46
   -------------------------------------------------------------------------- */

int cardinalMSet (int N, int v[N]){
     int sum=0;
     int i;

     for(i=0;i<N;i++)
         sum+=v[i];

     return sum;
}

/* --------------------------------------------------------------------------
    Exercício 47
   -------------------------------------------------------------------------- */

typedef enum movimento {Norte, Oeste, Sul, Este} Movimento;

typedef struct posicao {
   int x, y;
} Posicao;

Posicao posFinal (Posicao inicial, Movimento mov[], int N){
    int i;

    for(i=0;i<N;i++)
        switch (mov[i]) {
            case Norte:
                        inicial.y++;
                        break;
            case Oeste:
                        inicial.x--;
                        break;
            case Sul:
                        inicial.y--;
                        break;
            case Este:
                        inicial.x++;
                        break;
        }

    return inicial;
}

/* --------------------------------------------------------------------------
    Exercício 48
   -------------------------------------------------------------------------- */

int iguais(Posicao p1, Posicao p2){
    return (p1.x == p2.x) && (p1.y == p2.y);
}

int caminho (Posicao inicial, Posicao final, Movimento mov[], int N){
    int i=0;
    int r=0;

    while(!iguais(inicial, final) && r>-1){

        if (i == N) r=-1;
        else if (inicial.x < final.x) {
            mov[i] = Este;
            inicial.x++;
        } else if (inicial.x > final.x) {
            mov[i] = Oeste;
            inicial.x--;
        } else if (inicial.y < final.y) {
            mov[i] = Norte;
            inicial.y++;
        }
        else if (inicial.y > final.y) {
            mov[i] = Sul;
            inicial.y--;
        }

        i++;
    }

    if(!r) r=i;

    return r;
}

/* --------------------------------------------------------------------------
    Exercício 49
   -------------------------------------------------------------------------- */

int distC(Posicao p){
    return p.x*p.x + p.y*p.y;
}

int maiscentral (Posicao pos[], int N) {
    int i;
    int menor  = distC(pos[0]), // menor distancia
        imenor = 0; // indice da menor distancia

    for(i=1;i<N;i++){
        if(distC(pos[i])<menor){
            menor  = distC(pos[i]);
            imenor = i;
        }
    }

    return imenor;
}

/* --------------------------------------------------------------------------
    Exercício 50
   -------------------------------------------------------------------------- */

int distPombalina(Posicao p1, Posicao p2)
{
  int sx = p1.x - p2.x;
  int sy = p1.y - p2.y;

  if(sx<0) sx = -sx;
  if(sy<0) sy = -sy;

  return (sx + sy);
}


int vizinhos (Posicao p, Posicao pos[], int N) {
    int i;
    int r=0;

    for(i=0;i<N;i++)
        if(distPombalina(p,pos[i])==1)
            r++;

    return r;
}

int main ()
{
//  leMaior();
//  fazMedia();
  le2Maior();
  return 0;
}
