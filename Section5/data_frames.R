# https://google.github.io/styleguide/Rguide.xml

# Print working directory
# getwd()

# Set working directory
# setwd("/Users/ericbalawejder/Development/R/RPA-Z/....)

# Remove variable from local memory envirnoment
# rm()

nrow(DemographicData)
ncol(DemographicData)

# Look at top 6 rows by default or pass argument rows
head(DemographicData)
head(DemographicData, n=10)

# Shows bottom 6 rows "...."
tail(DemographicData)

# Structure of types
str(DemographicData)

# Random variables distributed uniformly
runif(DemographicData)

summary(DemographicData)

#--------------- using the $ sign


DemographicData[3, 3]
DemographicData[3, "Birth.rate"]

DemographicData$Internet.users
DemographicData$Internet.users[2]
DemographicData[, "Internet.users"]
levels(DemographicData$Income.Group)

# Basic operations with data frames
# rows 1-10, all of the columns
DemographicData[1:10,]
DemographicData[3:9,]

# Only the 4th and 100th row
DemographicData[c(4,100),]

# Take the first row, returns a data_frame
DemographicData[1,]
is.data.frame(DemographicData[1,])

# Take the first column, returns an integer
DemographicData[,1]
is.data.frame(DemographicData[,1])
is.vector(DemographicData[,1])

DemographicData[,1, drop=F]
is.data.frame(DemographicData[,1, drop=F])

# Multiply columns
head(DemographicData)
DemographicData$Birth.rate * DemographicData$Internet.users
DemographicData$Birth.rate + DemographicData$Internet.users

# Add a column
DemographicData$MyCalc <- DemographicData$Birth.rate * DemographicData$Internet.users
head(DemographicData)

# Test of knowledge
#DemographicData$xyz <- 1:5 error, must be a divisor of 195
DemographicData$xyz <- 1:5
head(DemographicData)

# Remove a column
DemographicData$MyCalc <- NULL
DemographicData$xyz <- NULL
head(DemographicData)

#------------------ Filtering data frames
head(DemographicData)
filter <- DemographicData$Internet.users < 2
DemographicData[filter,]
DemographicData[DemographicData$Birth.rate > 40,]
DemographicData[DemographicData$Birth.rate > 40 & DemographicData$Internet.users < 2,]
DemographicData[DemographicData$Income.Group == "High income",]
levels(DemographicData$Income.Group)

# Find Malta
head(DemographicData)
Malta <- DemographicData$Country.Name == "Malta"
DemographicData[Malta,]
# Alternatively
DemographicData[DemographicData$Country.Name == "Malta",]

#------------- introduction to q-plot()
library(ggplot2)
?qplot
qplot(data=DemographicData, x=Internet.users)
qplot(data=DemographicData, x=Income.Group, y=Birth.rate)
qplot(data=DemographicData, x=Income.Group, y=Birth.rate, size=I(3), color=I("blue"))
qplot(data=DemographicData, x=Income.Group, y=Birth.rate, geom="boxplot")

#---------- visualizing what we need
qplot(data=DemographicData, x=Internet.users, y=Birth.rate)
qplot(data=DemographicData, x=Internet.users, y=Birth.rate, 
      color=I("red"), size=I(1))
qplot(data=DemographicData, x=Internet.users, y=Birth.rate, 
      color=Income.Group, size=I(1))

#------------------------------ creating data frames
mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, 
                   Regions_2012_Dataset)
head(mydf)
#colnames(mydf) <- c("Country", "Code", "Region")
#head(mydf)
rm(mydf)

mydf <- data.frame(Country=Countries_2012_Dataset, Code=Codes_2012_Dataset, 
                   Region=Regions_2012_Dataset)
head(mydf)
tail(mydf)
summary(mydf)

#----------------------merging data frames
head(DemographicData)
head(mydf)

merged <- merge(DemographicData, mydf, by.x = "Country.Code", by.y = "Code")
head(merged)
merged$Country <- NULL
str(merged)
tail(merged)

#---------------------visualizing with new split
qplot(data=merged, x=Internet.users, y=Birth.rate)
qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region)

#1. Shapes
qplot(data=merged, x=Internet.users, y=Birth.rate, 
      color=Region, size=I(1), shape=I(2))
#2. Transparency
qplot(data=merged, x=Internet.users, y=Birth.rate, 
      color=Region, size=I(1), shape=I(2), alpha=I(0.5))
#3. Title
qplot(data=merged, x=Internet.users, y=Birth.rate, 
      color=Region, size=I(1), shape=I(2), alpha=I(0.5), 
      main="Birth Rate vs Internet Users")








