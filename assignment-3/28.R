## a,b

muscle <- read.csv("muscle.csv", header=T)
x <- muscle$age; y <- muscle$mass
reg <- lm(y~x)

## 95% Confidence Interval
## (82.83, 87.06)
## 95% sure that the average muscle mass for women age 60
## is between 82.83 and 87.06
predict(reg, data.frame(x=60), se.fit=T, interval="confidence", level=0.95)

## 95% Prediction Interval
## (68.45, 101.44)
## 95% sure that a random woman age 60 will have a muscle mass
## between 68.45 and 101.44
## This is not very precise.  The range of the data is (52, 119),
## so this is almost the entire range.
predict(reg, data.frame(x=60), se.fit=T, interval="prediction", level=0.95)
