tlc <- read.csv("tlc.csv", header=T)
x <- tlc$lot; y <- tlc$hours

reg <- lm(y~x)
sm <- summary(reg)

### estimated variance
sm$sigma^2

### p-value for H0: Beta 1 = 4
2*pt(1.228571, 23, lower.tail=F)

### p-value for H0: Beta 1 <= 4
pt(-1.23, 23)

### Confidence interval for Beta 0
confint(reg, level=0.95)
confint(reg, level=0.90)

### Confidence interval for estimate at x=65

new = data.frame(x = 65)
predict(reg, new, se.fit=T, interval="confidence", level=0.9)


### prediction interval
new = data.frame(x = 100)
predict(reg, new, se.fit=T, interval="prediction", level=0.9)

### 90% confidence in the estimate
predict(reg, new, se.fit=T, interval="confidence", level=0.9)
