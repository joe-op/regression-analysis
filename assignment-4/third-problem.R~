library(lawstat)

production <- read.csv("production.csv")

y <- production$hours
x <- production$size

plot(x,y)

reg <- lm(y~x)

e <- residuals(reg)
plot(x,e)

qqnorm(e)
qqline(e)

levene.test(y, x, location="mean") # cannot get any transformation to work

