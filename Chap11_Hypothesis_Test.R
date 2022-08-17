##### Chapter 11. Hypothesis Test
### Textbook 
### http://bigdata.dongguk.ac.kr/lectures/R/_book/%EA%B0%80%EC%84%A4%EA%B2%80%EC%A0%95.html




### 11.1 One sample t-test

# H0 : mean = mu_0 
# H1 : mean > mu_0 or mean!= mu_0
# T-test. df is 10-1=9
# T = (X - mu_0) / ( S/sqrt(n) ) 
# where X : mean of sample , S : STD of sample , n : # of sample , mu_0 : mean of population

x = sleep[sleep$group==1, c(3,1)]  # or, subset(sleep, group==1)[c(3,1)]
o <- t.test(x = x$extra, alternative="greater")




### 11.2 Two samples t-test

# H0 : mu_0 = mu_1
# H1 : mu_0 < mu_1 or mu_0 != mu_1

A <- sleep[1:10, 1] # A group
B <- sleep[11:20, 1] # B group
x <- data.frame(n=1:10, A, B)

t.test(x=x$A, y=x$B, paired=F, alternative="less", var.equal=FALSE) # var.equal=FALSE means that two group's var values are different
t.test(x=x$A, y=x$B, paired=F, alternative="less", var.equal=TRUE) # var.equal=TRUE means that two group's var values are the same





### 11.3 
var.test(A,B)
