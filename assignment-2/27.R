muscle <- read.csv("27.csv", header=T)
head(muscle)

x <- muscle$age
y <- muscle$muscle

reg <- lm(y ~ x)

summary(reg)
### the F-statistic p-value is low, so we can use the line
### the p-values for b0 and b1 are also low, so they should exist

plot(x, y)
abline(reg)
# the line appears to be a good fit

### store image
png('scatter.png')
plot(x, y)
abline(reg)
dev.off()

### estimate difference in mean muscle mass for women differing in age by one year
### the difference =~ b1 = -1.19

### estimate mean muscle mass for women aged 60 years
predict(reg, data.frame(x=60)) # 84.95

### find value of 8th residual
resid <- residuals(reg)
resid[[8]] # 4.44

### find estimate of sigma squared
### not this mean(summary(reg)$residuals^2) # 64.57
summary(reg)$sigma^2 # 66.80

