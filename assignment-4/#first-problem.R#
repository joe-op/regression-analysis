gpax <- read.csv("gpax.csv", header=T)

y <- gpax$gpa
x1 <- gpax$act
x2 <- gpax$int
x3 <- gpax$rank

## Plot and transform until X is right
## Residual plot and transform until Y is right
## Q-Q Plot?

## Levene's Test (assumption about constant variance)
## ANOVA Table (state hypothesis)
## Regression Table (state beta0 & beta1 hypotheses)

## Explain meaning of b0 & b1
## Find a cofidence interval for beta0 & beta1

## x1

reg1 <- lm(y~x1)

plot(x1, y)
abline(reg1)

e <- residuals(reg1)
plot(x1, e)
## try levene's test
library(lawstat)
levene.test(y, x1, location="mean") # p-value < 0.05; reject H0
## Assume error variance is not constant; need Y transformation
## y squared works as a transformation
y1 <- y^2

## start over with transformed y
plot(x1, y1)
reg1 <- lm(y1~x1)
e <- residuals(reg1)
plot(x1, e)

qqnorm(e)
qqline(e)
## tests look good

## levene's test
levene.test(y1, x1, location="mean") # p-value > 0.05; good

anova(reg1) # p-value < 0.05; good
## reject H0 (that b0=b1=0)

summary(reg1)

## explain, confidence interval


then move on to x2 & x3

### test regression with intelligence score
## x2 is gpax$int

plot(x2, y) # looks good
reg2 <- lm(y~x2)

e <- residuals(reg2)
plot(x2, e)
levene.test(y, x2, location="mean")
## cannot make any transformation work


qqnorm(e)
qqline(e)

## TODO rest of the tests

### test regression with rank
## x3 is gpax$rank

plot(x3, y)
## looks concentrated
## try transformation x = x^2
plot(x3^2, y) ## better

reg3 <- lm(y~x3^2)

e <- residuals(reg3)
plot(x3^2, e) ## residuals look good

## cannot get transformation to work
## sqrt(y) is a little better but not much
levene.test(y, x3^2, location="mean")

qqnorm(e)
qqline(e) ## left-skewed

## TODO try transformation to improve qq plot


