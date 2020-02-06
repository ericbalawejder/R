getwd()
setwd("/Users/ericbalawejder/Development/R/RPA-Z/Section6")
getwd()

movies <- read.csv("P2-Movie-Ratings.csv")
head(movies)
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudianceRating", "BudgetInMillions", "Year")
head(movies)
tail(movies)
str(movies)
summary(movies)

factor(movies$Year)
movies$Year <- factor(movies$Year)
summary(movies)
str(movies)

#---Aesthetics
library(ggplot2)

ggplot(data=movies, aes(x=CriticRating, y=AudianceRating))

# Add geometry
ggplot(data=movies, aes(x=CriticRating, y=AudianceRating)) + geom_point()

# Add color
ggplot(data=movies, aes(x=CriticRating, y=AudianceRating, colour=Genre)) + geom_point()

# Add size
ggplot(data=movies, 
       aes(x=CriticRating, y=AudianceRating, colour=Genre, size=BudgetInMillions)) + 
  geom_point()
#>>> This #1 (we will improve it)

#---------Plotting with layers

p <- ggplot(data=movies, 
            aes(x=CriticRating, y=AudianceRating, colour=Genre, size=BudgetInMillions))

#points
p + geom_point()

#lines
p + geom_line()

#multiple layers
p + geom_point() + geom_line() 
p + geom_line() + geom_point()

#-------------- Overriding Aesthetics

q <- ggplot(data=movies, 
            aes(x=CriticRating, y=AudianceRating, colour=Genre, size=BudgetInMillions))

#add geom layer
q + geom_point()

#overriding aes
#ex1
q + geom_point(aes(size=CriticRating))

#ex2
q + geom_point(aes(colour=BudgetInMillions))

#q remains the same
q + geom_point()

#ex3
q + geom_point(aes(x=BudgetInMillions)) + xlab("Budget In Millions")

#ex4
p + geom_line() + geom_point()

#reduce line size
p + geom_line(size=1) + geom_point()

# Mapping vs setting
r <- ggplot(data=movies, 
            aes(x=CriticRating, y=AudianceRating, colour=Genre, size=BudgetInMillions))
r + geom_point()

#add color
#1 mapping (what we have done so far)
r + geom_point(aes(colour=Genre))
#2 setting
r + geom_point(colour="DarkGreen")
#ERROR
#r + geom_point(aes(colour="DarkGreen"))

#1 Mapping
r + geom_point(aes(size=BudgetInMillions))
#2 Setting
r + geom_point(size=1)

#ERROR
#r + geom_point(aes(size=1))


# ---------Histograms and Density Charts

s <- ggplot(data=movies, aes(x=BudgetInMillions))
s + geom_histogram(binwidth=10)

#add color
s + geom_histogram(binwidth=10, aes(fill=Genre))
#add a border
s + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")
#>>> chart #3 (we will improve it)

#sometimes you may need density charts
s + geom_density()
s + geom_density(aes(fill=Genre), position="stack")


# ----- Starting Layer Tips

t <- ggplot(data=movies, aes(x=AudianceRating))
t + geom_histogram(binwidth=10, fill="White", colour="Blue")

#another way
t <- ggplot(data=movies)
t + geom_histogram(binwidth=10, 
                   aes(x=AudianceRating), fill="White", colour="Blue")
#>>> chart 4

# With this approach, I don't have to recreate the t variable
t + geom_histogram(binwidth=10, 
                   aes(x=CriticRating), fill="White", colour="Blue")


?geom_smooth

u <- ggplot(data=movies, aes(x=CriticRating, y=AudianceRating, colour=Genre))

u + geom_point() + geom_smooth()
u + geom_point() + geom_smooth(fill=NA)

#boxplots
u <- ggplot(data=movies, aes(x=Genre, y =AudianceRating, colour=Genre))

u + geom_boxplot()
u + geom_boxplot(size=0.5)
u + geom_boxplot(size=0.5) + geom_point()
#tip/hack:
u + geom_boxplot() + geom_jitter()

u + geom_jitter() + geom_boxplot(alpha=0.5)
#>>>> chart #6


#----- Using Facets

v <- ggplot(data=movies, aes(x=BudgetInMillions))
v + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")

#facets
v + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black") +
  facet_grid(Genre~., scales="free")

#scatterplots:
w <- ggplot(data=movies, aes(x=CriticRating, y=AudianceRating, colour=Genre))
w + geom_point()

#facets
w + geom_point() + facet_grid(Genre~.)
w + geom_point() + facet_grid(.~Year)
w + geom_point(size=0.1) + facet_grid(Genre~Year)

w + geom_point(size=0.1) + geom_smooth() + facet_grid(Genre~Year)

w + geom_point(size=0.1, aes(size=BudgetInMillions)) + 
  geom_smooth() + facet_grid(Genre~Year)
#>>>> 1 (will improve)

# Limits and zoon:

m <- ggplot(data=movies, aes(x=CriticRating, y=AudianceRating, 
                             size=BudgetInMillions,
                             colour=Genre))
m + geom_point()
m + geom_point() + xlim(50, 100)
m + geom_point() + xlim(50, 100) + ylim(50, 100)

# Won't always work well
n <- ggplot(data=movies, aes(x=BudgetInMillions))
n + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")

# Cuts off data
n + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black") +
  ylim(0, 50)

# Instead, zoom:
n + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black") +
  coord_cartesian(ylim=c(0, 50))

# improve #1
w + geom_point(aes(size=BudgetInMillions)) + 
  geom_smooth() + facet_grid(Genre~Year) +
  coord_cartesian(ylim=c(0, 100))


# Theme
o <- ggplot(data=movies, aes(x=BudgetInMillions))
o + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")

# axes label
h <- o + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")
h

h + xlab("Money axis") + ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=10),
        axis.title.y = element_text(colour="Red", size=10),
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10))

?theme

# lengend formatting:
h + xlab("Money axis") + ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=10),
        axis.title.y = element_text(colour="Red", size=10),
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10),
        
        legend.title = element_text(size=10),
        legend.text = element_text(size=10),
        legend.position = c(1, 1),
        legend.justification = c(1, 1),
        
        plot.title = element_text(colour="DarkBlue",
                                  size=10,
                                  family="Courier"))





