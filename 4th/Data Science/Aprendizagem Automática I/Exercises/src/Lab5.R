
# Chaper 5 Lab: Cross-Validation and the Bootstrap

# The Validation Set Approach

library(ISLR)
set.seed(1)
dim(Auto)
train=sample(392,196) #selecionar amostra sem reposição
lm.fit=lm(mpg~horsepower,data=Auto,subset=train) #modelo linear
attach(Auto)
mean((mpg-predict(lm.fit,Auto))[-train]^2) #MSE (yi-\hat{yi})^2 para os dados de teste
#[1] 26.14142

lm.fit2=lm(mpg~poly(horsepower,2),data=Auto,subset=train) #modelo quadrático
mean((mpg-predict(lm.fit2,Auto))[-train]^2) #MSE
#[1] 19.82259

lm.fit3=lm(mpg~poly(horsepower,3),data=Auto,subset=train) #modelo cúbico
mean((mpg-predict(lm.fit3,Auto))[-train]^2) #MSE
#[1] 19.78252

set.seed(2)
train=sample(392,196) #selecionar nova amostra sem reposição
lm.fit=lm(mpg~horsepower,subset=train)
mean((mpg-predict(lm.fit,Auto))[-train]^2) #MSE=23.29559
lm.fit2=lm(mpg~poly(horsepower,2),data=Auto,subset=train)
mean((mpg-predict(lm.fit2,Auto))[-train]^2) #MSE=18.90124
lm.fit3=lm(mpg~poly(horsepower,3),data=Auto,subset=train)
mean((mpg-predict(lm.fit3,Auto))[-train]^2) #MSE=19.2574

# Leave-One-Out Cross-Validation

# The LOOCV estimate can be automatically computed for any generalized linear model
# using the glm() and cv.glm() functions.
glm.fit=glm(mpg~horsepower,data=Auto)
coef(glm.fit)
lm.fit=lm(mpg~horsepower,data=Auto)
coef(lm.fit)

library(boot)
glm.fit=glm(mpg~horsepower,data=Auto)
cv.err=cv.glm(Auto, glm.fit)
cv.err$delta[1] #contain the cross-validation result
cv.error=rep(0,5)
# MSE calculado para polinómios de diferentes ordens, debaixo do método Leave-One-Out
for (i in 1:5){
  glm.fit=glm(mpg~poly(horsepower,i),data=Auto)
  cv.error[i]=cv.glm(Auto,glm.fit)$delta[1]
}
cv.error


# k-Fold Cross-Validation

set.seed(17)
cv.error.10=rep(0,10)
# MSE calculado para polinómios de diferentes ordens, debaixo do método k-fold
for (i in 1:10){
  glm.fit=glm(mpg~poly(horsepower,i),data=Auto)
  cv.error.10[i]=cv.glm(Auto,glm.fit,K=10)$delta[1]
}
cv.error.10


# The Bootstrap

# definição da função "alpha.fn"
alpha.fn=function(data,index){
  X=data$X[index]
  Y=data$Y[index]
  return((var(Y)-cov(X,Y))/(var(X)+var(Y)-2*cov(X,Y)))
}
?Portfolio
summary(Portfolio)
dim(Portfolio)
plot(Portfolio$X,Portfolio$Y)
alpha.fn(Portfolio,1:100)
set.seed(1)
alpha.fn(Portfolio,sample(100,100,replace=T)) #estimativa do alpha para uma amostra com reposição

# Generate R bootstrap replicates of a statistic applied to data.
boot(Portfolio,alpha.fn,R=1000)



# Estimating the Accuracy (exatidão) of a Linear Regression Model

# definição da função "boot.fn"
boot.fn=function(data,index)
  return(coef(lm(mpg~horsepower,data=data,subset=index)))
boot.fn(Auto,1:392)

set.seed(1)
boot.fn(Auto,sample(392,392,replace=T))
boot.fn(Auto,sample(392,392,replace=T))

# Generate R bootstrap replicates
boot(Auto, boot.fn, 1000)
summary(lm(mpg~horsepower,data=Auto))$coef

# definição de nova função "boot.fn"
boot.fn=function(data,index)
  coefficients(lm(mpg~horsepower+I(horsepower^2),data=data,subset=index))
set.seed(1)
boot(Auto,boot.fn,1000)
summary(lm(mpg~horsepower+I(horsepower^2),data=Auto))$coef
