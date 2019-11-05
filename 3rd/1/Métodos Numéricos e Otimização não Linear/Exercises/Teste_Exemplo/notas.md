# Notas

`format long` -> Para ver mais casas decimais
`format short` -> para ver menos casas decimais
`vetor=onde começa:espaçamento:onde acaba`
`eye(x)` -> gera uma matriz identidade x por x
`rand(x)` -> gera uma matriz x por x de elementos aleatórios entre 0 e 1
`ones(x)` -> gera uma matriz x por x de 1’s
`diag(diag(A))` -> primeiro vai buscar os elementos que estão na diagonal da matriz A, de seguida coloca-os numa matriz onde todos os outros elementos são 0

# Sistemas de equações lineares

Introduzimos a matriz A, por exemplo, [1 2 3;4 5 6]
Introduzimos o vetor b, por exemplo, [3;4;5;2;6;2]
A solução do sistema será dada por A\b
Para a matriz inversa de A, introduzimos `inv(A)` ou introduzimos a matriz triangular superior e os vetores b1,b2,b3,b4 que correspondem às colunas da matriz identidade já transformadas e fazemos A\b
Para o determinante de A, introduzimos `det(A)`

# Método da Secante e Método de Newton

**Atenção**:

Introduzir `optimset(‘fsolve’)` se quisermos conhecer todos os campos.

Introduzimos a função em questão, por exemplo:

$7 * (2-0.9^t) - 10 = 0$

```
function[f] = newton(t)
  f = 7 * (2-0.9^t) - 10;
end
```

# Sistemas de equações não lineares

**Atenção**:

* $exitflag < 0$ -> o processo não convergiu
* $exitflag = 0$ -> não significa que não convergiu, apenas temos de aumentar o número de iterações
* $exitflag > 0$ -> o processo convergiu

tolx -> ε1
tolfun -> ε2

Introduzimos o sistema de equações, por exemplo:

$x^2+x2^2-3=0$
$x1^2+(x2-1)^2-1=0$

```
function[f]=ex25(x)
f(1)=x(1)^2+x(2)^2-3;
f(2)=x(1)^2+(x(2)-1)^2-1;
end
```

Introduzimos xinit -> ponto inicial
[x,fval,exitflag,output]=fsolve(‘ex25’,xinit) -> “iterations” dá-nos o número de iterações
					       -> “funcCount” dá-nos o número de cálculos de função
OPTIONS=optimset(‘maxiter’,5) -> para que o número máximo de iterações seja 5
[x,fval,exitflag,output] = fsolve(‘ex25’,xinit,OPTIONS)
op=optimset(‘tolx’,1e-15,’tolfun’,1e-15) -> para alterarmos ε1 e ε2
[x,fval,exitflag,output] = fsolve(‘ex25’,xinit,op)

# Interpolação (polinómios)

Atenção: Polinómio de grau 3, preciso de 4 pontos
Introduzir x
Introduzir f(x)
p3=polyfit(x apenas com os valores necessários, f apenas com os valores necessários, grau do polinómio)
Resultado pode dar:
1.0e+03*
… … …
Então multiplicamos tudo por isto, ou seja, p3(x)=(coeficiente1*x^grau+coeficiente2*x^grau-1…)*1.0e+03
polyval(p3,ponto em questão)

Interpolação (splines)
Introduzir x
Introduzir f(x)
s3=spline(x,f(x)) -> não é natural nem completa
       -> vemos o número de segmentos em “pieces”
s3.coefs -> dá-me os coeficientes dos polinómios cúbicos que unem a spline
vemos a que segmento pertence o ponto em questão e vamos buscar os respetivos coeficientes -> s3(x)=coeficiente1(x-onde começa o segmento)^número de coeficientes-1 + coeficiente2(x-onde começa o segmento)^número de coeficientes-2…
spline(x,f(x),ponto em questão)
calcular d0 = (fa-f0)/(xa-x0)
calcular dn = (fb-fn)/(xb-xn)
spline_completa=spline(x sem a e b,[d0 f sem a e b dn])
spline_completa.coefs
spline_completa=spline(x sem a e b,[d0 f sem a e b dn],ponto em questão)

# Integração

Atenção: Colocar “.” antes das operações se estivermos a trabalhar com vetores
Introduzir x
Introduzir f(x)
trapz(x,f(x))
quad(‘fun’,a,b,tol) tol->tolerância (opcional)
