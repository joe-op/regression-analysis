airfreight <- read.csv("airfreight.csv", header=F)

x <- airfreight$V1; y <- airfreight$V2

reg <- lm(y~x)

anova(reg)

## The p-value is 2.7e-05, which is less than 0.05,
## so we can reject the null hypothesis (that beta-1=0)
## and conclude that there is some linear association
## between transfers and broken ampules

summary(reg)
## R-squared=0.9009
## r = +sqrt(R-squared) = 0.9492
## 90% of Y's variation is "explained" by X

