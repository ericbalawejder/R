# Named vectors
charlie <- 1:5
charlie

# Give names
names(charlie) <- c("a", "b", "c", "d", "e")
charlie
charlie["d"]

# Clear names
names(charlie) <- NULL
charlie

# Naming matrix dimensions
temp_vector <- rep(c("a", "B", "zZ"), 3)
temp_vector <- rep(c("a", "B", "zZ"), each=3)
temp_vector

Bravo <- matrix(temp_vector, 3, 3)
Bravo

row.names(Bravo) <- c("How", "are", "you")
Bravo

colnames(Bravo) <- c("X", "Y", "Z")
Bravo

Bravo["are","Y"] <- 0
Bravo

row.names(Bravo) <- NULL
Bravo
