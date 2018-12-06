?matplot
?legend

myplot <- function(data, rows=1:10){
  Data <- data[rows,,drop=F]
  matplot(t(Data), type="b", pch=15:18, col=c(1:4,6), cex=0.60)
  legend("bottomleft", inset=0.01, cex=0.60, legend=Players[rows], col=c(1:4,6), pch=15:18, horiz=F)
}

# Salary
myplot(Salary)
myplot(Salary / Games)
myplot(Salary / FieldGoals)

# In-Game Metrics
myplot(MinutesPlayed)
myplot(Points)

# In-Game Metrics Normalized
myplot(FieldGoals / Games)
myplot(FieldGoals / FieldGoalAttempts)
myplot(FieldGoalAttempts / Games)
myplot(Points / Games)

# Interesting Observation
myplot(MinutesPlayed/Games)
myplot(Games)

# Time is valuable
myplot(FieldGoals / MinutesPlayed)

# Player Style
myplot(Points / FieldGoals)

f <- function(vector=1:3){
  vector * 5
}
f()
f(c(1,1,1))
f() + f(c(1,1,1))
