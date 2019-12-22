# Tabulating data -------

load("../lsr/data/nightgarden.Rdata")
speaker; utterance

table(speaker) # counts frequencies
table(speaker, utterance) # a two-way table

itng <- data.frame(speaker, utterance) # make data frame
table(itng) # cross-tabulation

xtabs(~ speaker + utterance, data = itng) # cross-tabulation using `xtabs`

prop.table(table(itng)) # express as proportion of the grand total
prop.table(table(itng), margin = 1) #  proportion of row totals
prop.table(table(itng), margin = 2) #  proportion of column totals

tabulate(itng$utterance) # low-level, outputs a vector

# Transforming and recoding variables ------

load("../lsr/data/likert.Rdata")
likert.raw

df <- data.frame(likert.raw) # create data frame
(df$likert.centred <- df$likert.raw - 4) # create centred data
(df$opinion.strength <- abs(df$likert.centred)) # create strength variable
(df$opinion.dir <- sign(df$likert.centred)) # create direction variable
df # print the final data frame:
# 
# Cutting a variable (binning) ---------

(age <- c( 60,58,24,26,34,42,31,30,33,2,9 ))
(age.breaks <- seq( from = 0, to = 60, by = 20 )) # define breaks
(age.labels <- c( "young", "adult", "older" )) # define labels

(age.group <- cut(age, breaks=age.breaks, labels=age.labels))

data.frame( age, age.group ) # we have now categorized ages into three age groups
table(age.group)

cut(age, breaks = 3) # let R choose, but the categories have odd names; tries to have equal spans
lsr::quantileCut( age, n = 3 ) # lsr function tries to have equal numbers
#
# Rounding a number -----

round(4.3)
round(0.0123, 2)

# signif is very useful in getting meaningful output: no such function in Excel
signif(c(4.321, 0.0123), 2) # note the output

42 %/% 10 # integer division
42 %% 10 # modulus (remainder)

# Logarithms and exponentials -----

log10(1000) # which power of 10
log2(8) # which power of 2

exp(3) # `e` to the power 3
log(20.1) # natural base logarithm

# Subsetting revisited ------

utterance[ speaker == "makka-pakka" ] # select utterances by one speaker
speaker[ utterance %in% c("pip","oo") ] # select speakers of a SET of utterances

utterance[2:3] # select 2:3
utterance[-(2:3)] # omit 2:3

# Split a vector by group ---------

(speech.by.char <- split(utterance, speaker)) # this outputs a list
split(utterance, speaker)$`upsy-daisy`[1] # referencing subelements in a list; backquote needed because of the hyphen

# Utility for importing list (df) variables into the environment -----

lsr::importList( speech.by.char )

# Subsetting a dataframe with names --------

subset(itng, speaker=="makka-pakka", utterance)
subset(itng, speaker=="makka-pakka") # only specify row-condition, select all variables
subset(itng, ,utterance)

# Subsetting a dataframe with brackets --------

load( "../lsr/data/nightgarden2.Rdata" )
garden
garden[ 4:5, 1:2 ] # rows 4 through 5, variables (columns) 1 and 2
garden[ c(2,4,5), c(1,3) ] # non-contiguous values
garden[ c("case.4", "case.5"), c("speaker", "utterance") ] # using row/col labels
garden[ 4:5, c("speaker", "utterance") ] # mix numbers with variable names
garden[ garden$speaker == "makka-pakka", c("speaker", "utterance") ] # remember to include df name
garden[ , 1:2 ] # all rows
garden[ 4:5, ] # all variables
garden[ , -3 ] # all vars but number 3

garden[,3] # dropping: becomes a vector if a single variable, no longer a df
garden[,3, drop = FALSE] # prevent dropping

garden[1:2] # if comma omitted, assumes variables (columns)
garden[3] # no dropping here
garden[[3]] # strips the list down to elementary contents

print.default(garden) # a data frame is actually a special list
# 
# Sorting a vector ------

numbers <- c(2,4,3)
sort(numbers)
sort(numbers, decreasing = TRUE)

text <- c("aardvark", "zebra", "swing")
sort(text)
fac <- factor(text)
fac

# Relevel a factor (very useful) -------

fac <- factor( text, levels = c("zebra","swing","aardvark") )
sort(fac) # factors are sorted by levels

# Sorting a data frame -------

lsr::sortFrame( garden, speaker, line)
lsr::sortFrame( garden, speaker, -line)

# using the base package (i.e. without lsr):
garden[order(garden$speaker, -garden$line),]

# Combining vectors -----

(cake.1 <- c(100, 80, 0, 0, 0))
(cake.2 <- c(100, 100, 90, 30, 10))
(cake.df <- data.frame(cake.1, cake.2)) # dataframe

(cake.mat1 <- cbind(cake.1, cake.2)) # matrix with input vectors as columns

(cake.mat2 <- rbind(cake.1, cake.2)) # matrix with input vectors as rows

# Transposing a data frame (or matrix) ------

load("../lsr/data/cakes.Rdata")
cakes; class(cakes)

(cakes.flipped <- t(cakes)) # transposed matrix

