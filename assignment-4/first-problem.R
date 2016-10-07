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
e <- residuals(reg1)

png("1-scatter-1.png")
plot(x1, y, ylab="GPA", xlab="ACT Score", main="Scatter Plot")
abline(reg1)
dev.off()


png("1-resid-1.png")
plot(x1, e, main="Residuals")
dev.off()

png("1-qq-1.png")
qqnorm(e)
qqline(e)
dev.off()

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

bptest(reg2)

## class rank
reg3 <- lm(y~x3)
e <- residuals(reg3)

## get plots
png("1-scatter-3.png")
plot(x3, y, main="Scatter Plot", xlab="Class Rank", ylab="GPA")
abline(reg3)
dev.off()

png("1-resid-3.png")
plot(x3, e, main="Residuals")
dev.off()

png("1-qq-3.png")
qqnorm(e, main="Q-Q Plot")
qqline(e)
dev.off()


anova(reg3)
summary(reg3)



bptest(reg3) ## fails
## transform function shows that y^2 works

reg3 <- lm(y^2~x3)
e <- residuals(reg3)

## get plots
png("1-scatter-3-2.png")
plot(x3, y^2, xlab="Class Rank", ylab="Square of GPA", main="Scatter Plot for y-squared Transformation")
abline(reg3)
dev.off()

png("1-resid-3-2.png")
plot(x3, e, main="Residuals for y-squared Transformation")
dev.off()

png("1-qq-3-2.png")
qqnorm(e, main="Q-Q Plot for y-squared Transformation")
qqline(e)
dev.off()

anova(reg3)

summary(reg3)

confint(reg3)
