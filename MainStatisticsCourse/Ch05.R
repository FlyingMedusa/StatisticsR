# Load data --------

load( "../lsr/data/aflsmall.Rdata" ) # adjust your path as needed
library(lsr)
who()
afl.margins

# Inspect histogram -----

hist( x = afl.margins,
      main = "", # title of the plot
      xlab = "Winning Margin", # set the x-axis label
      ylab = "Frequency", # y label
      #     width = 0.8,
      #     border = "gray20", # set the colour of the borders of the bars
      col = "lightblue", # set the colour of the shading lines
      labels = TRUE, # add frequency labels to each bar
      ylim = c(0,40) # change the scale of the y-axis
)

# The mean ---------

sum( afl.margins[1:5] ) / 5 # mean of first five values
sum( afl.margins ) / length(afl.margins) # mean of all values
mean(afl.margins) # the mean function

# The median -------

sort(afl.margins) # sort values
length(afl.margins)/2 # half the values: between 88 and 89
median(afl.margins)
quantile(afl.margins, 0.5) # same thing

# Trimmed mean -----

dataset <- c( -15,2,3,4,5,6,7,8,9,12 )
mean(dataset); median(dataset)
mean(dataset, trim = 0.1)

# Mode --------

afl.finalists
table(afl.finalists)
lsr::modeOf(afl.finalists) # no mode function in core package
lsr::maxFreq(afl.finalists) # what is that modal frequency?

# Measures of variability ---------

# Range -------

# The full span of the data: difference between max and min:
max(afl.margins); min(afl.margins)
max(afl.margins) - min(afl.margins)
range(afl.margins)
diff(range(afl.margins)) # range returns a vector of two numbers, that's how we find the difference between them

# Interquartile range --------
# The span of the middle half of the data

quantile(afl.margins, 0.75); quantile(afl.margins, 0.25)
quantile(afl.margins, 0.75) - quantile(afl.margins, 0.25)
IQR(afl.margins)

# Mean/median absolute deviation -------
# typical deviation from the mean

x <- c(56, 31, 56, 8, 32)
mean(x)
x - mean(x) # deviations from the mean
mean(x - mean(x)) # mean deviations are ZERO (by definition!)
abs(x - mean(x)) # absolute deviations (no negatives)
mean(abs(x - mean(x))) # mean absolute deviation
lsr::aad(x) # lsr convenience function

# Variance: mean squared deviation -----

(x - mean(x))^2 # squared deviations
mean((x - mean(x))^2) # mean squared deviation
var(x) # not quite the same, because var() divides by (n-1):

var(afl.margins)
sum((afl.margins - mean(afl.margins) )^2)/(length(afl.margins) - 1)

# Standard deviation ---------
# Variance gives you means squared deviations, in squared units
# To remedy that, we take the square root of the variance:
var(afl.margins) # variance
sqrt(var(afl.margins)) # square root of the variance = standard deviation
sd(afl.margins)

# Median absolute deviation -------
# refresher, mean absolute deviation
mean( abs(afl.margins - mean(afl.margins)) )

# now replace mean with median (at both levels)
median( abs(afl.margins - median(afl.margins)) )

# Use the built-in function
mad(afl.margins, constant = 1)

# we need to specify the "scale factor", which by default is 1.4826: this ensures compatibility with standard deviation, so MAD can be used as a robust variant of SD:

mad(afl.margins)
sd(afl.margins)

# Skewness ---------
# Skewness indicates assymetry; positive has a long tail of high values

psych::skew(afl.margins)
hist(afl.margins)

# Kurtosis ---------
# Kurtosis measures the "pointedness" of the data. We normalize by substracting 3 so it is compared to standard normal
psych::kurtosi(afl.margins)

# Overall summary of a variable in R --------

summary(afl.margins)
psych::describe(afl.margins) # this gives more descriptives

# summary returns different summaries depending on variable type:
summary(afl.finalists) # same as table:
table(afl.finalists) # frequency table

