anvp <- function(y,x) {
    return(round(anova(lm(y~x))$Pr[1], 4))
}
sr <- function(y,x) {
    return(round(summary(lm(y~x))$r.squared, 4))
}

transform <- function(y,x) {
    print("Running transformations for y, x")

    name <- c("x^2","sqrt(x)","1/x","log(x,10)","y^2","sqrt(y)","1/y","log(y,10)")
    p <- vector(mode="numeric", length=8)
    r2 <- vector(mode="numeric", length=8)

    p[1] <- anvp(y,x^2)
    p[2] <- anvp(y,sqrt(x))
    p[3] <- anvp(y,1/x)
    p[4] <- anvp(y,log(x,10))
    p[5] <- anvp(y^2,x)
    p[6] <- anvp(sqrt(y),x)
    p[7] <- anvp(1/y,x)
    p[8] <- anvp(log(y,10),x)

    r2[1] <- sr(y,x^2)
    r2[2] <- sr(y,sqrt(x))
    r2[3] <- sr(y,1/x)
    r2[4] <- sr(y,log(x,10))
    r2[5] <- sr(y^2,x)
    r2[6] <- sr(sqrt(y),x)
    r2[7] <- sr(1/y,x)
    r2[8] <- sr(log(y,10),x)
     
    result <- data.frame(name, p, r2, stringsAsFactors=F)
    return(result)
}
