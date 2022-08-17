##### Quiz2 #####
### Textbook 
### http://bigdata.dongguk.ac.kr/lectures/R/_book/%ED%80%B4%EC%A6%882.html


# ex1
library(readxl)
smoker = read_excel("C:/Users/sunjung/OneDrive - KLA Corporation/Documents/R/smoke.xlsx", sheet=1)

# ex2
nrow(smoker)
dim(smoker)

# ex3
head(smoker,10)

# ex4
Female_n = nrow(subset(smoker, Gender=="F"))
Male_n = nrow(subset(smoker, Gender=="M"))

# ex5
num_of_smoker = nrow(subset(smoker, Smoker=="yes"))
smoker_ratio = num_of_smoker / nrow(smoker)

# ex6
num_of_smoker_Female = nrow(subset(smoker, Smoker=="yes" & Gender=="F"))
num_of_smoker_Male = nrow(subset(smoker, Smoker=="yes" & Gender=="M"))

smoker_ratio_Female = num_of_smoker_Female / Female_n
smoker_ratio_Male = num_of_smoker_Male / Male_n

# ex7 (The way adding new column is the same with that of Pyhton)
smoker["BMI"] = smoker["Weight"] / (smoker["Height"]*0.01)**2

# ex8
aggregate(BMI~Gender, smoker, mean) # mean of BMI by Gender
aggregate(BMI~Gender, smoker, sd) # STD of BMI by Gender

# ex9
boxplot(BMI~Gender, data=smoker, ylab="BMI", xlab="Gender")

# ex10
aggregate(BMI~Smoker, smoker, mean) # mean of BMI by Smoker
aggregate(BMI~Smoker, smoker, sd) # STD of BMI by Smoker

# ex11
boxplot(BMI~Smoker, data=smoker, ylab="BMI", xlab="Gender")
