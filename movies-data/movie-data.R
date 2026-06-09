#importing the data ----------------------
getwd()
setwd("/Users/nicolstewart/Desktop/courses/r/SECTION 6/Section 6 - Advanced Visualization With GGPlot2")
getwd()

movies <- read.csv("Section6-Homework-Data.csv")

#activating package: ggplot2
install.packages("ggplot2")
library(ggplot2)

#exploring the data --------------------
head(movies)
str(movies)
summary(movies)

#renaming columns ----------------------
colnames(movies) <- c("Day-Of-Week", "Director", "Genre", "MovieTitle", "ReleaseDate", "Studio", "AdjGrossMill", "BudgetMillions", "GrossMillions", "IMDbRating", "MovieLensRating", "OverseasMillions", "OverseasP", "ProfitMillions", "ProfitP", "Runtime", "USMillions", "GrossUSP") #P = percentage
str(movies)

#filtering the data frame #first filter
filter <- (movies$Genre =="action") | (movies$Genre == "adventure") | (movies$Genre == "animation") | (movies$Genre == "comedy") | (movies$Genre == "drama")

#second filter (another approach as above)
filter2 <- movies$Studio %in% c("Buena Vista Studios", "Sony", "Paramount Pictures", "Fox", "WB", "Universal")


movies2 <- movies[filter & filter2,] 

#preparing the plot's data and aesthetic layers

p <- ggplot(data=movies2, aes(x=Genre, y=GrossUSP))

#adding geometries 
q <- p + 
  geom_jitter(aes(size=BudgetMillions, colour=Studio), size=1) +
  geom_boxplot(alpha=0.7, outlier.color = NA)

#non-data ink
q <- q +
  xlab("Genre") +
  ylab("Gross % US") +
  ggtitle("Domestic Gross % by Genre")

#theme 
q <- q +
  theme(
    axis.title.x = element_text(colour="Blue", size=10),
    axis.title.y = element_text(colour="Blue", size=10),
    axis.text.x = element_text(size=10),
    axis.text.y = element_text(size=10),
    
    plot.title = element_text(size=20),
    
    legend.title = element_text(size=10),
    legend.text = element_text(size=10),
    legend.background = element_rect(colour="Gray")
    
  )

q


?theme



