#First steps with R - DataCamp Introduction to R

#calculating modulo, exponation:
x <- 7%%3
print(x)
y <- 3^4
print(y)

# types:
# numerics  4.5   - decimal values
# integers  4     - natural numbers
# logical   TRUE  - boolean values

#checking data type:   class(...)
class(5.75)
class(901)
class(FALSE)

#VECTORS - creating, naming
numeric_vector <- c(1,2,3,4)
character_vector <- c("a","b","c")

# naming the elements:   names(...)
poker_money_vector <- c(140,-50,20,-120,30,40,-50)
names(poker_money_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")
print(poker_money_vector)
#we can name this way or:
roulette_money_vector <- c(-140,50,-20,120,-30,-40,50)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")
names(roulette_money_vector) <- days_vector
print(roulette_money_vector)

#playing with vectors:
adding_vectors <- c(1,2,3) + c(4,5,6)
print(adding_vectors)

scored_points <- c(10, 30, -20)
all_scored_points <- sum(scored_points)
print(all_scored_points)

#adding a new element to a vector
number_of_lectures <- c(2,1,4,3,2)
lectures_wednesday <- number_of_lectures[3]
print(lectures_wednesday)
lectures_midweek <- number_of_lectures[c(2,3,4)]
# or:
lectures_midweek <- number_of_lectures[2:4]
print(lectures_midweek)

#selecting an element using a name
number_of_lectures <- c(2,1,4,3,2)
days_vector <- c("Mon", "Tue", "Wed", "Thu", "Fri")
names(number_of_lectures) <- days_vector
print(number_of_lectures["Tue"])
print(number_of_lectures[c("Mon", "Fri")])

#calculating an average of values: mean(...)
random_values <- c(3,8,4,3,2)
el_mean <- mean(random_values)
print(el_mean)

#comparison
# <= >= == !=
checking <- c(4,5,6) > 5
print(checking)
poker_money_vector <- c(140,-50,20,-120,30,40,-50)
names(poker_money_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")
if_won <- poker_money_vector >0
print(if_won)
poker_winning_days <- poker_money_vector[if_won]
print(poker_winning_days)