lsr::tFrame( itng ) # t() outputs a matrix, but this function will produce a df

# Reshaping --------

load("../lsr/data/repeated.Rdata")
drugs # is in wide form (repeated measures)

lsr::wideToLong(drugs) # convert to long format
(drugs.2 <- lsr::wideToLong(drugs, within = "drug")) # name the WITHIN variable
# cf. reshape(), stack(), unstack() in base, and the `reshape` package with cast() and melt()

# now go back to wide:
lsr::longToWide(drugs.2, formula = WMC+RT ~ drug)

# two within factors now:
(choice.2 <- lsr::wideToLong( choice, within=c("block","day"), sep="/" ))

# back to wide:
lsr::longToWide(choice.2, MRT+PC ~ block+day, sep="/")

# Operations on text ---------

animals <- c("cat", "dog", "kangaroo", "whale") # text vector
strtrim(animals,3)

substr(animals, start = 2, stop = 3)

# Pasting strings -------

paste( "hello", "world" )
paste( "hello", "world", sep='.' )

hw <- c( "hello", "world" )
ng <- c( "nasty", "government" )

paste(hw, ng)
paste(hw, ng, collapse =" ")

# Splitting (parsing) strings -----

monkey <- "It was the best of times. It was the blurst of times."
monkey.1 <- strsplit(monkey, split = "[.]? |[.]")
unlist(monkey.1) # output of split() is a list

# Text substitution -----

text <- c( "lIfe", "Impact" )
tolower(text)

old.text <- "albino"
chartr(old= "aln", new = "lid", x = old.text)

# Concatenate -------

cat(hw, ng) # print, does not assign values; strings them on back to back
# 'O'Rourke' # error, need to escape the middle quote
"O'Rourke" # this is now OK
'O\'Rourke' # this is OK, too: escape characters save the day

PJ <- "P.J. O\'Rourke says, \"Yay, money!\". It\'s a joke, but no-one laughs."
print(PJ)
print.noquote(PJ) # print omitting escape characters
cat(PJ) # ... or, more simply
cat("xxxx\boo") # \b is backspace, actually works
cat("xxxx\too") # \t is tab
cat("xxxx\noo") # \n inserts a new line
cat("xxxx\roo") # \r returns to line beginning and so overwrites two x's

# Text match and substitution: grep, sub, gsub, regular expressions --------

beers <- c( "little creatures", "sierra nevada", "coopers pale" )
grep("er", beers) # returns index
grep("er", beers, value = TRUE) # if you want values

gsub("a", "BLAH", beers) # substitute all occurences (global substitute)
sub("a", "BLAH", beers) # only replace the first occurence in each value

grep("(^[a-z]{6} )", beers, val = TRUE) # 6-letter words

# Reading text files ---------

# various options:

data <- read.csv(file = "../lsr/data/booksales2.csv", # specify the name of the file
                 header = FALSE, # variable names in the file?
                 skip = 8, # ignore the first 8 lines
                 quote = "*", # what indicates text data?
                 sep = "\t", # what separates different entries?
                 na.strings = "NFI") # what is the code for missing data?

# NOTE: Polish separator settings will cause Excel to produce SEMICOLON
# separated data rather than CSV. Although you can change the `sep` variable,
# read.csv2() uses ";" as the default
# If you have sep = "\t" (tab-separated files), then read.txt() will work right away

# Coercion ---------

x <- "100" # the variable
x + 1
class(x) # what class is it?
x <- as.numeric(x) # coerce as number [as.logical(), as.character(), as.factor(), unlist()]
x + 1

# Matrices and arrays --------

row.1 <- c( 2,3,1 ) # create data for row 1
row.2 <- c( 5,6,7 ) # create data for row 2
(M <- rbind(row.1, row.2)) # row bind them into a matrix
colnames(M) <- c( "col.1", "col.2", "col.3" )
M[2,3] # subsetting as for data frames
M[6] # same using a single index, which works like this: rows, then columns


# 3-way table ---------

(dan.awake <- c(rep(T,5), rep(F,5)))
(xtab.3d <- table(speaker, utterance, dan.awake))
class(xtab.3d)

# Ordered factors -------

likert.raw
class(likert.raw) # numeric
(likert.ordinal <- factor(likert.raw, levels=seq(7,1,-1), ordered=TRUE)) # 1 is STRONGEST agreement

levels(likert.ordinal) <- c("strong.disagree", "disagree", "weak.disagree", "neutral", "weak.agree", "agree", "strong.agree") # relevel
likert.ordinal

# Rounding, floating-point arithmetic -------

0.1 + 0.2 == 0.3
0.1 + 0.2 - 0.3
abs(0.1 + 0.2 - 0.3) < 10^-10 # tolerance test
all.equal(0.1 + 0.2, 0.3) # test of equality allowing for rounding errors

# Recycling of values --------

x <- c( 1,1,1,1,1,1 ) # x is length 6
y <- c( 0,1 ) # y is length 2
x + y # now add them: elements from the second vector are recycled

# Environments -----

search() # search path or list of environments
objects() # list of objects in the Global Env
objects("package:stats")
