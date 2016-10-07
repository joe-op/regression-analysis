library(lmtest)

production <- read.csv("production.csv")

y <- production$hours
x <- production$size

reg <- lm(y~x)

png("3-scatter-1.png")
plot(x,y)
abline(reg)
dev.off()

e <- residuals(reg)

png("3-resid-1.png")
plot(x,e)
dev.off()

png("3-qq-1.png")
qqnorm(e)
qqline(e)
dev.off()

bptest(reg)

anova(reg)

summary(reg)

confint(reg)


