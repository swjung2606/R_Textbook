##### Chapter 9. Technical Statistics #####
### Textbook
### http://bigdata.dongguk.ac.kr/lectures/R/_book/%EA%B8%B0%EC%88%A0%ED%86%B5%EA%B3%84.html




### 9.1
x <- c(
  64, 84, 82, 81, 68, 85, 76, 89, 93,
  77, 66, 64, 86, 74, 64, 70, 53, 98, 
  59, 79, 57, 59, 65, 67, 80)

# 9.1.1
median(x)
quantile(x) # shows typical quantile values in x
quantile(x, probs=c(0.05,0.95))

range(x)
IQR(x) 
var(x)


# 9.1.2
stem(x)




### 9.2 count based summary
library(MASS)
table(survey$Sex)
table(survey$Exer)
table(survey$Smoke)

table(Sex=survey$Sex, Smoke=survey$Smoke)
