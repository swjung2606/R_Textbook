##### Practical Example of dataframe #####


### Part 1 handling dataframe

library(MASS) # load cats dataframe

dim(cats) # show the dimension of the dataframe
cats$Bwt # vector form of Bwt column values

# Average and STD of columns
mean(cats$Bwt) # mean of Bwt column
sd(cats$Bwt) # std of Bwt column


# Average and STD of columns with condition (ex4)
mean(subset(cats, Sex=="F")$Hwt) # mean of Hwt column for Sex=="F"
sd(subset(cats, Sex=="M")$Bwt) # STD of Bwt column for Sex=="M"


# This is another way (ex4)
aggregate(Bwt~Sex, cats, mean) # mean of Bwt for M and F respectively
aggregate(Bwt~Sex, cats, sd) # STD of Bwt for M and F respectively

aggregate(Hwt~Bwt, cats, mean) # mean of Hwt for each Bwt value.


# Draw Boxplot of Bwt with respect to Sex(ex5)
boxplot(Bwt~Sex, cats, ylab="Weight of Mouse")

# scatter plot of Bwt and Hwt (ex7)
plot(cats$Bwt, cats$Hwt, xlab="Weight of Body(Kg)", ylab="Weight of Heart(g)", 
     col=c("red","blue")[cats$Sex], pch=20)
legend("topleft", legend = c("Female", "Male"), col=c("red","blue"), pch=20)

# add line equation Hwt = -0.36 + 4*Bwt
abline(a=-0.36, b=4, lty=2)





### Part 2, Matrix & vector computation

X = matrix(c(1,1,1,1,3,2,2,1) , ncol=2)
y = c(3,3,2,1)

# Transpose of X
t(X)

# X^T * X
t(X) %*% X

# Inverse matrix of (X^T * X)
solve( t(X) %*% X )

# (X°T * X)^(-1) * (X^T * y)
solve( t(X) %*% X ) %*% (t(X) %*% y)




### Part 3 Handling function

# ex1
f1 <- function(x) {
  1 -2*x - 4*x**2 + x**3
}

x = seq(-10,10, length=50)
plot(x,f1(x), type='l')
abline(h=0, lty=3, col="red")


# ex2

list_info <- function(v) {
  length = length(a)
  sum = sum(a)
  mean = mean(a)
  
  list(Length=length, Sum=sum, Mean=mean)
}

list_info(c(1,2,3,4,5))