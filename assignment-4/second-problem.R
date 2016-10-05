copier <- read.csv("copier.csv")

y <- copier$min
x1 <- copier$copiers
x2 <- copier$age
x3 <- copier$exp

anova(lm(y~x1))
anova(lm(y~x2))
anova(lm(y~x3))
