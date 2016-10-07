library(lmtest)

copier <- read.csv("copier.csv")

y <- copier$min
x1 <- copier$copiers
x2 <- copier$age
x3 <- copier$exp

anova(lm(y~x1))
anova(lm(y~x2))
anova(lm(y~x3))

## x1: minutes
reg1 <- lm(y~x1)

png("2-scatter-1.png")
plot(x1, y)
abline(reg1)
dev.off()



e <- residuals(reg1)
png("2-resid-1.png")
plot(x1, e)
dev.off()
png("2-qq-1.png")
qqnorm(e)
qqline(e)
dev.off()

anova(reg1)

## x2: age of the copiers

png("2-scatter-2.png")
plot(x2, y, main="Scatter Plot", ylab="Minutes", xlab="Mean Age (Years)")
abline(lm(y~x2))
dev.off()

anova(lm(y~x2)) ## p-value fails

transform(y,x2) ## file transform.R; y=log(y,10) succeeds

y1 <- log(y, 10)

reg2 <- lm(y1~x2)

png("2-scatter-2-transform.png")
plot(x2,y1, ylab="Log Base 10 of Minutes", xlab="Mean Age (Years)", main="Scatter Plot for log(y) Transformation")
abline(reg2)
dev.off()

e <- residuals(reg2)

png("2-resid-2-transform.png")
plot(x2,e, main="Residuals for log(y) Transformation")
dev.off()

png("2-qq-2-transform.png")
qqnorm(e, main="Q-Q Plot for log(y) Transformation")
qqline(e)
dev.off()


bptest(reg2)

summary(reg2)

confint(reg2)

