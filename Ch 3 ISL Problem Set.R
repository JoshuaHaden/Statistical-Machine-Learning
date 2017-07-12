#Applied
#8. A.
library(ISLR)
data(Auto)
head(Auto)
AutoLinReg <- lm(mpg ~ horsepower, data=Auto)
summary(AutoLinReg)
predict(AutoLinReg,data.frame(horsepower = 98), interval="confidence")
predict(AutoLinReg,data.frame(horsepower = 98), interval="prediction")

#8. B.
plot(Auto$horsepower,Auto$mpg, main="MPG vs Horsepower", xlab="Horsepower",
     ylab="MPG")
abline(AutoLinReg, col="red")
par(mfrow=c(2,2))
plot(AutoLinReg)

#9. A.
pairs(Auto)

#9. B.
names(Auto)
cor(Auto[1:8])

#9. C.
Autofit1 <- lm(mpg ~ . - name,data=Auto)
summary(Autofit1)

#9. D.
par(mfrow=c(2,2))
plot(Autofit1)

#9. E. 
Autofit2 <- lm(mpg ~ cylinders * displacement+displacement * weight
               ,data=Auto[,1:8])
summary(Autofit2)

#9. F.
par(mfrow=c(2,2))
plot(log(Auto$horsepower), Auto$mpg)
plot(sqrt(Auto$horsepower), Auto$mpg)
plot((Auto$horsepower)^2, Auto$mpg)

#10. A.
data("Carseats")
CS <- lm(Sales ~ Price + Urban + US, data=Carseats)
summary(CS)

#10. B.
?Carseats

#10. E.
CS1 <- lm(Sales ~ Price + US, data=Carseats)
summary(CS1)

#10. F. 
confint(CS1)

#10. H.
par(mfrow=c(2,2))
plot(CS1)

#11. 
set.seed(1)
x <- rnorm(100)
y <- 2*x +rnorm(100)

#11. A.
lm1 <- lm(y ~ x + 0)
summary(lm1)

#11. B.
lm2 <- lm(x ~ y + 0)
summary(lm2)

#11. D.
n <- length(x)
t <- sqrt(n - 1)*(x %*% y)/sqrt(sum(x^2) * sum(y^2) - (x %*% y)^2)
as.numeric(t)

#11. F.
lm3 <- lm(y ~ x)
summary(lm3)

lm4 <- lm(x ~ y)
summary(lm4)

#12. B.
set.seed(1)
x <- 1:100
sum(x^2)
y <- 2 * x + rnorm(100, sd = 0.1)
sum(y^2)

lm.Y <- lm(y ~ x + 0)
lm.X <- lm(x ~ y + 0)
summary(lm.Y)
summary(lm.X)

#12. C.
x <- 1:100
sum(x^2)
y <- 100:1
sum(y^2)

lm.Y <- lm(y ~ x + 0)
lm.X <- lm(x ~ y + 0)
summary(lm.Y)
summary(lm.X)

#13. A.
set.seed(1)
x <- rnorm(100)

#13. B.
eps <- rnorm(100, sd = sqrt(0.25))

#13. C. 
y <- -1 + 0.5 * x + eps
length(y)

#13. D.
plot(x,y)

#13. E. 
lm13e <- lm(y ~ x)
summary(lm13e)

#13. F.
plot(x, y)
abline(lm13e, col = "red")
abline(-1, 0.5, col = "blue")
legend("topleft", c("Least square", "Regression"), col = c("red", "blue")
       , lty = c(1, 1))

#13. G. 
lm13g <- lm(y ~ x + I(x^2))
summary(lm13g)

#13. H.
set.seed(1)
eps <- rnorm(100, sd = 0.125)
x <- rnorm(100)
y <- -1 + 0.5 * x + eps
plot(x, y)
lm13h <- lm(y ~ x)
summary(lm13h)
abline(lm13h, col = "red")
abline(-1, 0.5, col = "blue")
legend("topleft", c("Least square", "Regression"), col = c("red", "blue"),
       lty = c(1, 1))

#13. I.
set.seed(1)
eps <- rnorm(100, sd = 0.5)
x <- rnorm(100)
y <- -1 + 0.5 * x + eps
plot(x, y)
lm13i <- lm(y ~ x)
summary(lm13i)
abline(lm13i, col = "red")
abline(-1, 0.5, col = "blue")
legend("topleft", c("Least square", "Regression"), col = c("red", "blue"),
       lty = c(1, 1))

#13. J.
confint(lm13e)
confint(lm13h)
confint(lm13i)

