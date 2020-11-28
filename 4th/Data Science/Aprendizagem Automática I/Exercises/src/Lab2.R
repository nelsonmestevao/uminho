# Lab 2: More about R & Algebra Review


# Basic Commands

x <- c(1,3,2,5)
x
x = c(1,6,2)
x
y = c(1,4,3)
length(x)
length(y)
x+y
ls()
rm(x,y)
ls()
rm(list=ls())

x=rnorm(50)
y=x+rnorm(50,mean=50,sd=.1)
cor(x,y)
set.seed(1303)
rnorm(50)
set.seed(3)
y=rnorm(100)
mean(y)
var(y)
sqrt(var(y))
sd(y)

# Graphics

x=rnorm(100)
y=rnorm(100)
plot(x,y)
plot(x,y,xlab="this is the x-axis",ylab="this is the y-axis",main="Plot of X vs Y")
#pdf("Figure.pdf")
plot(x,y,col="green")
dev.off()
x=seq(1,10)
x
x=1:10
x
x=seq(-pi,pi,length=50)
y=x
f=outer(x,y,function(x,y)cos(y)/(1+x^2))
contour(x,y,f)
contour(x,y,f,nlevels=45,add=T)
fa=(f-t(f))/2
contour(x,y,fa,nlevels=15)
image(x,y,fa)
persp(x,y,fa)
persp(x,y,fa,theta=30)
persp(x,y,fa,theta=30,phi=20)
persp(x,y,fa,theta=30,phi=70)
persp(x,y,fa,theta=30,phi=40)


# Loading Data

#Auto=read.table("Auto.data")
#fix(Auto)
#Auto=read.table("Auto.data",header=T,na.strings="?")
#fix(Auto)
Auto=read.csv("data/Auto.csv",header=T,na.strings="?")
fix(Auto)
dim(Auto)
Auto[1:4,]
Auto=na.omit(Auto)
dim(Auto)
names(Auto)

# Additional Graphical and Numerical Summaries

plot(cylinders, mpg)
plot(Auto$cylinders, Auto$mpg)
attach(Auto)
plot(cylinders, mpg)
cylinders=as.factor(cylinders)
plot(cylinders, mpg)
plot(cylinders, mpg, col="red")
plot(cylinders, mpg, col="red", varwidth=T)
plot(cylinders, mpg, col="red", varwidth=T,horizontal=T)
plot(cylinders, mpg, col="red", varwidth=T, xlab="cylinders", ylab="MPG")
hist(mpg)
hist(mpg,col=2)
hist(mpg,col=2,breaks=15)
pairs(Auto)
pairs(~ mpg + displacement + horsepower + weight + acceleration, Auto)
plot(horsepower,mpg)
identify(horsepower,mpg,name)
summary(Auto)
summary(mpg)



#########################
# LINEAR ALGEBRA REVIEW #
#########################
# object of "matrix" class
?matrix
x <- matrix(data=c(1,2,3,4), nrow=2, ncol=2)
x
class(x)
x <- matrix(c(1,2,3,4),2,2)
matrix(c(1,2,3,4),2,2,byrow=TRUE)
sqrt(x)
x^2

# Indexing Data
A <- matrix(1:16,4,4)
A
A[2,3]
A[c(1,3),c(2,4)]
A[1:3,2:4]
A[1:2,]
A[,1:2]
A[1,]
A[-c(1,3),]
A[-c(1,3),-c(1,3,4)]
dim(A)


##################################################
# Operator or Function  -->	Description
# A * B     --> Element-wise multiplication
# A %*% B   --> Matrix multiplication
# t(A)      --> Transpose
# solve(A, b)	--> Returns vector x in the equation b = Ax (i.e., A-1b)
# solve(A)    --> Inverse of A where A is a square matrix.
# y<-eigen(A) --> y$val are the eigenvalues of A
#                 y$vec are the eigenvectors of A
# R<-chol(A)  --> Choleski factorization of A. Returns the upper triangular factor,
#                 such that R'R = A.
# cbind(A,B,...)--> Combine matrices(vectors) horizontally. Returns a matrix.
# rbind(A,B,...)--> Combine matrices(vectors) vertically. Returns a matrix.
# rowMeans(A)   --> Returns vector of row means.
# rowSums(A)    --> Returns vector of row sums.
# colMeans(A)   --> Returns vector of column means.
# colSums(A)    --> Returns vector of column sums.
##################################################

A <- matrix(1:8,4,2)
A
t(A)

# identity matrix I
n<-4; I4<-diag(rep(1,n)); I4
A <- matrix(1:16,4,4)
A*I4
A%*%I4


# When a matrix A is multiplied by it’s inverse A^(-1), the result is the identity matrix I.
# Only square matrices have inverses, and its determinant must be different from zero.
solve(A)
det(A)
A <- matrix( c(5, 1, 0,
               3,-1, 2,
               4, 0,-1), nrow=3, byrow=TRUE)
det(A)
solve(A)
A%*%solve(A)


# EIGENVALUES EIGENVECTORS
# An eigenvalue of a matrix A is something you can multiply some vector X by, and get the same
# answer you would if you multiplied A and X. In this situation, the vector X is an eigenvector.
#
# More formally -
# Definition: Let A be an n x n matrix. A scalar λ is called an eigenvalue of A if there is a
# nonzero vector X such that AX = λX. Such a vector X is called an eigenvector of A
# corresponding to λ.
A <- matrix(c(2,-4,-1,-1),nrow=2,byrow=T)
A
ev <- eigen(A)
ev

# The eigenvalues are always returned in decreasing order, and each column of vectors
# corresponds to the elements in values.
X1 <- ev$vectors[,1]
X2 <- ev$vectors[,2]
lambda1 <- ev$values[1]
lambda2 <- ev$values[2]

A%*%X1
lambda1*X1

A%*%X2
lambda2*X2

# Note - it's important to remember that all multiples of a eigenvector will be an
#        eigenvector of A corresponding to it's eigenvalue
X3 <- 4.123106*X1; X3
A%*%X3
lambda1*X3


# Eigenvectors are always orthogonal
solve(ev$vectors)%*%ev$vectors
X<-cbind(X1,X2)
solve(X)%*%X

# Singular Value Decomposition
# SVD is a technique to factorize a matrix, or a way of breaking the matrix up into
# three matrices. SVD is used specifically in Principal Component Analysis.
#
# IMPORTANT:
# Eigenvalues in the SVD can help you determine which features are redundant, and
# therefore reduce dimensionality!

