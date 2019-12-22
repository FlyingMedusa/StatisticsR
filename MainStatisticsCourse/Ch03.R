# Arithmetic operations ------

10 + 20
10/20 # this is a comment (a note to future self) which R ignores
10^2

# Citing R packages --------

citation()
citation("lsr")

citation # this gives you information about the function itself (not usu. what we want!); remember to include the parenth in a function, even if blank!

# Order of operations --------

1 + 2 * 4 # same  as in your math classes
# BEDMAS: Brackets -> Exponents -> Division/Multiplication -> Addition/Subtraction

?Syntax # extensive help

# Variable assignment --------

sales <- 350 # how many copies sold same as 350 -> sales
sales # a shortcut for:
print(sales)
(sales <- 350) # an extra pair of () does both at the same time (assign and print)

royalty <- 7 # fee per copy
sales * royalty # R `evaluates` variables, meaning it uses their values

(revenue <- sales * royalty)

(revenue <- revenue + 550) # update variable value (overwrite it)

# Arithmetic functions -------

25^0.5 # 25 to the power of 1/2 - which means square root of 25
sqrt(25) # special function

abs(-13) # absolute value (in Polish: moduł OR wartość bezwzględna)

sqrt(1 + abs(-8)) # Combining functions

# Function arguments and their defaults -----

round(3.1415) # is the same as:
round(3.1415, digits = 0)
?round # help on the round function, or press F1 when cursor on function

round(3.1415, 2) # if you  omit argument names, R assumes they come in order

round(digits = 2, x = 3.1415) # order doesn't matter if you name them

# Vectors -----

sales.by.month <- c(0, 100, 200, 50, 0, 0, 0, 0, 0, 0, 0, 0)
sales.by.month <- c(0, 100, 200, 50, rep(0, 8)) # to save typing
sales.by.month[2] # get second element

(february.sales <- sales.by.month[2]) # get second element

(sales.by.month[5] <- 25) # assign 25 to May sales

length(sales.by.month) # how many elements?

sales.by.month * 7 # multiply each element by 7
profit <- sales.by.month * 7 ; profit # can combine in a single line with ";"
(profit <- sales.by.month * 7) # in this case easier to write with "()"

# Vector operations -----

days.per.month <- c(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
profit/days.per.month # how much earnings per day? element-by-element operation
paste("$",round(profit/days.per.month, 2), sep = "") # nicer-looking

# Text variables --------

greeting <- "hello"
greeting

months <- c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December") # character vector, combine (can use the `month.name` constant)

class(months) # character vector
months[4] # get element number 4
nchar(greeting) # no of letters (in the word held in the variable called greeting)
nchar("greeting") # no of letters (in the word "greeting")
nchar(months) # no of letters in each month

# months and weeks - not in the book
month.name
weekdays(Sys.time())
Sys.setlocale()
Sys.setlocale("LC_TIME", "English")
weekdays(Sys.time())
Sys.setlocale("LC_TIME", "Polish")
weekdays(Sys.time())

# Logical operations ---------

2 + 2 == 4 # note that double ==
2 + 2 == 5
2^7 >= 100 # logical operators: ==, <, <=, >, >=, !=

length(months) == 12

2 + 2 != 5
!(2 + 2 == 5) # ! - NOT, | - OR, & - AND

# Vectors of logicals --------

sales.by.month > 0
(any.sales.this.month <- sales.by.month > 0)

# Getting multiple elements out of a vector ------

c(2,3,4) # combine elements (can be vectors) into a vector
sales.by.month[c(2,3,4)] # subset 3 elements
2:8 # sequence 2 through 8
sales.by.month[2:8]

# Indexing by condition ------

sales.by.month > 0 # recall
months[sales.by.month > 0] # name months with non-zero sales
sales.by.month[sales.by.month > 0]
sales.by.month[any.sales.this.month]

# define text variable stock levels
stock.levels <- c("high", "high", "low", "out", "out", rep("high", 7))
rep("high", 7) # repeat (replicate) "high" seven times
stock.levels

months[stock.levels == "out"] # select months with zero stocks, remember double ==
months[stock.levels != "high"] # select months with non-high stocks
months[stock.levels == "out" | stock.levels == "low"] # same more wordy
