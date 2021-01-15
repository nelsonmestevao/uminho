# Chapter 6 Lab 1: Subset Selection Methods

# Best Subset Selection
library(ISLR)
#fix(Hitters)
?Hitters
names(Hitters)
dim(Hitters)
sum(is.na(Hitters$Salary)) #Salary is missing for 59 players
Hitters=na.omit(Hitters)
dim(Hitters)
sum(is.na(Hitters))

library(leaps)
#regsubsets() function performs best sub-set selection by identifying the best model
#that contains a given number of predictors, where best is quantified using RSS
regfit.full=regsubsets(Salary~.,Hitters)
summary(regfit.full)
# best one-variable model contains only CRBI
# best two-variable model contains Hits and CRBI

regfit.full=regsubsets(Salary~.,data=Hitters,nvmax=19) #let's fit up to a 19-variable model
reg.summary=summary(regfit.full)
names(reg.summary)
reg.summary$rsq

par(mfrow=c(2,2))
plot(reg.summary$rss,xlab="Number of Variables",ylab="RSS",type="l")
plot(reg.summary$adjr2,xlab="Number of Variables",ylab="Adjusted RSq",type="l")
which.max(reg.summary$adjr2)
points(11,reg.summary$adjr2[11], col="red",cex=2,pch=20)
plot(reg.summary$cp,xlab="Number of Variables",ylab="Cp",type='l')
which.min(reg.summary$cp)
points(10,reg.summary$cp[10],col="red",cex=2,pch=20)
which.min(reg.summary$bic)
plot(reg.summary$bic,xlab="Number of Variables",ylab="BIC",type='l')
points(6,reg.summary$bic[6],col="red",cex=2,pch=20)

?regsubsets
# top row of each plot contains a black square for each variable
# selected according to the optimal model associated with that statistic
plot(regfit.full,scale="r2")
plot(regfit.full,scale="adjr2")
plot(regfit.full,scale="Cp")
plot(regfit.full,scale="bic")
coef(regfit.full,6)



# Forward and Backward Stepwise Selection

regfit.fwd=regsubsets(Salary~.,data=Hitters,nvmax=19,method="forward")
summary(regfit.fwd)
regfit.bwd=regsubsets(Salary~.,data=Hitters,nvmax=19,method="backward")
summary(regfit.bwd)
coef(regfit.full,7)
coef(regfit.fwd,7)
coef(regfit.bwd,7)


# Choosing Among Models

set.seed(1)
train=sample(c(TRUE,FALSE), nrow(Hitters),rep=TRUE)
test=(!train)
regfit.best=regsubsets(Salary~.,data=Hitters[train,],nvmax=19)
# model.matrix() used to buid a matrix with predictors from data
test.mat=model.matrix(Salary~.,data=Hitters[test,]) #matrix n.test x 20

# Now we run a loop, and for each size i, we extract the coefficients from regfit.best for
# the best model of that size, multiply them into the appropriate columns of the test model
# matrix to form the predictions, and compute the test MSE.
val.errors=rep(NA,19)
for(i in 1:19){
  coefi=coef(regfit.best,id=i)
  pred=test.mat[,names(coefi)]%*%coefi
  val.errors[i]=mean((Hitters$Salary[test]-pred)^2)
}
val.errors
which.min(val.errors) # modelo c 10 preditores tem menor test MSE
coef(regfit.best,10)


# let's write our own predict method
predict.regsubsets=function(object,newdata,id,...){
  form=as.formula(object$call[[2]])
  mat=model.matrix(form,newdata)
  coefi=coef(object,id=id)
  xvars=names(coefi)
  mat[,xvars]%*%coefi
}

# Note that we perform best subset selection on the full data set and select best ten-variable
# model, rather than simply using the variables that were obtained from the training set, because
# the best ten-variable model on the full data set may differ from the corresponding model on
# the training set.
regfit.best=regsubsets(Salary~.,data=Hitters,nvmax=19)
coef(regfit.best,10)


# We now try to choose among the models of different sizes using cross-validation, so
# we must perform best subset selection within each of the k training sets
k=10
set.seed(1)
folds=sample(1:k,nrow(Hitters),replace=TRUE)
cv.errors=matrix(NA,k,19, dimnames=list(NULL, paste(1:19)))
for(j in 1:k){
  best.fit=regsubsets(Salary~.,data=Hitters[folds!=j,],nvmax=19)
  for(i in 1:19){
    pred=predict(best.fit,Hitters[folds==j,],id=i)
    cv.errors[j,i]=mean( (Hitters$Salary[folds==j]-pred)^2)
  }
}
# This has given us a 10×19 matrix, of which the (i, j)th element corresponds to the
# test MSE for the ith cross-validation fold for the best j-variable model
mean.cv.errors=apply(cv.errors,2,mean)
mean.cv.errors

par(mfrow=c(1,1))
plot(mean.cv.errors,type='b')
reg.best=regsubsets(Salary~.,data=Hitters, nvmax=19)
coef(reg.best,11)


