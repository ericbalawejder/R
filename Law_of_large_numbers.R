# Create an R script that will count how many random values fall
# between (-1, 1).
# Check that the Mean(X) converges to the Expected value of X.
# Mean(X) -> E(X)

# Input
N <- 10000
counter <- 0
for (i in rnorm(N)) {
  if (i > -1 && i < 1) {
    counter <- counter + 1
  }
}

# Hit ratio
answer <- counter / N
answer

