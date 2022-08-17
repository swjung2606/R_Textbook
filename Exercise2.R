##### Exercise2 #####
### Textbook 
### http://bigdata.dongguk.ac.kr/lectures/R/_book/%EC%8B%A4%EC%8A%B5%EB%AC%B8%EC%A0%9C4.html



# ex1
X <- matrix(c(1,1,1,1,2,3,4,4,3,1,2,3,4,4,3,5), nrow=4, ncol=4)
y <- c(2,3,2,5)

solve( t(X) %*% X )  %*%  ( t(X) %*% y )




# ex2
boxplot(Sepal.Length~Species, data=iris, xlab="Species", ylab="Sepal.Length")




# ex3-1
# CI = mean +- (Z_alpha) * Std / sqrt(n)
# where Z_alpha : qt(0.975, df=n-1) , Std : std of sample , n : # of sample
id <- 1:10
height <- 58:67
weight <- c(115,117,120,123,126,129,132,135,139,142)

df <- data.frame(id=id, height=height, weight=weight)

mean_height <- mean(df$height)
mean_weight <- mean(df$weight)
std_height <- sd(df$height)
std_weight <- sd(df$weight)
n <- length(height)

CI_height_lower <- (mean_height) - qt(0.975, df=n-1) * (std_height / sqrt(n))
CI_height_upper <- (mean_height) + qt(0.975, df=n-1) * (std_height / sqrt(n))
CI_weight_lower <- (mean_weight) - qt(0.975, df=n-1) * (std_weight / sqrt(n))
CI_weight_lower <- (mean_weight) + qt(0.975, df=n-1) * (std_weight / sqrt(n))




# ex 3-2
# correlation between two columns
cor.test(df$height, df$weight, method="pearson")




# ex5
a <- 1 - pnorm(2, mean=1, sd=2)
left_tail <- pnorm(-2, mean=1, sd=2)
right_tail <- 1 - pnorm(4, mean=1, sd=2)
b <- left_tail + right_tail

# pnorm(1.645) is almost 0.95. Thus, solving (x-1)/2 = 1.645 lead us to get an solution.
c <- 1.645*2 +1




# ex6
combi <- function(n,r) { factorial(n) / ( factorial(r) * factorial(n-r))}
ans6_1 <- 0
for (i in 10:30) {ans6_1 = ans6_1 + combi(30,i)*(0.3)**i*(0.7)**(30-i)}

ans6_2 <- combi(26,10) / combi(30,10)




# ex8
sample1 <- rnorm(200, mean=2, sd=2)
sample1_mean <- mean(sample1)
delta <- 2 - sample1_mean
