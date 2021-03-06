plastic <- read.csv("plastic.csv")
plastic.xmean <- mean(plastic$x)
plastic.ymean <- mean(plastic$y)
plastic.xdiff <- plastic$x - plastic.xmean
plastic.ydiff <- plastic$y - plastic.ymean
plastic.Sxy <- sum(plastic.xdiff * plastic.ydiff)
plastic.Sxx <- sum(plastic.xdiff^2)
plastic.Syy <- sum(plastic.ydiff^2)
plastic.b1 <- plastic.Sxy/plastic.Sxx
plastic.b0 <- plastic.ymean - plastic.b1*plastic.xmean
# store regression line as a function
plastic.rl <- function(x) {
  plastic.b0 + plastic.b1 * x;
}
plot(plastic)
curve(plastic.rl, from=16, to=40, add=T)
# estimate mean(?) hardness at X=40
plastic.rl(40);  # 249.975
# estimate change in mean hardness when X increases by 1
# the change =~ b1 = 2.034375
# find value of residuals for 10th case
plastic.xresid <- plastic$x - seq(16, 40, length=16)
plastic.yresid <- plastic$y - plastic.rl(
  seq(16, 40, length=16)
)
plastic.xresid[[10]] # 1.6
plastic.yresid[[10]] # 3.555
# estimate variance
plastic.ss <- sum(plastic.ydiff^2)/15 # 363
