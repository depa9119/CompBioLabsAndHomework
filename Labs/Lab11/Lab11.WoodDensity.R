#Deanna Payne
#Lab11: Global Wood Density Database
#Friday April 5 2019

##Part I: Set Up
library(tidyverse)

setwd("/Users/deannagallegospayne/CompBio/CompBioLabsAndHomework/Labs/Lab11")
WoodData <- read.csv("GlobalWoodDensityDatabase.csv", stringsAsFactors = F)

###renamecolumn
colnames(WoodData)[4] <- "Wood.density"

##Part II: Working with Density Data

###4. Removing Rows with missing data

####a Which row is NA
####opt1
WoodData[is.na(WoodData$Wood.density), ]
####opt2
which(is.na(WoodData$Wood.density))

####b. Remove row
WoodData.noNA <- na.omit(WoodData)

###5. Dealing with one kind of pseudo-replication
WoodData.5.1 <- WoodData.noNA %>%
  group_by(Family, Binomial) %>%
  summarize(value = mean(Wood.density))

#####
WoodData.5.2 <- for( i in 1:length(WoodData.noNA)) {
  unique(WoodData.noNA$Binomial[i])
  WoodData.noNA$Wood.density <- mean(WoodData.noNA$Wood.density)
  }


#for( i in 1:length(Vector1.2a)) {
#  if ( Vector1.2a[i] < 0) {
#    Vector1.2a[i] <- NA
#  }
#}
