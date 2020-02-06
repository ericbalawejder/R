#Import the Data
getwd()
setwd("/Users/ericbalawejder/Development/R/RPA-Z/Section6")
movies <- read.csv("Section6-Homework-Data.csv")

#Data Exploration
head(movies) #top rows
summary(movies) #column summaries
str(movies) #structure of the dataset

#Activate GGPlot2
#install.packages("ggplot2")
library(ggplot2)

#{Offtopic} This Is A Cool Insight:
ggplot(data=movies, aes(x=Day.of.Week)) + geom_bar()
#Notice? No movies are released on a Monday. Ever.

#Now we need to filter our dataset to leave onlly the 
#Genres and Studios that we are interested in
#We will start with the Genre filter and use the Logical 'OR'
#operator to select multiple Genres:
filter <- (movies$Genre == "action") | (movies$Genre == "adventure") | 
  (movies$Genre == "animation") | (movies$Genre == "comedy") | (movies$Genre == "drama")

#Now let's do the same for the Studio filter:
filter2 <- (movies$Studio == "Buena Vista Studios") | (movies$Studio == "WB") | 
  (movies$Studio == "Fox") | (movies$Studio == "Universal") | 
  (movies$Studio == "Sony") | (movies$Studio == "Paramount Pictures")

# Alternative statement
#filter2 <- movies$Studio %in% c("Buena Vista Studios", "WB", "Fox",
#"                              "Universal","Sony", "Paramount Pictures")

#Apply the row filters to the dataframe
movies2 <- movies[filter & filter2,]
movies2

#Prepare the plot's data and aes layers
#Note we did not rename the columns. 
#Use str() or summary() to fin out the correct column names
p <- ggplot(data=movies2, aes(x=Genre, y=Gross...US))
p #Nothing happens. We need a geom.

#Add a Point Geom Layer
p + geom_point()

#Add a boxplot instead of the points
p + geom_boxplot()

#Add points
#Replace points with jitter
p + geom_jitter() + geom_boxplot()

#Place boxplot on top of jitter
p + geom_boxplot() + geom_jitter()

#Add boxplot transparency
p + geom_jitter() + geom_boxplot(alpha=0.7)

#Good. Now add size and colour to the points:
p + geom_jitter(aes(size=Budget...mill., colour=Studio)) + 
  geom_boxplot(alpha=0.7)

#See the remaining black points? Where are they from?
#They are part of the boxplot - Refer to our observation (*) above 

#Let's remove them:
p + geom_jitter(aes(size=Budget...mill., colour=Studio)) + 
  geom_boxplot(alpha=0.7, outlier.color = NA)

#Let's "Save" our progress by placing it into a new object:
q <- p + geom_jitter(aes(size=Budget...mill., colour=Studio)) + 
  geom_boxplot(alpha=0.7, outlier.color = NA)
q

#Non-data ink
q <- q +
  xlab("Genre") + #x axis title
  ylab("Gross % US") + #y axis title
  ggtitle("Domestic Gross % by Genre") #plot title
q

#HINT: for the next part use ?theme if you need to 
#refresh which parameters are responsible for what

#Theme
q <- q + 
  theme(
    #this is a shortcut to alter ALL text elements at once:
    text = element_text(family="Comic Sans MS"),
    
    #Axes titles:
    axis.title.x = element_text(colour="Blue", size=10),
    axis.title.y = element_text(colour="Blue", size=10),
    
    #Axes texts:
    axis.text.x = element_text(size=10),
    axis.text.y = element_text(size=10),  
    
    #Plot title:
    plot.title = element_text(colour="Black",
                              size=10),
    
    #Legend title:
    legend.title = element_text(size=10),
    
    #Legend text
    legend.text = element_text(size=5)
  )
q

#Final touch. We haven't discussed this in the course,
#However this is how you can change individual legend titles:
q$labels$size = "Budget $M"
q

#Well done!