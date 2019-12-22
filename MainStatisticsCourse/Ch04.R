# Packages ---------

exists( "read.spss" ) # is the function available?
library(foreign) # load the "foreign" library; can also tick in the Packages pane in RStudio
exists( "read.spss" ) # recheck

detach("package:foreign") # or just uncheck in the Packages pane in RStudio

# install.packages('sciplot') # can also install in the Packages pane in RStudio

# Workspace --------

ls() # lists objects (variables, data frames, functions) - also `objects()`
require(lsr) # same as library() but quiet - useful in scripts
who() # this is ONLY available if you've loaded lsr, not a base function!
ls() # a compromise between this
ls.str() # and this

rm() # removes objects
rm(list = ls()) # removes (nearly) everything

getwd() # Ctrl-Shift-h displays and lets you pick; can use the Files pane, too
# setwd() # sets Working Directory *USE FORWARD SLASHES* or simply Ctrl-Shift-h

list.files() # list files in Working Directory
list.files(,".csv")

path.expand("~") # what's the home directory? (you can use the tilde as a shortcut)

# Loading/saving files -------

load(file = "../lsr/data/booksales.Rdata")  # note the path needs to be correct

save.image(file = "foo.RData") # saves complete workspace; also note `saveRDS()`

books <- read.csv(file = "../lsr/data/booksales.csv")  # read csv file into a data frame
class(books); str(books)
# RStudio: **Import Dataset** on top of the Environment panel

# Special values -------

1/0 # Inf = infinity
0/0 # NaN = Not a Number
# NA = Not Available (missing data code)
# NULL = No value (useful in specifying parameters)
# Assigning names to vector elements --------

(profit <- c(3.1, 0.1, -1.4, 1.1)) # the extra () will print AND assign
(names(profit) <- c("Q1","Q2","Q3","Q4")) # assign names to values
names(profit) <- NULL # that's how we can use NULL :)

profit <- c("Q1"=3.1,"Q2"=0.1,"Q3"=-1.4,"Q4"=1.1) # assign values AND names right away
names(profit)
profit["Q2"] # you can use names as indexes, but remember to quote

# Variable classes ------
class(profit) # numeric, character, logical, 

# Factors -----

group <- c(1,1,1,2,2,2,3,3,3) # meant as group ID's
2 * group # multiplying group ID's makes no sense!

group <- as.factor(group)
group; class(group)
levels(group) <- c("group 1", "group 2", "group 3"); group

(gender <- as.factor(c(rep(1,5), rep(2,4))))
levels(gender) <- c("male", "female")
gender # note that R re-interprets all values in terms of new levels

# Data frames ------

age <- c(17, 19, 21, 37, 18, 19, 47, 18, 19)
score <- c(12, 10, 11, 15, 16, 14, 25, 21, 29)
class(age)
(expt <- data.frame(age, gender, group, score)) # create data frame

expt$score # data frame has variables, that's how we refer to one
names(expt) # query names (can also (re-)assign)

lsr::who(expand = TRUE) # expands data frames

# Lists -------

Dan <- list( age = 34,
             nerd = TRUE,
             parents = c("Joe","Liz")
)
Dan # a list can hold  elements of varying length and type
Dan$nerd # accessing elements of a list
Dan$children <- "Alex" # adding elements to a list

# Formulas ---------

formula1 <- out ~ pred # outcome variable BY predictor (the tilde)
class(formula1) # special class of variable

formula2 <- out ~ pred1 + pred2 # more than one predictor
formula3 <- out ~ pred1 * pred2 # two predictors and interaction between them
formula4 <- ~ var1 + var2 # a 'one-sided' formula

# Getting help -----

?load # help on function `load`
help(load) # same thing
??load # search help topics for the string `load` (within the text)
help.search("load") # same thing
