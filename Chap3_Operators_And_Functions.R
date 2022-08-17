##### Chapter 3 : Operator and internal functions #####

# remainder arithmetic
x <- c(1,10,13,3)
x %% 2

# inequality arithmetic
x<3
y = c(3,5,2,1)
x < y # inequality vector vs vector

# AND
x1 = c(T,T,F,F)
y1 = c(F,F,T,F)
x1 & y1

# OR
x1 | y1



### Internal Functions
a <- 1:5
b = c(5,4,3,2,1)
sqrt(a)
exp(a)

# elementwise computation
a/b

# numerator : vector, demominator : real
(a + sqrt(a))/(exp(2)+1)

# elementwise min/max
a = c(1,-2,3,-4)
b = c(-1,2,-3,4)
pmin(a,b)
pmax(a,b)



### Normal Distribution
x = seq(-3,3,length=30)
y = dnorm(x, mean=0, sd=1)
plot(x,y, type='l', main="N(0,1)", ylab="f(x)")

# This shows only left tail because of x = [-3,3]
y1 = dnorm(x, mean=50, sd=10)
plot(x,y,type='l', main="N(50,100)", ylab="f(x)")

# p-value
pnorm(1.96)



### Random Number Generator
rnorm(10, mean=0, sd=1) # generate 10 numbers that follows N(0,1)

# Binomial Probability
dbinom(3, size=6, prob=0.4)  # 6C3 * (0.4)**3 * (0.6)**3
dbinom(2, size=6, prob=0.4) + dbinom(1, size=6, prob=0.4) + dbinom(0, size=6, prob=0.4)

# If X follows N(20,16), 
pnorm(24, mean=20, sd=4) # P(X<24)
pnorm(15, mean=20, sd=4) - pnorm(12, mean=20, sd=4) # P(12<X<15)




### Other Internal Functions
a = c(5,3,6,2,4)

# print string and arithmetic result simultaneously
cat("mean of a is ", mean(a), "variance of a is ", var(a), "\n")

# unique function
x = c(1,5,1,3,5,7,5)
unique(x)
