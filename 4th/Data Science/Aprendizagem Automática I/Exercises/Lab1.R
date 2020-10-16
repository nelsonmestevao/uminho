# Lab 1: Prob&Stats Review with R

# EXPLORATORY DATA ANALYSIS
typos <- c(2,3,0,3,1,0,0,1)
typos

is.vector(typos)
class(typos)
mean(typos)
sd(typos)
summary(typos)
length(typos)
?length

#
month <- c(9, 10, 4, 8, 7, 9, 3, 8, 4, 1, 5, 2, 12, 4, 10, 3, 2, 2, 12, 4, 6, 1, 6, 6, 12, 4, 12, 1, 8, 2, 2, 1, 6, 12, 6, 5, 10, 11, 8, 5, 4, 8, 3, 11, 11, 9, 8, 9, 8, 6, 5, 7, 12, 2, 2, 6, 4, 4, 7, 8, 4, 2, 6, 1, 4, 6, 2, 8, 11, 10, 6, 5, 4, 1, 8, 3, 7, 8, 9, 7, 8, 9, 8, 8, 5, 1, 1, 3, 7, 7, 12, 3, 1, 7, 11, 9, 4, 5, 2, 9)
aux <- read.table(file="GenderBirthMonth.txt", header=T) > names(aux)
month <- aux$birthmonth
gender <- aux$gender
summary(month) #WRONG
summary(gender)

table(gender)
table(month)
table(gender,month)
barplot(table(gender,month), beside=T,
        legend.text=c("fem","male"),
        main= "Distribution of birth months per gender",
        xlab="month", ylab="frequency")


#
beer <- c(3, 4, 1, 1, 3, 4, 3, 3, 1, 3, 2, 1, 2, 1, 2, 3,
          2, 3, 1, 1, 1, 1, 4, 3, 1)
barplot(beer)  # NO, this isn’t correct
barplot(table(beer))
barplot(table(beer)/length(beer))
factor(beer);
beer.counts <- table(beer);
names(beer.counts) <- c("d can", "d bottle", "microbrew", "import")
pie(beer.counts, col=c("blue", "green", "red", "yellow"))


#
?faithful
names(faithful)
attach(faithful)
summary(eruptions)
stem(eruptions, scale=0.5)

par(mfrow=c(1,2))
hist(eruptions, breaks=seq(from=1.05, to=6, by=1/4), freq=F,
     main="Histogram for eruptions",
     xlab = "duration (min)", ylab = "frequency")
er.small <- eruptions[eruptions<3]
summary(er.small)
boxplot(er.small, main="Boxplot for small eruptions",
        ylim=range(1.5,5.1), ylab="duration (min)")


#
experimental <- c(5, 5, 5, 13, 7, 11, 11, 9, 8, 9)
control <- c(11, 8, 4, 5, 9, 5, 10, 5, 4, 10)
boxplot(experimental, control)

data <- c(experimental, control)
type <- c(rep("experim.",10), rep("control",10))
data
type
boxplot(data ~ type)


#
?Orange
names(Orange); attach(Orange)
plot(age, circumference, main="scatterplot")

cor(Orange$age, Orange$circumference) #default is Pearson coefficient


#
quality <- 1:10
SO2 <- c(0.9,2.7,1.8,2.9,3.5,3.1,3.7,3.3,4.9,4.7)
cor(quality, SO2, method="spearman")


#
weight = c(150, 135, 210, 140)
height = c(65, 61, 70, 65)
gender = c("Fe","Fe","M","Fe")
study = data.frame(weight,height,gender)
study

row.names(study)<-c("Mary","Alice","Bob","Judy")
study

study$weight
study[,"weight"]
study[,1]

study["Alice",]
study[2,]

study[study$gender == "Fe", ]


# library MASS
library(MASS); data(Cars93); attach(Cars93)
## make some categorical variables using cut
Price
priceCat <- cut(Price,c(0,12,20,max(Price)))
priceCat
levels(priceCat) <- c("cheap","okay","expensive")
priceCat

mpgCat <- cut(MPG.highway,c(0,20,30,max(MPG.highway)))
levels(mpgCat) <- c("miser","okay","gas guzzler")

table(Type)
table(priceCat,Type)
table(priceCat,Type,mpgCat)

boxplot(Cars93$Price ~ Cars93$Type)


###################################
# BINOMIAL
dbinom(2,size=10,prob=0.3)
rbinom(20,1,0.5)
rbinom(10,100,0.5)

# POISSON
dpois(2,lambda=3)
par(mfrow=c(1,3))
x<-seq(0,6); prob<-dpois(x,0.5); plot(x,prob,main="lambda 0.5",t="h")
x<-seq(0,10); prob<-dpois(x,1); plot(x,prob,main="lambda 1",t="h")
x<-seq(0,10); prob<-dpois(x,4); plot(x,prob,main="lambda 4",t="h")

# EXPONENTIAL
?pexp

# NORMAL
?dnorm
x<-seq(-4,4,0.1); pr<-dnorm(x,mean=0,sd=1); plot(x,pr,t="l",ylab="f(x)")
pr<-dnorm(x,mean=0,sd=2); lines(x,pr); text(list(x=-0.1,y=0.21),"N(0,2)")
pr<-dnorm(x,mean=0,sd=3); lines(x,pr)
text(list(x=-0.1,y=0.14),"N(0,3)")


# CLT
allSums <- rep(0,200)
for (k in 1:200) allSums[k] <- sum(rexp(100,rate=10))
hist(allSums,freq=F); x <- seq(7,12,0.1); lines(x,dnorm(x,10,1))
