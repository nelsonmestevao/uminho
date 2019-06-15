# 📕 Cálculo de Programas

#### Programa sucinto

1. Teoria e método em programação. Concepção composicional e reutilização.
Combinadores de programas. Modelação funcional de problemas.
2. Introdução à programação funcional. Conceito de função. A função como
contrato. Diagramas de blocos. Domínio e codomínio de uma função. Igualdade
extensional. Diagramas funcionais. Recurso a setas f : A->B e diagramas.
Notação funcional com ou sem variáveis.
3. Combinadores de programas funcionais. A composição f . g como combinador
elementar de funções. Associatividade da composição: Função identidade id. O
polimorfismo da função id e a propriedade f . id = id . f = f e seu diagramas
comutativo. O combinador "split" e o produto A x B (analogia com "struct" em
C) e suas projecções. O combinador "junc" e o coproduto A + B (analogia com
"union" em C) e suas injecções. Os combinadores f x g e f + g . Noção de
isomorfismo entre tipos de dados. Funções bijectivas ou isomorfismos. Função
inversa. Predicados e guardas. Condicional de McCarthy.
4. Álgebra da programação funcional. Inferência de tipos polimórficos com
recurso a diagramas. Propriedades naturais e propridades universais.
Propriedades de reflexão.Propriedades de cancelamento e fusão. Lei da troca.
Propriedades de absorção e propriedades functoriais. Leis de fusão do
condicional de McCarthy.
5. Programação funcional em Haskell. Costumização de produtos e coprodutos.
Álgebras e coálgebras de tipos de dados. O conceito de "apontador" 1 + A
("Maybe a" em Haskell). Funções parciais.
6. Programação com tipos de dados indutivos. Tipos de dados recursivos vistos
como equações. Os nu ´mero naturais e a equação N = 1 + N. As listas ligadas
e a equação L = 1 + A x L. Noção de combinadores recursivos. Exemplos:
catamorfismos e anamorfismos. Hilomorfismos (anamorfismos seguidos de
catamorfismos). Apresentação do módulo List.hs. Estudo da triologia
cata-ana-hilo associada ao tipo List. O algoritmo de cálculo do quadrado de
um nu ´mero visto como hilomorfismo sobre a estrutura List a. O algoritmo de
ordenação por inserção simples visto como hilomorfismo sobre a estrutura List
a. Introdução ao tipo de dados árvores binárias simples, ou listas
bi-lineares. Estudo da triologia cata-ana-hilo associada ao tipo BTree.
Exemplo: o hilomorfismo qSort ('quick sort'). Estudo da triologia
cata-ana-hilo associada ao tipo LTree. Exemplos: o hilomorfismo fib (série de
Fibonacci) e o hilomorfismo mSort ('merge sort').
7. Definição genérica de um tipo indutivo de dados. Noção de functor de base.
Operadores fmap vs catamorfismos: Politipismo da definição T a = B(a,T a) de
um tipo indutivo genérico paramétrico. Noção de functor de tipo e sua
formulação genérica como o catamorfismo T f =cata (in.B(f,id)). Propriedade
universal de um catamorfismo cata (f) do tipo genérico T a =B(a,t a) e suas
derivadas: cancelamento-cata e reflexão-cata.
8. Classificação algorítmica. Quadro sinóptico dos principais algoritmos
analisados e estudados ao longo da disciplina. Polimorfismo versus
politipismo. Programação dita «genérica».
9. Programação funcional monádica. Motivação: funções parciais e sua
composição. Manipulação de erros e mecanismos de excepção («exception
handling»). Funções monádicas envolvendo listas. Mónadas versus funções.
Noção de functor. Propriedades functoriais. Funções em HASKELL: a class
Functor e o operador fmap. Regra geral para a composição monádica. Definição
formal de mónade. Composição e sua unidade. Multiplicação e suas
propriedades. Exemplos: listas e Maybe. Mónadas em HASKELL: a class Monad e
os operadores return, bind (»=) e sequenciação (»). A notação do. Introdução
à compreensão monádica. Definição de fmap f x por compreensão (notação "do").
Regras para a monadificação de funções arbitrárias com recurso à notação
"do".

#### Bibliografia essencial

- R. Bird and O. de Moor. Algebra of Programming. Series in Computer Science.
Prentice-Hall International, 1997. C. A. R. Hoare, series editor.
- J.N. Oliveira. Program Design by Calculation. Departamento de Informática,
Universidade do Minho. Livro em preparação. Universidade do Minho, 2011.
- P. Hudak. The Haskell School of Expression - Learning Functional
Programming Through Multimedia. Cambridge University Press, 1st edition,
2000.
- H.G. Hutton. Programming in Haskell. Cambridge University Press, 2007.
