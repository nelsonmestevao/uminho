###################################
# Exercises Sheet 3 - Classification
###################################

#############
# EXERCICIO 1
b0=-6; b1=0.05; b2=1

# (a)
x1=40; x2=3.5
eta=b0+b1*x1+b2*x2 # preditor linear
exp(eta)/(1+exp(eta)) #probabilidade p estimada
# 0.3775407


#############
# EXERCICIO 2
library(ISLR)
?Auto
dim(Auto)

attach(Auto)
names(Auto)
# [1] "mpg"          "cylinders"    "displacement" "horsepower"   "weight"     
# [6] "acceleration" "year"         "origin"       "name"   
summary(Auto)
# response variable: miles per gallon (mpg)

# (a)
median(Auto$mpg)
mpg01 <- Auto$mpg > median(Auto$mpg)
newdata <- data.frame(cbind(mpg01, Auto))
dim(Auto)
sum(mpg01)
dim(newdata) #392 registos, destes 196 "mais economicos" (acima da mediana de milhas percorridas por galão)
head(newdata)

# (b)
attach(newdata)
#NOTE:  if mpg01=T, then "more economic" (percorrem mais milhas por galão)
table(mpg01,cylinders) #less cylinders, more economic
table(mpg01,origin) #origin 1=American 2=European 3=Japanese. 173 "less economic" are american
boxplot(mpg~origin)

par(mfrow=c(2,2))
boxplot(displacement~mpg01) #lower displacement, more economic
boxplot(horsepower~mpg01) #lower horsepower, more economic
boxplot(weight~mpg01) #lower weight, more economic
boxplot(acceleration~mpg01) #larger acceleration, more economic

# Alguns graficos
pairs(Auto[,-c(2,7,8,9)]) #preditores quantitativos
cor(Auto[,-c(2,7,8,9)]) #preditores quantitativos
#                     mpg displacement horsepower   weight acceleration
# mpg           1.0000000   -0.8051269 -0.7784268 -0.8322442    0.4233285




# (f) Logistic Regression
model1 <- glm(mpg01~cylinders+displacement+horsepower+weight+acceleration+as.factor(origin),family=binomial)
summary(model1)

model2 <- glm(mpg01~displacement+horsepower+weight+acceleration+as.factor(origin),family=binomial)
summary(model2)

model3 <- glm(mpg01~displacement+horsepower+weight+acceleration,family=binomial)
summary(model3)

model4 <- glm(mpg01~displacement+horsepower+weight, family=binomial)
summary(model4)

extractAIC(model1); extractAIC(model2); extractAIC(model3); extractAIC(model4)

glm.probs <- predict(model4, type="response")
glm.probs[1:10]
contrasts(mpg01)

head(mpg01,20)
newdata[20,] # observação 20, classificado como "economico" 
glm.probs[20]


# proporção dos corretamente classificados (caso se assuma "Economic" para prob>0.5)
glm.pred <- rep("Expensive",392)
glm.pred[glm.probs>.5]="Economic"
table(glm.pred, mpg01) #denominada "confusion matrix"
(180+172)/392  #bem classificados
(24+16)/392 # misclassification error rate, considered OK


# (c) Split data into TRANINING + TEST
# The training data set will contain all observations before 2005 and 
# the testing data set will have all observations in 2005.
?sample #escolha aleatoria de 100 entradas da DB
train <- sample(392, 100)
newdata.test <- newdata[!train,]
dim(newdata.test)


