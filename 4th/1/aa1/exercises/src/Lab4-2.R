
# Chapter 4 Lab: Logistic Regression, LDA, QDA, and KNN

# The Stock Market Data

library(ISLR)
# Percentagens de lucro diário para o indice S&P500 entre 2001 e 2005
names(Smarket)
dim(Smarket)
summary(Smarket)
pairs(Smarket)
cor(Smarket)
cor(Smarket[,-9])
attach(Smarket)
plot(Volume)

#####################
# Logistic Regression

glm.fit <- glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume, data=Smarket, family=binomial)


summary(glm.fit)
# The smallest p-value here is associated with Lag1. The negative coefficient for this predictor
# suggests that if the market had a positive return yesterday, then it is less likely to go up today. 
# However, at a value of 0.15, the p-value is still relatively large, and so there is no clear 
# evidence of a real association between Lag1 and Direction.
coef(glm.fit)
summary(glm.fit)$coef
summary(glm.fit)$coef[,4]


glm.probs <- predict(glm.fit, type="response")
# If no data set is supplied to the predict() function, then the probabilities are computed 
# for the training data that was used to fit the logistic regression model.
glm.probs[1:10]
contrasts(Direction)

# proporção dos corretamente classificados (caso se assuma "Up" para prob>0.5)
glm.pred <- rep("Down",1250)
glm.pred[glm.probs>.5]="Up"
table(glm.pred,Direction) #denominada "confusion matrix"
(507+145)/1250  
mean(glm.pred==Direction)
(141+457)/1250 # misclassification error rate, considered HIGH

###################
# The training data set will contain all observations before 2005 and 
# the testing data set will have all observations in 2005.
train <- (Year<2005)   # treino com 998 observações + teste com as restantes 225 observações 
Smarket.2005 <- Smarket[!train,] # BD de teste
dim(Smarket.2005)
Direction.2005 <- Direction[!train]


#########################################################
# Agora, apenas se fará o ajuste sobre os dados de TREINO  
glm.fit <- glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume, data=Smarket, family=binomial, subset=train)
glm.probs <- predict(glm.fit, Smarket.2005, type="response")
glm.pred <- rep("Down",252)
glm.pred[glm.probs>.5]<-"Up"
table(glm.pred,Direction.2005)
(77+44)/252
mean(glm.pred==Direction.2005) #apenas 48%, pior do que escolha aleatória
(97+34)/252
mean(glm.pred!=Direction.2005)


########
# escolha de 2 preditores "mais relevantes"
glm.fit <- glm(Direction~Lag1+Lag2, data=Smarket, family=binomial, subset=train)
glm.probs <- predict(glm.fit, Smarket.2005, type="response")
glm.pred <- rep("Down",252)
glm.pred[glm.probs>.5] <- "Up"
table(glm.pred,Direction.2005)
(35+106)/252
mean(glm.pred==Direction.2005) #resultados um pouco melhores, accuracy rate=56%

106/(106+76) #quando o modelo preve uma subida no mercado, então accuracy rate=58%
predict(glm.fit, newdata=data.frame(Lag1=c(1.2,1.5),Lag2=c(1.1,-0.8)), type="response")



##############################
# Linear Discriminant Analysis
library(MASS)
lda.fit <- lda(Direction~Lag1+Lag2,data=Smarket,subset=train)
lda.fit
# a) It returns proportions for each class
#    summary(Smarket[train,]$Direction)
#    491/(491+507)
# b) It  returns the group means, i.e. average of each predictor within each class, and
#    are used by LDA as estimates of μk. These suggest that there is a tendency for the 
#    previous 2 days’ returns to be negative on days when the market increases, and a
#    tendency for the previous days’ returns to be positive on days when the market declines.
# c) It returns coefficients of linear discriminants output provides the linear combination 
#    of Lag1 and Lag2 that are used to form the LDA decision rule.  
#    If −0.642 × Lag1 − 0.514 × Lag2 is large, then the LDA classifier will predict a market 
#    increase, and if it is small, then the LDA classifier will predict a market decline.

