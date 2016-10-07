library(lmtest)

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

## Breusch-Pagan test

bptest(reg1)





then move on to x2 & x3

### test regression with intelligence score
## x2 is gpax$int

reg2 <- lm(y~x2)

anova(reg2)
summary(reg2)

png("1-scatter-2.png")
plot(x2,y)
abline(reg2)
dev.off()

e <- residuals(reg2)

png("1-resid-2.png")
plot(x2, e)
dev.off()

png("1-qq-2.png")
qqnorm(e)
qqline(e)
dev.off()

## class rank
reg3 <- lm(y~x3)

anova(reg3)
summary(reg3)

e <- residuals(reg3)
