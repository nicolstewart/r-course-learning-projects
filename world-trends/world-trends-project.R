
#Importing the files 
getwd()
setwd("/Users/nicolstewart/Desktop/courses/r/SECTION 5/Section 5 - Data Frames")
getwd()
country_data <- read.csv("S5-Homework-Data.csv")
country_data

#turning numeric variable into factor:
country_data$Year
temp <- factor(country_data$Year)
temp
levels(temp)

#Splitting the data frame into two (1960 & 2013) by filtering the data frame
data_1960 <- country_data[country_data$Year == 1960,]
data_2013 <- country_data[country_data$Year == 2013,]

nrow(data_1960) #187 entries
nrow(data_2013) #187 entries 

#creating the additional data frames
add_1960 <- data.frame(Code=Country_Code, Life.Exp=Life_Expectancy_At_Birth_1960)
add_2013 <- data.frame(Code=Country_Code, Life.Exp=Life_Expectancy_At_Birth_2013)

#checking the summaries
summary(add_1960)
summary(add_2013)

#merging the pairs
merged_data_1960 <- merge(data_1960, add_1960, by.x="Country.Code", by.y="Code")
merged_data_2013 <- merge(data_2013, add_2013, by.x="Country.Code", by.y="Code")

#checking new structures 
str(merged_data_1960)
str(merged_data_2013)

#removing obsolete column
merged_data_1960$Year <- NULL
merged_data_2013$Year <- NULL
nullfile()

#visualizing the data set
library(ggplot2)

qplot(data=merged_data_1960, x=Fertility.Rate, y=Life.Exp,
      colour=Region,
      size=I(1),
      alpha=I(0.6),
      main="Life Expectancy vs Fertility Rate (1960)")

qplot(data=merged_data_2013, x=Fertility.Rate, y=Life.Exp,
      colour=Region,
      size=I(1),
      alpha=I(0.6),
      main="Life Expectancy vs Fertility Rate (2013)")











