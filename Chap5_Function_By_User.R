##### Chapter 5. Function By User #####
### Website
### http://bigdata.dongguk.ac.kr/lectures/R/_book/%ED%95%A8%EC%88%98.html



f <- function(x1,x2) {
  y <- x1**2 + x2**2
  return(y)
}

# It shows the same result
f(x1=1, x2=4)
f(1,4)

f(c(1,2), c(3,4)) # c(1,2)** = 1 4 and c(3,4)**2 = 9 16. Thus, it shows 1+9=10 and 4+16=20


### The function that draw a histogram with mean & sd set by user
normal_hist <- function(m,s,n){
  data = rnorm(n, mean=m, sd=s)
  hist(data, main=paste0("N(",m, ",",s^2,")"))
}

# Draw the histogram with defined function above
normal_hist(70,10,300) # mean=10, sd=10, n=300




