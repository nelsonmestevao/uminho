# ==============================================================================
# Universidade do Minho
# Escola de Engenharia                              Departamento de Informática
# ------------------------------------------------------------------------------
# Mestrado em Engenharia Informática
# Perfil de Ciência de Dados
# ------------------------------------------------------------------------------
# Aprendizagem Automática 1                                           2018/2019
# Exame de Recurso
# ==============================================================================


# ------------------------------------------------------------------------------
# 2.
# ------------------------------------------------------------------------------

?airquality
head(airquality)
summary(airquality) #Solar.R=100 lang, Wind=10 mph e Temp=60 degrees F


# a)
require(graphics)
pairs(airquality[,-c(5,6)], panel = panel.smooth, main = "airquality data")

plot(airquality$Solar.R, airquality$Ozone)
abline(line(airquality$Solar.R, airquality$Ozone))

pairs(airquality[,-c(5,6)])
cor(airquality[,-c(5,6)], use="pairwise.complete.obs")
cor(airquality[,-c(5,6)], use="pairwise.complete.obs",method="spearman")
# Como se relaciona a variavel Ozone com cada uma das 3 variaveis Solar.R, Wind e Temp?
# Relação positiva/negativa, forte/fraca

# b)
boxplot(Ozone~Month) # Comente?
#Quando se observam valores mais elevados de ozono, consequencia da sua relação com a temperatura

# c)
m1<-lm(Ozone~Solar.R+Wind+Temp) #R2 0.5948
summary(m1)
#              Estimate Std. Error t value Pr(>|t|)
# (Intercept) -64.34208   23.05472  -2.791  0.00623 **
#   Solar.R       0.05982    0.02319   2.580  0.01124 *
#   Wind         -3.33359    0.65441  -5.094 1.52e-06 ***
#   Temp          1.65209    0.25353   6.516 2.42e-09 ***

# i. Compreender/quantificar a influencia das 3 variaveis meteorologicas no Ozono.
#    Eventualmente, adotar este modelo para previsão de valores de ozono debaixo de condições
#    especificas.

# ii. Interpretar sinais e valores das estimativas

# iii. Sim, pois os respetivos p-valores apontam para a rejeicao da hipotese nula (estimativa do
#      coeficiente nula), pois são inferiores aos niveis de significancia habitualmente adotados
#      de 1% ou 5%

# d)
# Predict Ozone para Solar.R=100 lang, Wind=10 mph e Temp=60 degrees F
-64.34208 + 0.05982*100 -3.33359*10 + 1.65209*60   #7.42942 ppb
?predict
predict.lm(m1, newdata=data.frame(Solar.R=c(100), Wind=c(10),Temp=c(60))) # 7.429642 ppb

# e) Supervisionado / Regressão



# ------------------------------------------------------------------------------
# 3.
# ------------------------------------------------------------------------------
library(MASS)
?Pima.tr
summary(Pima.tr)
# a) n=200 e p=8
dim(Pima.tr) #Quantos registos na base de dados?
sum(Pima.tr$type=="Yes") # Quantas mulheres têm diabetes de acordo com a Organização Mundial de Saude?
mean(Pima.tr$age[Pima.tr$type=="Yes"]) # Qual a idade média das mulheres que têm diabetes? 37.7
mean(Pima.tr$age[Pima.tr$type=="No"]) # Qual a idade média das mulheres que nao têm diabetes? 29.2
min(Pima.tr$npreg); max(Pima.tr$npreg) # 0, 14

par(mfrow=c(2,3))
hist(Pima.tr$glu); hist(Pima.tr$bp); hist(Pima.tr$skin); hist(Pima.tr$bmi); hist(Pima.tr$ped); hist(Pima.tr$age)


# b)
m1=glm(type~., data=Pima.tr, family=binomial)
summary(m1) #AIC: 194.39
# Possível solução desconsiderar os preditores que têm p-valor superior a 10%

# c)
m2=glm(type~glu+bmi+ped+age, data=Pima.tr, family=binomial)

# i. menor AIC, logo modelo preferivel
summary(m2) #AIC: 191.08

# ii.
round(exp(c(0.031255, 0.077030, 1.719794, 0.058603)), 2)
# [1] 1.03 1.08 5.58 1.06
# para cada aumento unitário de “glu”, o risco de diabetes aumenta 3% (i.e. ODDS=P[Sucesso]/P[Falha])
# para cada aumento unitário de “bmi”, o risco de diabetes aumenta 8%
# para cada aumento unitário de “ped”, o risco de diabetes aumenta mais de 5 vezes
# para cada aumento unitário de “age”, o risco de diabetes aumenta 6%

# iii.
?predict.glm
predict.glm(m2, newdata=data.frame(glu=124, bmi=32.31,
        ped=0.4608, age=32), type="response")  #28.1%
# Alternativamente, calcular
# exp(-9.971388+0.031255*124+...+0.058603*32)/(1+exp(-9.971388+0.031255*124+...+0.058603*3)



# ------------------------------------------------------------------------------
# 4.
# ------------------------------------------------------------------------------
dim(Pima.te)
