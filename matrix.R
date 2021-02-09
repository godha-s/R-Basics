# A 5 row and 2 column matrix of 10 integers
yMatrix <- matrix(1:10, nrow = 5, ncol = 2)
yMatrix

# Elements are arranged sequentially by row.
M <- matrix(c(3:14), nrow = 4, byrow = TRUE)
print(M)

# Elements are arranged sequentially by column.
N <- matrix(c(3:14), nrow = 4, byrow = FALSE)
print(N)
