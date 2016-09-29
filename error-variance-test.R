## Test if there is a correlation

## H0: Error Variance is constant
## Ha: Error Variance NOT constant



tlc <- read.csv("tlc.csv", header=T)

x <- tlc$lot
y <- tlc$hours

## Levene's Test (Book may say Brown-Forsyth)
## package lawstat

library(lawstat)

levene.test(y, x, location="mean")

## 0.3797 > 0.05
## Fail to reject H0; error variance may be constant