# Plot of The plot() function produces plots of the linear discriminants, obtained by 
# computing −0.642 × Lag1 − 0.514 × Lag2 for each of the training observations.
plot(lda.fit)

lda.pred <- predict(lda.fit, Smarket.2005)
names(lda.pred)
# First element, class, contains LDA’s predictions about the movement of the market. 
# Second element, posterior, is a matrix whose kth column contains the posterior probability
# that the corresponding observation belongs to the kth class. 
# Finally, x contains the linear discriminants, described earlier.

lda.class <- lda.pred$class
table(lda.class,Direction.2005)
mean(lda.class==Direction.2005) #accuracy rate=56%, equivalent to logistic regression

#sum(lda.pred$posterior[,1]>=.5)
#sum(lda.pred$posterior[,1]<.5)
#lda.pred$posterior[1:20,1]
#lda.class[1:20]
#sum(lda.pred$posterior[,1]>.9)



#################################
# Quadratic Discriminant Analysis
qda.fit <- qda(Direction~Lag1+Lag2,data=Smarket,subset=train)
qda.fit
qda.class <- predict(qda.fit,Smarket.2005)$class
table(qda.class,Direction.2005)
mean(qda.class==Direction.2005)  #accuracy rate=60%




#####################
# K-Nearest Neighbors
library(class)

# The splitting of data here will be different from what we did for logistic regression, 
# LDA, and QDA. This is because the knn() fuction is built to take different arguements 
# compared to glm(), lda(), and qda().
# For knn(), we have to have our y variable in a separate column from the training and 
# testing data. In addition to this issue, we have to standardize our numerical variables 
# because the KNN method classifies observations using distance measures.
train.X=cbind(scale(Lag1),scale(Lag2))[train,]
#train.X=cbind(Lag1,Lag2)[train,]
head(train.X)
test.X=cbind(scale(Lag1),scale(Lag2))[!train,]
#test.X=cbind(Lag1,Lag2)[!train,]
train.Direction=Direction[train]

# The knn() function uses a random number generator to train the model. In order to get the 
# same output for your analysis everytime you run your R code, then make sure to set the same 
# seed every time you run your R code.
set.seed(1)
knn.pred=knn(train.X,test.X,train.Direction,k=1)
table(knn.pred,Direction.2005)
mean(knn.pred==Direction.2005) #accuracy rate=50%

knn.pred=knn(train.X,test.X,train.Direction,k=3)
table(knn.pred,Direction.2005)
mean(knn.pred==Direction.2005) #accuracy rate=50%




# An Application to Caravan Insurance Data

dim(Caravan)
attach(Caravan)
summary(Purchase)
348/5822
standardized.X=scale(Caravan[,-86])
var(Caravan[,1])
var(Caravan[,2])
var(standardized.X[,1])
var(standardized.X[,2])
test=1:1000
train.X=standardized.X[-test,]
test.X=standardized.X[test,]
train.Y=Purchase[-test]
test.Y=Purchase[test]
set.seed(1)
knn.pred=knn(train.X,test.X,train.Y,k=1)
mean(test.Y!=knn.pred)
mean(test.Y!="No")
table(knn.pred,test.Y)
9/(68+9)
knn.pred=knn(train.X,test.X,train.Y,k=3)
table(knn.pred,test.Y)
5/26
knn.pred=knn(train.X,test.X,train.Y,k=5)
table(knn.pred,test.Y)
4/15
glm.fit=glm(Purchase~.,data=Caravan,family=binomial,subset=-test)
glm.probs=predict(glm.fit,Caravan[test,],type="response")
glm.pred=rep("No",1000)
glm.pred[glm.probs>.5]="Yes"
table(glm.pred,test.Y)
glm.pred=rep("No",1000)
glm.pred[glm.probs>.25]="Yes"
table(glm.pred,test.Y)
11/(22+11)


