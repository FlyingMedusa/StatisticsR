#Data Camp Matrices
#matrix - a collection of elements of the same data type arranged into a fixed number of rows and columns

matrix(1:9, byrow = TRUE, nrow = 3)
matrix(c(1,3,5,7,9,11), byrow = FALSE, nrow = 2)
#The argument byrow indicates that the matrix is filled by the rows. If we want the matrix to be filled by the columns, we just place byrow = FALSE
#The third argument nrow indicates that the matrix should have three rows.

#Constructing a matrix - gambling(money spent, money earned)
money_mon <- c(-250,130)
money_tue <- c(-230,158)
money_wed <- c(-110,275)
all_days_gambling <- c(money_mon, money_tue, money_wed)
gambling_matrix <- matrix(all_days_gambling, byrow = TRUE, nrow=3)

#Naming a matrix
status <- c("spent","earned")
days <- c("Mon", "Tue", "Wed")
colnames(gambling_matrix) <- status
rownames(gambling_matrix) <- days
print(gambling_matrix)
#or
gambling_matrix <- matrix(all_days_gambling, byrow = TRUE, nrow=3,dimnames = list(days,status))
print(gambling_matrix)

#calculating
daily_result <- rowSums(gambling_matrix)
print(daily_result)
total_spent_earned <- colSums(gambling_matrix)
print(total_spent_earned)

#Adding a column with cbind() and row with rbind():
summed_gambling_matrix <- cbind(gambling_matrix, daily_result)
print(summed_gambling_matrix)
#****************************
money_thu <- c(-210,385)
money_fri <- c(-50,90)
next_days_gambling <- c(money_thu, money_fri)
next_days <- c("Thu","Fri")
next_gambling_matrix <- matrix(next_days_gambling, byrow = TRUE, nrow=2,dimnames = list(next_days,status))
print(next_gambling_matrix)
summed_both_gambling_matrix <- rbind(gambling_matrix,next_gambling_matrix)
print(summed_both_gambling_matrix)

#selection of matrix elements
my_matrix <- matrix(1:16, byrow = TRUE, nrow = 4)
print(my_matrix)
#selects the element at the first row and second column
my_matrix[1,2] 
#results in a matrix with the data on the rows 1, 2, 3 and columns 2, 3, 4
my_matrix[1:3,2:4] 
# selects all elements of the first column
my_matrix[,1]

#arithmetics with matrices
#multiplie each element of my_matrix by two
my_matrix <- my_matrix*2
print(my_matrix)
my_matrix1 <- matrix(1:9, byrow = TRUE, nrow = 3)
my_matrix2 <- matrix(3:11, byrow = TRUE, nrow = 3)
together_matrix <- my_matrix1 * my_matrix2
print(together_matrix)
