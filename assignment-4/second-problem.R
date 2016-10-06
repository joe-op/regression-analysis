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

