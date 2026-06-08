
#method 1: Select the File Manually:

stats <- read.csv(file.choose())
stats

#method 2: Set WD and Read Data
getwd()
setwd("/Users/nicolstewart/Desktop/courses/r/SECTION 5/Section 5 - Data Frames")
getwd()
rm(stats)
stats <- read.csv("S5-Demographic-Data.csv")
stats

#----------------------------------------- Exlporing Data
nrow(stats) #counts the number of rows 
ncol(stats) #counts the number of columns 
head(stats, n=10) #returns top 6 rows
tail(stats) #returns bottom 6 rows 
str(stats) #structure <- returns a debried of the data frame 
?runif() #random variables distriubuted uniformally
summary(stats)

#----------------------------------------- Using the $ sign
stats
head(stats)
stats[3,3]
stats[3, "Birth.rate"]
stats$Internet.users
stats$Internet.users[2]
stats[, "Internet.users"]
?levels()

#----------------------------------------- Basic Operations with a DF
stats[1:10,] #first 10 rows
stats[c(4,100),]

#how [] works: 
is.data.frame(stats[1,]) 
is.data.frame(stats[,1])

#multiply columns:
head(stats)
stats$Birth.rate * stats$Internet.users

#add a column:
head(stats)
stats$MyCalc <- stats$Birth.rate * stats$Internet.users
head(stats)

#test

stats$xyz <- 1:5 #vector was recycled in the rows, when it is insufficient length - gets recycled (4 wont work - not divisible by 195)
head(stats)

#remove a coloum
stats$MyCalc <- NULL
head(stats)

#----------------------------------------- Filtering Data Frames
head(stats)
stats$Internet.users
#which countries have less than 2% IUs
filter <- stats$Internet.users < 2 #when less than 2 = TRUE // putting it in object: filter
stats[filter,] #this will take vector as DF - each time it comes a TRUE it will display

stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]
stats[stats$Income.Group == "High income",]
stats[stats$Country.Name == "Malta",]

#----------------------------------------- Introduction to qplot()
?qplot()
library(ggplot2)
qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Income.Group, y=Birth.rate)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=3) #legend appears since you are mapping it
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3),
      colour=I("blue")) #just assigning value with NO legend, treats it as is instead of mapping
qplot(data=stats, x=Income.Group, y=Birth.rate, geom ="boxplot")


#------------------------------------------ Visualising what we need
qplot(data=stats, x=Internet.users, y=Birth.rate)
qplot(data=stats, x=Internet.users, y=Birth.rate,
      colour=Income.Group, size=I(2))


#------------------------------------------ Building Data Frames 
mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset) #putting your vectors you want into the df 
#head(mydf)
#colnames(mydf) <- c("Country", "Code", "Region")


rm(mydf)

mydf <- data.frame(Country=Countries_2012_Dataset, Code=Codes_2012_Dataset, Region=Regions_2012_Dataset)
head(mydf)


#------------------------------------------ Merging Data Frames 
head(stats)
head(mydf)

merged <- merge(stats, mydf, by.x= "Country.Code", by.y = "Code")
head(merged)

merged$Country <- NULL
str(merged)

#------------------------------------------ Visualizing With new Split
qplot(data=merged, x=Internet.users, y=Birth.rate)
qplot(data=merged, x=Internet.users, y=Birth.rate,
      colour=Region)

#1. Shapes 
qplot(data=merged, x=Internet.users, y=Birth.rate,
      colour=Region, shape=I(15))

#2. Transparency
qplot(data=merged, x=Internet.users, y=Birth.rate,
      colour=Region, shape=I(19),
      alpha=I(0.5))
#3. Title
qplot(data=merged, x=Internet.users, y=Birth.rate,
      colour=Region, shape=I(15),
      alpha=I(0.5),
      main= "Birth Rate vs Internet Users")




























