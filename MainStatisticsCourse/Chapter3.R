#Chapter 3
pi <- 3.14165
round(pi)
round(pi,3)

sales.by.month <- c(0, 100, 200, 50, 0, 0, 0, 0, 0, 0, 0, 0)
sales.by.month[3]
february.sales <- sales.by.month[2]
sales.by.month[5] <- 25
print(sales.by.month[2:4])
sales.by.month[length(sales.by.month)-9]

length(sales.by.month)
days.per.month <- c(31,28,31,30,31,30,31,31,30,31,30,31)
profit <- sales.by.month * 7
daily.profit <- profit / days.per.month
print(daily.profit)

# storing text data
months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
months[4]

greeting <- "Hello!"
nchar(greeting)
nchar(months)

months.names <- month.name
class(months.names)
nchar(months.names)

# Time
Sys.time()
weekdays(Sys.time())
Sys.setlocale("LC_TIME", "French")
weekdays(Sys.time())
months(Sys.time())
Sys.setlocale("LC_TIME", "Polish")

#logical values, operations
2 + 2 == 5
2 + 2 != 5
sqrt(25) == 5
100 >= 99
#    ! not       ;       | or       ;       & and
(2+2 == 4) | (2+2 == 5)
(2+2 == 4) & (2+2 == 5)
!(2+2 == 5)
!TRUE
is.the.Party.correct <- 2 + 2 == 5
is.the.Party.correct
is.the.Party.correct <- T
is.the.Party.correct
is.the.Party.correct <- t #error
any.sales.by.month <- sales.by.month > 0
months.names[any.sales.by.month]
sales.by.month[ c(2,3,4,5)]
months[sales.by.month == 0]

stock.levels <- c("high", "high", "low", "out", "out", rep("high",7))
months[stock.levels == "out"]
months[stock.levels != "high"]
months[stock.levels == "out" | stock.levels == "low"]
months[stock.levels %in% c("out", "low")]