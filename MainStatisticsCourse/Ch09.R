# Binomial distribution ------

dbinom(x = 4, size = 20, prob = 1/6) # probability of exactly 4 skulls

# let's do a graph of probabilities
Probability <- numeric(21) # predefine array
for (i in 0:20) {
  Probability[i+1] <- dbinom(i,20,1/6) #`[i+1]` as i starts from 0
}
Skulls <- 0:20
plot(Skulls, Probability, type = "h", lwd = 4, col = "blue", bty = "n")

# let's single out our value
bars <- c(rep("black",4),"blue",rep("black",16))
plot(Skulls, Probability, type = "h", lwd = 4, col = bars, bty = "n")

# now without the `for` loop
plot(0:20, dbinom(0:20, 20, 1/6), type ="h", lwd=4, col=bars, bty="n",
     xlab = "Number of skulls observed", ylab="Probability")

# simulate dice throws with `rbinom`
rbinom(n = 100, size = 20, prob = 1/6)

# let's simulate actual dice throws of 100, 1000, and 10000
plot(table(rbinom(100, 20, 1/6)), xlim=c(0,20), lwd = 4) # simulation 100
plot(table(rbinom(1000, 20, 1/6)), xlim=c(0,20), lwd = 4) # simulation 1000
plot(table(rbinom(10000, 20, 1/6)), xlim=c(0,20), lwd = 4) # simulation 10,000

# coin tosses
windows(10, 14)
par(mfrow=c(2,1))
plot(0:20, dbinom(0:20, 20, 1/2), type ="h", lwd=4, col="blue", bty="n",
     xlab = "Number of heads observed", ylab="Probability")
plot(0:100, dbinom(0:100, 100, 1/2), type ="h", lwd=4, col="blue", bty="n",
     xlab = "Number of heads observed", ylab="Probability")

# Distribution functions: d, p, q, r --------

# Probability of four or fewer skulls (q - quantile)
pbinom(q=4, size=20, prob=1/6)

# reverse: calculate the 0.75 quantile (75th percentile)
qbinom(p=0.75, size=20, prob=1/6) # rounded up to full number for a discrete distrib.

# simulate dice throws - already familiar
rbinom(n = 100, size = 20, prob = 1/6)

# Normal distribution --------

curve(dnorm, -3, 3, col="blue", lwd = 3, xlab="Observed Value", ylab="Probability Density")
curve(dnorm(x,mean=0,sd=2), -3, 3, col="blue", lwd = 3, lty=2, add=T)


# Shading  -----

# Define shading function
shade <- function(from, to, density, ..., col="blue", dens=NULL){
  y_seq <- seq(from, to, length.out=500)
  d <- c(0, density(y_seq, ...), 0)
  polygon(c(from, y_seq, to), d, col=col, density=dens)
}

# now shade these areas
curve(dnorm(x), -4, 4, bty="n", lwd=2, col="blue", main="Shaded Area = 95.4%")
shade(from=-2, to=2, dnorm, dens=20)

curve(dnorm(x), -4, 4, bty="n", lwd=2, col="blue", main="Red Area = 2.5% + 2.5%")
shade(from=-4, to=qnorm(0.025), dnorm, col="red")
shade(from=qnorm(0.975), to=4, dnorm, col="red")

# The t distribution ---------

curve(dnorm(x), -4, 4, ylab="density", lty=2, main="t (df=3) versus normal distribution")
curve(dt(x, df=3), lwd=2, col="blue", add=T)

# The chi-square distribution ---------

curve(dchisq(x, df=3), 0, 10, lwd=3, col="blue", ylab="density", main="chi-square distribution (df=3)")

# The F distribution ---------

curve(df(x, df1=3, df2=5), 0, 10, lwd=3, col="blue", ylab="density", main="F(3,5) distribution")

# Compare distributions ------

normal.a <- rnorm(1000) # normal; defaults: mean=0, sd=1
hist(normal.a, breaks=40, freq=F, col="blue", yaxt="n", ylab=NULL, main="Simulated Normal Data")
curve(dnorm(x), -4, 4, lwd=3, col="red", add=T)

normal.b <- rnorm(1000) # another normal set
normal.c <- rnorm(1000) # yet another normal set (for chi2 df = 3)

chi.sq.3 <- (normal.a)^2 + (normal.b)^2 + (normal.c)^2

hist(chi.sq.3, breaks=40, freq=F, col="blue", yaxt="n", ylab=NULL, main="Simulated Chi Sq Data")
curve(dchisq(x, df=3), 0, 20, lwd=3, col="red", add=T)

# now simulate a t distribution, dividing a normal by the root of a chi-sq/df=3
normal.d <- rnorm(1000) # another normal set
t.3 <- normal.d/sqrt(chi.sq.3/3)

hist(t.3, breaks=40, freq=F, col="blue", yaxt="n", ylab=NULL, main="Simulated t Data")
curve(dt(x,3), -10, 10, lwd=3, col="red", add=T)

# simulate an F distribution by dividing two scaled (/df) chi-sq distributions

chi.sq.20 <- rchisq(1000,20) # generate chi square data
F.3.20 <- (chi.sq.3/3) / (chi.sq.20/20) #  ratio of two scaled chi squares
hist(F.3.20, breaks=40, freq=F, col="blue", yaxt="n", ylab=NULL, main="Simulated F Data")
curve(df(x,3,20), 0, 7, lwd=3, col="red", add=T)
