#Deanna Payne
#Lab12
#Friday April 12 2019


##Setup
setwd("~/CompBio/compBioSandbox/CompBio_on_git/Datasets/Cusack_et_al/")
camData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)
library(ggplot2)
library(tidyverse)


Species <- camData$Species
length(unique(camData$Species))
length(unique(Species))

allSpecies <- sort(unique(camData$Species))
list(allSpecies)
##Problem 1: make basic plot
plot1 <- ggplot(camData) + geom_bar(aes(Species))
##Problem 2: readable axis
plot2.1 <- ggplot(camData) + geom_bar(aes(Species)) + theme(axis.text.x = element_text(angle = 90))
plot2.2 <- plot1 + theme(axis.text.x = element_text(angle = 90))
##Problem3: flip and organize least to greatest count
###Doesn't Work, does not recognize plot2.1 which is weird... :(
plot3 <- camData %>%
  arrange(desc(Species)) %>%
  plot2.1 + coord_flip()
  
