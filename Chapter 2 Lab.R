# Chapter 2 Lab: Introduction to R

# 2.3.1 Basic Commands

### Vectors
x <- c(1,3,2,5)
x
x = c(1,6,2)
x
y = c(1,4,3)
length(x)
length(y)
x+y
### ls():list of objects
ls()
### rm():delete
rm(x,y)
ls()
rm(list=ls())

### Matrices
?matrix
x=matrix(data=c(1,2,3,4), nrow=2, ncol=2)
x
x=matrix(c(1,2,3,4),2,2)
matrix(c(1,2,3,4),2,2,byrow=TRUE)
sqrt(x)
x^2
### Random Normal Variables with n sample size
x=rnorm(50)
y=x+rnorm(50,mean=50,sd=.1)
### Correlation
cor(x,y)
### Set of Random Numbers
set.seed(1303)
rnorm(50)
set.seed(3)
y=rnorm(100)
mean(y)
var(y)
sqrt(var(y))
sd(y)

# 2.3.2 Graphics

x=rnorm(100)
y=rnorm(100)
plot(x,y)
plot(x,y,xlab="this is the x-axis",ylab="this is the y-axis",main="Plot of X vs Y")
pdf("Figure.pdf")
plot(x,y,col="green")
### dev.off():finished creating the plot
dev.off()
### seq():sequence of numbers
x=seq(1,10)
x
x=1:10
x
x=seq(-pi,pi,length=50)
y=x
### Contour Plot
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

# 2.3.3 Indexing Data

A=matrix(1:16,4,4)
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

# 2.3.4 Loading Data

Auto=read.table("Auto.data")
### fix():view in a spreadsheet window in R
fix(Auto)
### na.strings: particular character is set to missing
Auto=read.table("Auto.data",header=T,na.strings="?")
fix(Auto)
Auto=read.csv("Auto.csv",header=T,na.strings="?")
fix(Auto)
### dim(): rows and columns
dim(Auto)
Auto[1:4,]
### na.omit(): remove rows
Auto=na.omit(Auto)
dim(Auto)
### names(): check names of variables
names(Auto)

# 2.3.5 Additional Graphical and Numerical Summaries

plot(cylinders, mpg)
plot(Auto$cylinders, Auto$mpg)
### attach(): make variables in data frame available by name
attach(Auto)
plot(cylinders, mpg)
### as.factor(): converts quantitative variables into qualitative
cylinders=as.factor(cylinders)
plot(cylinders, mpg)
plot(cylinders, mpg, col="red")
plot(cylinders, mpg, col="red", varwidth=T)
plot(cylinders, mpg, col="red", varwidth=T,horizontal=T)
plot(cylinders, mpg, col="red", varwidth=T, xlab="cylinders", ylab="MPG")
hist(mpg)
hist(mpg,col=2)
hist(mpg,col=2,breaks=15)
### pairs(): Scatterplot matrix
pairs(Auto)
pairs(~ mpg + displacement + horsepower + weight + acceleration, Auto)
plot(horsepower,mpg)
### identify(): identifying value for particular variable for points on a plot
identify(horsepower,mpg,name)
summary(Auto)
summary(mpg)