# summary of a data frame
load( "../lsr/data/clinicaltrial.Rdata" ) # adjust your path as needed
summary(clin.trial)
psych::describe(clin.trial)
psych::describe(afl.margins)

# Descriptive statistics by group ------

# psych describeBy()
psych::describeBy(clin.trial, group=clin.trial$therapy)

# base function `by`
by(data=clin.trial, INDICES=clin.trial$therapy, FUN=summary)

# another way, and more convenient for multiple factors: `aggregate`
aggregate(formula = mood.gain ~ drug + therapy, data = clin.trial, FUN = mean)

# shorthand with no specification of parameters
aggregate(mood.gain ~ drug + therapy, clin.trial, mean)
#
# Standardized scores --------
# used to be very popular in the days of statistical tables
# express values in terms of normalized scale of mean = 0 and sd = 1
# so to get it you substract mean and divide by sd
# we can use the `scale` function for this

# Correlations -----

# sleep quantity and grumpiness
load( "../lsr/data/parenthood.Rdata" ) # adjust your path as needed
summary(parenthood)
head(parenthood)
hist(parenthood$dan.grump)
hist(parenthood$dan.sleep)
hist(parenthood$baby.sleep)

par(mfrow=c(1,2))
plot(parenthood$dan.sleep,parenthood$dan.grump, pch=20, col="blue")
plot(parenthood$baby.sleep,parenthood$dan.grump, pch=20, col="blue")

plot(parenthood$baby.sleep,parenthood$dan.grump, pch=20, col="blue")
plot(parenthood$baby.sleep,parenthood$dan.sleep, pch=20, col="blue")
par(mfrow=c(1,1))

attach(parenthood) # copies variables from dataframe into environment so we can refer to them directly
cor(dan.sleep, dan.grump)
cor(parenthood) # correlation matrix for all num vars in df
signif(cor(parenthood), 3) # tidier output

pairs(parenthood) # visually inspect all correlation patterns at once
PerformanceAnalytics::chart.Correlation(parenthood) # a jazzy alternative

load("../lsr/data/anscombesquartet.Rdata")
lsr::who(T)
cor(X1,Y1); cor(X2,Y2); cor(X3,Y3); cor(X4,Y4)

par(mfrow=c(2,2))
plot(X2,Y2, pch=20, cex=2, col="blue")
plot(X1,Y1, pch=20, cex=2, col="blue")
plot(X3,Y3, pch=20, cex=2, col="blue")
plot(X4,Y4, pch=20, cex=2, col="blue")
par(mfrow=c(1,1))

# Spearman (rank-order) correlation ---------

load("../lsr/data/effort.Rdata")
summary(effort)
(effort <- effort[order(effort$hours),])

plot(effort$grade ~ effort$hours, type="b", pch=20, cex=1.5, lwd=2, col=20)
abline(lm(effort$grade ~ effort$hours), lty=3)
cor(effort$hours, effort$grade) # r = 0.91
cor(effort$hours, effort$grade, method = "spearman") # rank correlation is perfect: rs = 1

# same thing manually:
hours.rank <- rank(effort$hours) # rank students by hours worked
grade.rank <- rank(effort$grade) # rank students by grade received
cor(hours.rank, grade.rank)

# lsr::correlate --------

load("../lsr/data/work.Rdata")
str(work)
cor(work) # produces errors as there are two factors in the df
lsr::correlate(work)
lsr::correlate(work, corr.method = "spearman")

# Missing data -----

partial <- c(10, 20, NA, 30) # has missing value (Not Available)
mean(partial) # also gives NA
mean(partial, na.rm = TRUE) # ignores missing values

load("../lsr/data/parenthood2.Rdata")
parenthood2 # same as parenthood but with data missing here and there
psych::describe(parenthood2) # see n < 100 for the first three variables

cor(parenthood2) # can't compute because of missing data
cor(parenthood2, use = "complete.obs") # complete rows only
cor(parenthood2, use = "pairwise.complete.obs") # enough for the pair of scores to be present
lsr::correlate(parenthood2) # pairwise complete is the default method for lsr::correlate
