# The binomial test -----
# 62 correct colour guesses out of 100 cards

plot(0:100, dbinom(0:100, 100, 0.5), type="h", bty="n", col=4, lwd=3, xlab="Number of Correct Responses", ylab="Probability")

# two-tailed alternative hypothesis
qbinom(0.025, 100, 0.5); qbinom(0.975, 100, 0.5) # 2.5% either way

# Plot the 2-sided alternative ---------

my.col <- rep(c(4,8,4), c(41,19,41)) # bar colours vector

plot(0:100, dbinom(0:100, 100, 0.5), type="h", bty="n", lwd=3, 
     xlab="Number of Correct Responses", ylab="Probability",
     col=my.col)
arrows(40,0.03,20,length=0.1)
arrows(20,0.03,40,length=0.1, angle=90)
arrows(60,0.03,80,length=0.1)
arrows(80,0.03,60,length=0.1, angle=90)
text(30,0.04,"lower critical region")
text(70,0.04,"upper critical region")
text(c(30,70),0.035,"(2.5% of the distribution)")

# Now plot the 1-sided alternative ---------

qbinom(0.95, 100, 0.5) # one-tailed alternative hypothesis

plot(0:100, dbinom(0:100, 100, 0.5), type="h", bty="n", lwd=3, 
     xlab="Number of Correct Responses", ylab="Probability",
     col=c(rep(8,58),rep(4,43)))
arrows(58,0.03,82,length=0.1)
arrows(82,0.03,58,length=0.1, angle=90)
text(70,0.04,"critical region")
text(70,0.035,"(5% of the distribution)")

# What if probability = 0.55 ---------

plot(0:100, dbinom(0:100, 100, 0.55), type="h", bty="n", lwd=3, 
     xlab="Number of Correct Responses", ylab="Probability",
     main=expression(paste("Sampling distribution if ", theta, "=0.55")),
     col=my.col)
arrows(40,0.07,20,length=0.1)
arrows(20,0.07,40,length=0.1, angle=90)
arrows(60,0.07,80,length=0.1)
arrows(80,0.07,60,length=0.1, angle=90)
text(30,0.08,"lower critical region")
text(70,0.08,"upper critical region")
text(c(30,70),0.075,"(2.5% of the distribution)")

# What if probability = 0.7 ---------

plot(0:100, dbinom(0:100, 100, 0.7), type="h", bty="n", lwd=3, 
     xlab="Number of Correct Responses", ylab="Probability",
     main=expression(paste("Sampling distribution if ", theta, "=0.7")),
     col=my.col)
arrows(40,0.07,20,length=0.1)
arrows(20,0.07,40,length=0.1, angle=90)
arrows(60,0.07,80,length=0.1)
arrows(80,0.07,60,length=0.1, angle=90)
text(30,0.08,"lower critical region")
text(70,0.08,"upper critical region")
text(c(30,70),0.075,"(2.5% of the distribution)")

# Binomial test power for different true values of theta (probability of guessing the colour of the card) -------
# Don't try to figure out how the power values are calculated: this is a bit beyond what we've learned so far and we will not be explaining it

n <- 100
p <- 0.5
sd <- sqrt((p*(1-p)/n))
lower <- qnorm(0.025, p, sd)
upper <- qnorm(0.975, p, sd)
x <- seq(0, 1, 0.01)
pwr <- pnorm(lower,x,sd) + (1 - pnorm(upper,x,sd))
plot(x, pwr, type = "l", bty="n", col=4, lwd=3, ylim=c(0,1),
     xlab = expression(paste("True value of ",theta)),
     ylab = "Probability of Rejecting the Null",
     main = "Power Function for the Test (N=100)")
points(0.5, 0.05, pch = 19, bg=1, cex=1.5)

# Binomial test ---------

binom.test(x=62, n=100, p=.5)

# Test of proportions: males vs. females ---------
# 33 women out of 50 guessed; 29 men out of 50 did
binom.test(33, 50, 0.5) # females: significant
binom.test(29, 50, 0.5) # males: non-significant

# But it doesn't mean males and females are different!
# Are the proportions of success between men and women significantly different?
prop.test(c(33,29),c(50,50))

# Power and sample size ------
power.binom <- numeric(100) # initialize our power values vector
theta <- 0.7 # true probability of guessing the colour (normally unknown, but let's assume)
for (n in 1:100) { # n is sample size
  cutoff <- qbinom(p=0.975, size=n, prob=0.5) # compute cut-off frequency
  power.binom[n] <- 1 - pbinom(cutoff, size=n, prob=theta)
}
plot(power.binom, bty="n", type="l", col=4, lwd=2, 
     xlab="Sample Size, N", 
     ylab="Probability of Rejecting the Null")
