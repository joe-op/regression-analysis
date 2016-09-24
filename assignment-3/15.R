airfreight <- read.csv("airfreight.csv", header=F)

x <- airfreight$V1; y <- airfreight$V2

reg <- lm(y~x)

### Mean breakage confidence intervals for X=2,4
### 99% chance that the true mean number of broken ampules is in this interval
predict(reg, data.frame(x=2), se.fit=T, interval="confidence", level=0.99)
## (15.97, 20.43)

predict(reg, data.frame(x=4), se.fit=T, interval="confidence", level=0.99)
## (21.22, 31.18)

### Predict broken ampules for the next 2-transfer shipment
### 99% chance that the number of broken ampules for the next shipment will be in this interval
predict(reg, data.frame(x=2), se.fit=T, interval="prediction", level=0.99)
## (12.75, 23,65)
