# IQ Scores --------

curve(dnorm(x, 100, 15), 50, 150, main="Population distribution of IQ scores", xlab="", lwd=2)

# Generate 100 IQ data
(IQs <- round(rnorm(n = 100, mean = 100, sd = 15))) # generate 100 IQ scores

IQ <- round(rnorm(n = 10000, mean = 100, sd = 15)) # generate 10000 IQ scores
head(IQ, 80)
tail(IQ, 40)

hist(IQs, breaks=seq(20,180,5), col="purple", xlim=c(60,140), main="100 IQ Scores")
hist(IQ, breaks=seq(20,180,5), col="purple", xlim=c(60,140), main="10,000 IQ Score")

mean(IQs); sd(IQs)
mean(IQ); sd(IQ) # should be closer to 100 and 15 than the above

# Now a small sample of 5
IQ.1 <- round(rnorm(n=5, mean=100, sd=15))
IQ.1; mean(IQ.1)


# Sample of a thousand IQ scores
m <- numeric(1000); top <- numeric(1000)
for(i in 1:1000) {
  my.sample <- round(rnorm(n=1, mean=100, sd=15))
  m[i] <- my.sample
}
mean(m); sd(m)
h1 <- hist(m, breaks=seq(20,180,5), col="purple", freq = FALSE, xlab="", main="Sample of 1")
curve(dnorm(x, 100, 15), 20, 180, lwd=2, add=T)

# Sample mean of a thousand samples of 5 IQ scores
for(i in 1:1000) {
  my.sample <- round(rnorm(n=5, mean=100, sd=15))
  m[i] <- mean(my.sample)
  top[i] <- max(my.sample)
}
mean(m); sd(m)
h5 <- hist(m, breaks=seq(20,180,5), col="purple", freq = FALSE, xlab="", main="Sample of 5")
curve(dnorm(x, 100, 15), 20, 180, lwd=2, add=T)

# Sampling distribution of the top IQ out of five
h5.t <- hist(top, breaks=seq(20,180,5), col="purple", freq = FALSE, xlab="", main="Top score of 5")
curve(dnorm(x, 100, 15), 20, 180, lwd=2, add=T)

plot(h5, col="pink", xlab="", main="Sample of 1 and 5 compared")
lines(h1, density=30, col="green")

# Central Limit Theorem simulation -----

r <- 10000 # set repetitions
ramp <- seq(0.02,1,0.02) # define a "sloping up" sequence
ramp.set <- sample(ramp, r, replace=TRUE, prob=ramp) # sample 10000

op <- par(no.readonly = TRUE) # save original parameters
windows(12,8)
par(mfrow=c(2,2))
hist(ramp.set, breaks=ramp, col="green",xlab="", xlim=c(0,1.2), main="Single values")

m2 <- numeric(r); m4 <- numeric(r); m8 <- numeric(r) # initialize

for(i in 1:r) {
  m2[i] <- mean(sample(ramp.set,2))
}
hist(m2, breaks=ramp, col="green", xlab="", xlim=c(0,1.2), main="Means of 2")

for(i in 1:r) {
  m4[i] <- mean(sample(ramp.set,4))
}
hist(m4, breaks=ramp, col="green", xlab="", xlim=c(0,1.2), main="Means of 4")

for(i in 1:r) {
  m8[i] <- mean(sample(ramp.set,8))
}
hist(m8, breaks=ramp, col="green", xlab="", xlim=c(0,1.2), main="Means of 8")
par(op)

# Sample SD as a biased estimator of population SD ---------

s <- numeric(1000)
sm <- numeric(9)
for (j in 2:10) {
  for (i in 1:1000) {
    s[i] <- sqrt(var(sample(IQ, j)*(j-1)/j))
  }
  sm[j] <- mean(s)
}
sm

plot(sm, type="b", lwd = 2, pch=20, col="blue", ylim=c(0,16),
     xlab="Sample size", ylab="Average Sample St Dev")
abline(h=15, lty=2, lwd=2)

# Confidence intervals -------

qnorm(c(.025, .975)) # 95% CI
qnorm(c(.05, .95)) # 90% CI
qnorm(c(.005, .995)) # 99% CI

# since we don't know the mu, we need to estimate from x-hat, which requires the use of the t-distribution
# When sample is big, it doesn't practically matter:
N <- 10000 # suppose our sample size is 10,000 
qt(.975, df = N-1) # calculate the 97.5th quantile of the t-dist
qt(.975, df = N-1) - qnorm(0.975) # very close to normal

N <- 10 # now our sample size is only 10
qt(p = .975, df = N-1) # calculate the 97.5th quantile of the t-dist
# no longer that close to normal

# Computing Confidence Intervals -------
library(lsr)
load( "../lsr/data/afl24.Rdata" ) # adjust your path as needed
ciMean(afl$attendance)

# Plotting Confidence Intervals -------
# Two packages with useful CI plotting capabilities 
library(sciplot) # bargraph.CI() and lineplot.CI() functions
library(gplots) # plotmeans() function

bargraph.CI(afl$year, afl$attendance, ci.fun=ciMean, xlab="Year", ylab="Attendance")
lineplot.CI(afl$year, afl$attendance, ci.fun=ciMean, xlab="Year", ylab="Attendance")
plotmeans(afl$attendance ~ afl$year, n.label=FALSE, xlab="Year", ylab="Attendance")

# note that the `sciplot` error bars default to +/- 1SE while plotmeans() to 95% CI
lineplot.CI(afl$year, afl$attendance, xlab="Year", ylab="Attendance")