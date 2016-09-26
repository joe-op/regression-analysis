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




plot(reg)  ## first plot is residuals vs. fitted; check for constant variance (scattered around 0 line)

yhat <- fitted(reg) ## can get first plot without plot(reg), using e below

e <- residuals(reg)
plot(x, e) ## scattered around 0 line -> constant variance

## look for outliers
## b$out == 0 indicates no outliers
b <- boxplot(e, horizontal=T)

## can use instead of QQ Norm in plot(reg)
qqnorm(e); qqline(e)

