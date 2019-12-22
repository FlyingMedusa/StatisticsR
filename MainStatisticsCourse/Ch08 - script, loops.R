# The WHILE loop --------

x <- 0
while ( x < 1000 ) {
  x <- x + 17
}
print( x )

# The FOR loop -----
for (i in 1:3) {
  print("hello")
}

words <- c("it","was","the","dirty","end","of","winter") # define words
#loop over the words
for (w in words) {
  w.length <- nchar(w) # calculate the number of letters
  W <- toupper(w) # convert the word to upper case letters
  msg <- paste(W, "has", w.length, "letters") # a message to print
  print(msg) # print it
}

# Mortgage loop example -------

# set up
month <- 0 # count the number of months
balance <- 300000 # initial mortgage balance
payments <- 1600 # monthly payments
interest <- 0.05 # 5% interest rate per year
total.paid <- 0 # track what you’ve paid the bank
# convert annual interest to a monthly multiplier
monthly.multiplier <- (1+interest) ^ (1/12)
# keep looping until the loan is paid off...

while ( balance > 0 ) {
  
  # do the calculations for this month
  month <- month + 1 # one more month
  balance <- balance * monthly.multiplier # add the interest
  balance <- balance - payments # make the payments
  total.paid <- total.paid + payments # track the total paid
  
  # print the results on screen
  cat( "month", month, ": balance", round(balance), "\n")
  
} # end of loop

# print the total payments at the end
cat("total payments made", total.paid, "\n" )

# Conditional statements: if ... else -------
# find out what day it is...
today <- Sys.Date() # pull the date from the system clock
day <- weekdays( today ) # what day of the week it is
# now make a choice depending on the day...
if ( day == "Monday" ) {
  print( "I don’t like Mondays" )
} else {
  print( "I’m a happy little automaton" )
}

# Defining functions ---------

quadruple <- function(x) {
  y <- x*4
  return(y)
}
class(quadruple)
quadruple(10)

# define default value
pow <- function( x, y = 1) {
  out <- x^y # raise x to the power y
  return( out )
}
pow(3,2)
pow(3) # default 1

# define an open set of parameters
doubleMax <- function( ... ) {
  max.val <- max( ... ) # find the largest value in ...
  out <- 2 * max.val # double it
  return( out )
}
doubleMax( 1,2,5 )

# Implicit loops, the `apply` family ----
# sapply (single apply) ------
words <- c("along", "the", "loom", "of", "the", "land")
sapply( words, nchar )

# tapply (table apply, very useful) ----
gender <- c( "male","male","female","female","male" )
age <- c( 10,12,9,11,13 )
tapply( X = age, INDEX = gender, FUN = mean )
by( data = age, INDICES = gender, FUN = mean ) # same, but outputs a list
