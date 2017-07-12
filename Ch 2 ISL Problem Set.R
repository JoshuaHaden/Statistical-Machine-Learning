###8. A.
College=read.csv("College.csv")

###8. B.
fix(College)
head(College[,1:5])
rownames(College)=College[,1]
fix(College)
College=College[,-1]
fix(College)
head(College[,1:5])

###8. C.
summary(College)
pairs(College[,1:10])
plot(College$Private, College$Outstate, xlab = "Private University",
     ylab = "Out of State Tuition in $", main = "Outstate vs Private Plot")
Elite <- rep("No",nrow(College))
Elite[College$Top10perc > 50] = "Yes"
Elite=as.factor(Elite)
College=data.frame(College,Elite)
College$Elite <- Elite
summary(College$Elite)
plot(College$Elite, College$Outstate, xlab = "Elite University",
     ylab = "Out of State Tuition in $", main = "Outstate vs Elite Plot")
par(mfrow=c(2,2))
hist(College$Books, col=1,xlab="Books",ylab="Count")
hist(College$PhD, col=3,xlab="PhD",ylab="Count")
hist(College$Grad.Rate, col=5,xlab="Grad Rate",ylab="Count")
hist(College$perc.alumni, col=7,xlab="% alumni",ylab="Count")
summary(College$PhD)
OddPhd <- College[College$PhD == 103,]
nrow(OddPhd)
OddPhd$X

###9. A.
auto <- read.csv("Auto.csv", na.strings = "?")
auto <- na.omit(auto)
str(auto)

###9. B. 
#Range is calculated as the difference between max and min
summary(auto[,-c(4,9)])

###9. C. 
sapply(auto[,-c(4,9)],mean)
sapply(auto[,-c(4,9)],sd)

###9. D.
subsetauto <- auto[-c(10:85),-c(4,9)]
sapply(subsetauto,range)
sapply(subsetauto,mean)
sapply(subsetauto,sd)

###9. E.
pairs(auto)

###9. F. 
cor(auto$weight,auto$horsepower)
cor(auto$weight,auto$displacement)
cor(auto$displacement,auto$horsepower)

###10. A.
library(MASS)
?Boston
nrow(Boston)
ncol(Boston)
head(Boston)

###10. B.
par(mfrow = c(2, 2))
plot(Boston$nox, Boston$crim)
plot(Boston$rm, Boston$crim)
plot(Boston$age, Boston$crim)
plot(Boston$dis, Boston$crim)

###10. C.
hist(Boston$crim, breaks = 50)
pairs(Boston[Boston$crim < 20, ])

###10. D.
hist(Boston$crim, breaks = 50)
nrow(Boston[Boston$crim > 20, ])
hist(Boston$tax, breaks = 50)
nrow(Boston[Boston$tax == 666, ])
hist(Boston$ptratio, breaks = 50)
nrow(Boston[Boston$ptratio > 20, ])

###10. E. 
nrow(Boston[Boston$chas == 1, ])

###10. F.
median(Boston$ptratio)

###10. G.
row.names(Boston[min(Boston$medv), ])
range(Boston$tax)
Boston[min(Boston$medv), ]$tax

###10. H.
nrow(Boston[Boston$rm > 7, ])
nrow(Boston[Boston$rm > 8, ])
