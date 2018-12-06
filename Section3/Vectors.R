# Creating vectors

Vector1 <- c(2, 89, 5, 33, 34)
Vector1
is.numeric(Vector1)
is.integer(Vector1)
is.double(Vector1)

V2 <- c(23L, 88L, 987L, 0L)

# This converts 8 to "8"
V3 <- c("hello", "world", "chars", 8)
is.character(V3)

# Sequence
seq()
# Replicate
rep()

seq(1,15)
# Short cut
1:15

# Sequence provides more parameters such as the increment argument:
seq(0,100,5)
z <- seq(1, 15, 4)
z

# Replicate 3, 50 times
rep(3, 100)
d <- rep(3, 50)
rep("a", 9)

# Replicate the vector x 10 times
x <- c(80, 20)
y <- rep(x, 10)
y

# Accessing vector indexes. Indexing in R starts at 1.
V5 <- c(3, 2, 101, 197, 1001, 11)
w <- V5[4]
w

# Exclude vector elements [-1], all the elements except [N]
V5[-3]
# Return the first 3 elements
elements <- V5[1:3]
# Return the elements specified by the vector, first, third, fifth.
elements <- V5[c(1,3,5)]
# Exclude the elements specified by the vector.
elements <- V5[c(-2,-4)]

revenue <- c(8898, 4453, 3323, 987, 4566)
expenses <- c(23, 45432, 3455, 232, 34563)
profit <- revenue - expenses
profit
