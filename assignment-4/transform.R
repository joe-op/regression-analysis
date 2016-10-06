anvp <- function(y,x) {
    return(anova(lm(y~x))$Pr[1])
}

transform <- function(y,x) {
    print("Running transformations for y, x")

    name <- c("x^2","sqrt(x)","1/x","log(x,10)","y^2","sqrt(y)","1/y","log(y,10)")
    p <- vector(mode="numeric", length=8)

    p[1] <- anvp(y,x^2)
    p[2] <- anvp(y,sqrt(x))
    p[3] <- anvp(y,1/x)
    p[4] <- anvp(y,log(x,10))
    p[5] <- anvp(y^2,x)
    p[6] <- anvp(sqrt(y),x)
    p[7] <- anvp(1/y,x)
    p[8] <- anvp(log(y,10),x)
     

    result <- data.frame(name, p, stringsAsFactors=F)
    return(result)
}
