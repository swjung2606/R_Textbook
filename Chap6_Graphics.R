##### Chapter 6. R Graphics #####
### Textbook
### http://bigdata.dongguk.ac.kr/lectures/R/_book/%EA%B7%B8%EB%9E%98%ED%94%BD%EC%8A%A4.html


### 6.2 plot
x <- rnorm(100, sd=2)
y <- 0.3 + 2*x + rnorm(100,sd=1)
plot(x)

# Animals data loading
library(MASS)
head(Animals)
plot(x=Animals$body, y=Animals$brain, pch=16, col="blue", xlab="Body weight (Kg)", ylab="Brain weight (g)",
     xlim=c(0,250), ylim=c(0,1400))
text(x=Animals$body, y=Animals$brain, labels=row.names(Animals), pos=4)

# Indicate legend
plot(~Sepal.Length+Sepal.Width, data=iris, pch=rep(15:17, each=50), col=c("red","blue","green")[iris$Species], cex=1.5)
legend("topright", legend=levels(iris$Species), pch=15:17, col=c("red","blue","green"), cex=1.2, bty="n")



### 6.3 Barplot
pie.sales <- c(0.12,0.3,0.26,0.16,0.04,0.12)
barplot(pie.sales)
barplot(pie.sales, names.arg = c("Blueberry", "Cherry", "Apple", "Boston Cream", "Other", "Vanilla Cream"), las=2)

names(pie.sales) <- c("Blueberry", "Cherry", "Apple", "Boston Cream", "Other", "Vanilla Cream")
barplot(pie.sales, las=2) # las=2 : x-tick

# options
counts <- table(mtcars$vs, mtcars$gear)
counts

barplot(counts, main="Car Distribution by Gears and VS", xlab="Number of Gears", col=c("darkblue", "red"), 
        legend=rownames(counts), horiz=T, angle=45)
barplot(counts, main="Car Distribution by Gears and VS", xlab="Number of Gears", col=c("darkblue", "red"), 
        legend=rownames(counts), angle=45)



### 6.4 Pie plot
pie(pie.sales)



### 6.5 dot chart
head(mtcars)
dotchart(mtcars$mpg, labels=row.names(mtcars), cex=0.7, main="Gas Milage \nfor Car Models", xlab="Miles per Gallon")

idx <- order(mtcars$mpg) # it shows the index by ordering from low to high for mpg
dotchart(mtcars$mpg[idx] , labels=row.names(mtcars), cex=0.7, main="Gas Milage \nfor Car Models", xlab="Miles per Gallon" )



### 6.6 usage of par() function
x <- rnorm(100, mean=170, sd=8)
#par(mfrow=c(1,2)) # mfrow : showing several graphs in one screen
hist(x)
plot(x)



### 6.7 Histogram
hist(cars$speed, nclass=8, main="Histogram", xlab="speed")



### 6.8 Boxplot
boxplot(Sepal.Length~Species, data=iris, main="Box plot")


### 6.9 scatter plot
plot(cars)

# add line on the scatter plot
plot(Petal.Length ~ Sepal.Length, data=iris, bty="l", pch=20)
abline(a=0, b=1, lty=2, lwd=2) # y = a +bx. Thus, just draw y=x graph.
abline(lm(Petal.Length~Sepal.Length, data=iris), lty=1, lwd=5) # lty : line type, lwd : line thickness

# draw multiple scatter plot
pairs(iris[,1:4], main = "Fisher's Iris Data", pch=21, bg=c("red","green3","blue")[unclass(iris$Species)])




### 6.11 3D graph
library(scatterplot3d)
head(trees)
scatterplot3d(trees, type="h", highlight.3d = TRUE, angle=55, scale.y=0.7, pch=16, main="3D plot for trees data")


### 6.12 3D pie chart
slices <- c(18,12,4,16,8,9,12)
lbels <- c("US", "UK", "Australia", "Germany", "Canada", "India", "Korea")
library(plotrix)
pie3D(slices, labels=lbels, explode=0.1, main="3D Pie Chart", mar=c(4,0,3,0))


### 6.13 contour graph
x <- 1:50 ; y <- 1:70
z <- matrix(expand.grid(x,y)$Var1^2 + expand.grid(x,y)$Var2^2, nrow=50, ncol=70) # expand.grid(x,y) : generate grid for x and y
contour(x,y,z)

# filled.contour
filled.contour(volcano, color.palette = terrain.colors, asp=1)
title(main="volcano data: filled contour map")


### 6.14 perspective plot
x <- seq(-10,10, length=30) ; y <- x
f <- function(x,y) { r<-sqrt(x**2 + y**2); 10*sin(r)/r}
z <- outer(x,y,f)
z[is.na(z)] <- 1
op <- par(bg="white")
persp(x,y,z, theta=30, phi=30, expand=0.5, col="lightblue")





### 6.18 ggplot2
library(ggplot2)

# 6.18.3 qplot basic graph
qplot(Sepal.Length, Sepal.Width, data=iris)

# 6.18.4 geom_point()
ggplot(iris, aes(Sepal.Length, Sepal.Width)) + geom_point()

sp <- as.integer(iris$Species) # it changes each group name to 1,2,3,... so on.
ggplot(iris, aes(Sepal.Length, Sepal.Width, label=sp, color=sp+1)) + geom_text()

# Histogram
ggplot(mtcars, aes(x=disp)) + geom_histogram(fill="blue", alpha=0.2)

# geom_density function
ggplot(mtcars, aes(x=disp)) + geom_density(fill="blue", alpha=0.2)

# geom_smooth()
p <- ggplot(mtcars, aes(disp,wt))
p + geom_smooth()

# geom_boxplot()
ggplot(diamonds, aes(cut, price)) + geom_boxplot()
