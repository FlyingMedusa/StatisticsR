#Chapter 5 - descriptive statistics

load("D:/ELTITstats/lsr/data/aflsmall.Rdata")

library(lsr)
who()
print(afl.margins)

#index of values
which(afl.margins == 0)

#how many occurences
table(afl.margins)
#how many occurences for the most popular value
max(table(afl.margins))
#max number and index
which(table(afl.margins) == max(table(afl.margins)))
names(which(table(afl.margins) == max(table(afl.margins))))

#5.1 Measures of central tendency

#mean
mean(afl.margins)
sum(afl.margins) / length(afl.margins)
#median
sort(afl.margins)
length(afl.margins)/2
median(afl.margins)
#ignoring the missing values
median(afl.margins, na.rm = T)
#trimmed mean
dataset <- c(-15, 2,3,4,5,6,7,8,9,12)
mean(dataset); median(dataset)
mean(dataset, trim = 0.1) #trim from both sides
plot(dataset)

afl.finalists
#table of frequency
table(afl.finalists)

#mode - (pl: dominanta)
#who won most frequently
lsr::modeOf(afl.finalists) #no mode function in core package
#how many times
lsr::maxFreq(afl.finalists)

#measures of variability
max(afl.margins); min(afl.margins)
max(afl.margins) - min(afl.margins)
range(afl.margins)
diff(range(afl.margins))
#range returns a vector of two numbers, that's how we find the difference between them

quantile(afl.margins, 1/2)
quantile(afl.margins)
quantile(afl.margins, .9)
quantile(afl.margins, c(.1,.9))
IQR(afl.margins) #inter quantile range
quantile(afl.margins, c(1/4, 3/4))
diff(quantile(afl.margins, c(1/4, 3/4)))#use IQR instead

x <- c(56, 31, 56, 8, 32)
mean(x)
x - mean(x) #derivations from the mean
#mean deviations are ZERO (by definition!)
all.equal(mean(x - mean(x)), 0)
abs(x - mean(x)) #absolute deviations (no negatives)
mean(abs(x - mean(x))) #mean absolute deviation
lsr::aad(x) #lsr convenience function

#variance
(x - mean(x))^2 #squared deviations
var(x) #var divides by(n -1)
sum((afl.margins - mean(afl.margins))^2)/(length(afl.margins) - 1)
var(afl.margins)

#standard deviation
sd(afl.margins)

mean(afl.margins)
mad(afl.margins) #median absolute deviation

#Skewness indicates assymetry; positive has a long tail of high values
psych::skew(afl.margins)
hist(afl.margins)