#14. A.
set.seed(1)
x1 <- runif(100)
x2 <- 0.5 * x1 + rnorm(100)/10
y <- 2 + 2 * x1 + 0.3 * x2 + rnorm(100)

#14. B.
cor(x1,x2)
plot(x1,x2)

#14. C. 
lm14c <- lm(y ~ x1 + x2)
summary(lm14c)

#14. D. 
lm14d <- lm(y ~ x1)
summary(lm14d)

#14. E. 
lm14e <- lm(y ~ x2)
summary(lm14e)

#14. G. 
x1 <- c(x1, 0.1)
x2 <- c(x2, 0.8)
y <- c(y, 6)
lm14g1 <- lm(y ~ x1 + x2)
lm14g2 <- lm(y ~ x1)
lm14g3 <- lm(y ~ x2)
summary(lm14g1)
summary(lm14g2)
summary(lm14g3)
plot(lm14g1)
plot(lm14g2)
plot(lm14g3)

#15. A.
library(MASS)
attach(Boston)
Boston.zn <- lm(crim ~ zn)
summary(Boston.zn)
Boston.indus <- lm(crim ~ indus)
summary(Boston.indus)
chas <- as.factor(chas)
Boston.chas <- lm(crim ~ chas)
summary(Boston.chas)
Boston.nox <- lm(crim ~ nox)
summary(Boston.nox)
Boston.rm <- lm(crim ~ rm)
summary(Boston.rm)
Boston.age <- lm(crim ~ age)
summary(Boston.age)
Boston.dis <- lm(crim ~ dis)
summary(Boston.dis)
Boston.rad <- lm(crim ~ rad)
summary(Boston.rad)
Boston.tax <- lm(crim ~ tax)
summary(Boston.tax)
Boston.ptratio <- lm(crim ~ ptratio)
summary(Boston.ptratio)
Boston.black <- lm(crim ~ black)
summary(Boston.black)
Boston.lstat <- lm(crim ~ lstat)
summary(Boston.lstat)
Boston.medv <- lm(crim ~ medv)
summary(Boston.medv)

#15. B.
Boston.all <- lm(crim ~ ., data = Boston)
summary(Boston.all)

#15. C.
simple.reg <- vector("numeric",0)
simple.reg <- c(simple.reg, Boston.zn$coefficient[2])
simple.reg <- c(simple.reg, Boston.indus$coefficient[2])
simple.reg <- c(simple.reg, Boston.chas$coefficient[2])
simple.reg <- c(simple.reg, Boston.nox$coefficient[2])
simple.reg <- c(simple.reg, Boston.rm$coefficient[2])
simple.reg <- c(simple.reg, Boston.age$coefficient[2])
simple.reg <- c(simple.reg, Boston.dis$coefficient[2])
simple.reg <- c(simple.reg, Boston.rad$coefficient[2])
simple.reg <- c(simple.reg, Boston.tax$coefficient[2])
simple.reg <- c(simple.reg, Boston.ptratio$coefficient[2])
simple.reg <- c(simple.reg, Boston.black$coefficient[2])
simple.reg <- c(simple.reg, Boston.lstat$coefficient[2])
simple.reg <- c(simple.reg, Boston.medv$coefficient[2])
mult.reg <- vector("numeric", 0)
mult.reg <- c(mult.reg, Boston.all$coefficients)
mult.reg <- mult.reg[-1]
plot(simple.reg, mult.reg, col = "red")

cor(Boston[-c(1,4)])

#15. D.
Boston.zn2 <- lm(crim ~ poly(zn, 3))
summary(Boston.zn2)
Boston.indus2 <- lm(crim ~ poly(indus, 3))
summary(Boston.indus2)
Boston.nox2 <- lm(crim ~ poly(nox, 3))
summary(Boston.nox2)
Boston.rm2 <- lm(crim ~ poly(rm, 3))
summary(Boston.rm2)
Boston.age2 <- lm(crim ~ poly(age, 3))
summary(Boston.age2)
Boston.dis2 <- lm(crim ~ poly(dis, 3))
summary(Boston.dis2)
Boston.rad2 <- lm(crim ~ poly(rad, 3))
summary(Boston.rad2)
Boston.tax2 <- lm(crim ~ poly(tax, 3))
summary(Boston.tax2)
Boston.ptratio2 <- lm(crim ~ poly(ptratio, 3))
summary(Boston.ptratio2)
Boston.black2 <- lm(crim ~ poly(black, 3))
summary(Boston.black2)
Boston.lstat2 <- lm(crim ~ poly(lstat, 3))
summary(Boston.lstat2)
Boston.medv2 <- lm(crim ~ poly(medv, 3))
summary(Boston.medv2)
