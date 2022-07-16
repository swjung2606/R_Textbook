##### Chapter 2 : Object #####
##### Textbook : http://bigdata.dongguk.ac.kr/lectures/R/_book/%EA%B0%9D%EC%B2%B4.html



### Data type
typeof(10L)  # interger
typeof(10)  # double
typeof("Hello World")  # character
typeof(2 < 4)  # logical


### Vector
x1 <- c(1,2,3,4)  # 1 2 3 4
x3 <- c("a", "b", "c") 
x2 <- 10:15  # 10 11 12 13 14 15
y <- c(x1,0,x2)  # 1 2 3 4 0 10 11 12 13 14 15

# Generate vector with function
a <- rep(2,5) # 2 2 2 2 2
b <- rep(c(1,2), each=3)  # 1 1 1 2 2 2
c <- seq(0,10,length=11) # generate 11 numbers with equal step size. 0 1 2 ... 10
d <- seq(1,9, by=2) # 1 3 5 7 9

# Access to component
a_1 <- c(1,3,5,7,9)
a_1[3] # 5
a_1[5] # 9



### Matrix
A <- matrix(c(2,12,5,6,3,31,13,35,5,5,7,72), ncol=3) # generate the matrix that's # of column is 3
A[1,2] # 3
A[3,2] # 13


X1 <- matrix(1:10, nrow=2, ncol=5) # X1 is (2x5) matrix

# diagonal matrix
X2 <- diag(1,5)
X3 <- diag(c(1,3,2,4))

# extract elements of diagonal
diag(X2) # 1 1 1 1 1
diag(X3) # 1 3 2 4


# combine vector and matrix

# column oriented combine
x4 <- c(1,2,3)
y4 <- c(4,5,6)
X4 <- cbind(x4,y4)
X5 <- rbind(x4,y4)

# Vector computation (Dot product)
xv <- c(1,4,2,3)
yv <- c(-1,1,-2,1)
xv %*% yv # dot product of xv and yv

# Matrix computation
x <- matrix(c(1:6), ncol=3)
y <- matrix(c(1,-1,2,3,2,-1), ncol=3)
x*y # do multiplication elementwise

# Matrix * vector
A <- matrix(c(1,2,4,5,6,3,2,4,1,9), ncol=2)
v <- c(1,-1)
A %*% v  # it returns (5x1) vector

# Transpose matrix
t(x) # transpose matrix of x

# Matrix product
z <- t(x) %*% y

m1 <- diag(c(1,-3,5))
m2 <- matrix(seq(1,9,length=9), ncol=3)
res <- m1 %*% m2


# Find inverse matrix
A <- matrix(c(1,2,3,3,0,1,5,4,2), ncol=3)
inv_A <- solve(A) # inverse matrix of A



### List
Lst <- list(name="fred", wife="mary", child.ages=c(4,7,9))
# access to element in list
Lst[[1]]  # "fred"
Lst[["name"]]  # "fred"

# sublist
Lst[2:3]

# # of component
length(Lst)

# List combine
list1 <- list(a1=1, b1=1:3)
list2 <- list(a2=c('Kim', 'Park'))
c(list1, list2)



### Data Frame
name <- c("Jung", "Lee", "Park", "Oh")
gender <- c("M", "F", "M", "F")
income <- c(65000, 51000, 57000, 32000)
# Generate data frame
d1 <- data.frame(name=name, gender=gender, income=income)

head(d1,2) # show the first two rows
names(d1) # show columns vector
names(d1)[3] # "income"

nrow(d1) # number of rows in data frame
ncol(d1) # number of columns in data frame

# Conditional commends (it's like df.loc in python)
subset(d1, gender=="M") # it only shows gender = "M"
subset(d1, income > 60000) # it only shows income is greater than 60000

# example of data frame of iris
head(iris,3)
subset(iris, Sepal.Length > 7.3) # it only show the rows that Sepal.Length is greater than 7.3
subset(iris, Sepal.Length > 7.3 & Sepal.Width >2.7) # setting two conditions is also possible



### Condition setting in vector (ex5)
x <- seq(1,30, by = 4)

# cond1 = x is not null  &  cond2 = x < 18
x1 <- x[ !is.na(x) & x<18]
x2 <- (x+2)[ !is.na(x) & x<18] # add 2 to all elements that satisfy the conditions



### NA value control (ex7)
x <- c(34,56,55,87,NA,4,77,NA,21,NA,39)
is.na(x)  # it returns logical type
!is.na(x)

x[1] + x[5]  # it's just NA. NA is not considered as 0, but it can't be computable.
sum(is.na(x)) # show # of NA


### Naming columns and rows in matrix (ex15)
N <- matrix(c(1:9), nrow=3, ncol=3, dimnames=list(c('a','b','c'), c('A','B','C')))


### Generate matrix row oriented (ex16)
M <- matrix(c(1:9),3,3,byrow=T)

