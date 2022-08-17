##### Chapter 10. Statistical Inferences #####
### Textbook
### http://bigdata.dongguk.ac.kr/lectures/R/_book/%EC%B6%94%EC%A0%95.html


x <- sleep[1:10, c(3,1)]
head(x)

library(Rmisc) # for CI computation

# Extract only two columns (lower, upper) from CI(x[,2], ci=0.95) table 
c1 <- CI(x[,2], ci=0.95)[c(3,1)]
c2 <- CI(x[,2], ci=0.99)[c(3,1)]
o <- rbind(c1,c2)
row.names(o) <- NULL

# We can add dataframe o like this way
o <- data.frame( Level = c(0.95,0.99),o, mean=c(mean(x[,2]), NA), sd=c(sd(x[,2]), NA))




## Correlation
head(longley)
cov(longley$GNP, longley$Employed) # covariance of two columns (GNP, Employed)
cor(longley$GNP, longley$Employed) # correlation of two columns
cor.test(longley$GNP, longley$Employed) # detail information of correlation


# Correlation Plot
library(corrplot)
corrplot(cor(mtcars))