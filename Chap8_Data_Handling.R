##### Chapter 8. Data Handling #####
### Textbook
### http://bigdata.dongguk.ac.kr/lectures/R/_book/%EB%8D%B0%EC%9D%B4%ED%84%B0%ED%95%B8%EB%93%A4%EB%A7%81.html


### 8.1 vector handling
x <- sample(1:10, 15, rep=T)
others <- (x>1) # exclude 1 from x
x[others] 

x[!others] # it shows FALSe FALSE . . . FALSE because all components of x is greater than 1


### 8.2 data.frame handling
head(USArrests)



## order function
# Showing index of top 5 states with high murder rate
nidx <- order(USArrests$Murder, decreasing = T)[1:5] 
# There are the value of top 5 murder
USArrests$Murder[nidx]
# Table form
USArrests[nidx,]



## quantile function
# quantile(USArrests$Murder, 0.1) : it returns above 10% value. Thus, it's just a scalar value
# It returns TRUE if Murder value is less than quantile(USArrests$Murder, 0.1), otherwise it returns to FALSE
lidx <- (USArrests$Murder < quantile(USArrests$Murder, 0.1))
# Table form
USArrests[lidx,]



### subset function
subset(USArrests, UrbanPop > 85)
# We can choose the columns we want to see under some specific conditions
subset(USArrests, UrbanPop < 40 & Murder < 10, select = c(Assault, Rape)) 



### merge function
authors <- data.frame( surname=c("Tukey", "Venables", "Tierney", "Ripley", "McNeil"), 
                       nationality = c("US", "Australia", "US", "UK", "Austrralia"))
books <- data.frame( name = c("Tukey", "Venables", "Tierney", "Ripley", "Ripley", "McNeil", "R Core"), 
                     title = c("Exploratory Data Analysis",
                               "Modern Applied Statistics ...",
                               "LISP-STAT",
                               "Spatial Statistics", "Stochastic Simulation",
                               "Interactive Data Analysis",
                               "An Introduction to R"))

# Merge two data frame based on "surname" for authors, "name" for books
m1 <- merge(authors, books, by.x = "surname", by.y = "name")



### aggregate function
# compute mean of Sepal.Length by Species in iris data frame
aggregate(Sepal.Length~Species, data = iris, FUN = mean)



### apply function

# it shows each row's average. Vector form 
apply(iris[,1:4], 1, mean)
# it shows each column's average (between column 1 to column 4)
apply(iris[,1:4], 2, mean)



### 8.4.1 data table
library(data.table)
data.table(x=c("b", "b", "a", "a"), v=rnorm(4)) # x,v become columns of this data table

IRIS <- data.table(iris) # Generate IRIS data table from data frame iris
IRIS[, c(1,3,5), with=F] # Show 1,3,5th columns
IRIS[1:3, c(1,2,5)] # Show 1~3 rows with columns 1, 2, and 5.



### 8.4.6 group summary
# Find an average by Species
IRIS[, mean(Petal.Width), by=Species]
# Compute all column's average by Species
IRIS[, lapply(.SD, mean), by=Species]




### example data of NYC Flight records
library(nycflights13)
dim(flights)
# it changes data frame form to tibble form
flights <- as_tibble(flights)



