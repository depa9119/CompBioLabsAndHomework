# __title__ Computational Biology Assignment 9 Final Project
# __author__ Deanna Payne
# __date__ 4/23/2019

library(dplyr)
setwd("~/CompBio/CompBioLabsAndHomework/IndependentProject/9_Assignment")

RawMiceData <- read.csv("MLBS2016_2018.csv")
MiceData_noblood <- subset(RawMiceData[,1:108])
names(MiceData_noblood)

MiceData <- subset(MiceData_noblood, capture.info =="cap" & days.since.previous.treatment.ctl !="NA" & days.since.previous.treatment.ctl !="0" & Body !="NA")

#Subsets
##By Species
P.maniculatus <- subset(MiceData, Species == "PM")
P.leucopus <- subset(MiceData, Species == "PL")
##P.maniculatus: By Gender & Age
###Males
PM_MiceData_Males <- subset(P.maniculatus, Sex =="M")
PM_Male_Adults <- subset(P.maniculatus, Sex =="M" & Age =="A")

PM_Male_SubAdults <- subset(P.maniculatus, Sex =="M" & Age =="SA")

PM_Male_SubAdults_2.3 <- subset(P.maniculatus, Sex =="M" & Age =="SA" & Class =="2.3")
tally(PM_Male_SubAdults_2.3)
PM_Male_SubAdults_2.6 <- subset(P.maniculatus, Sex =="M" & Age =="SA" & Class =="2.6")
tally(PM_Male_SubAdults_2.6)
PM_Male_SubAdults_2.9 <- subset(P.maniculatus, Sex =="M" & Age =="SA" & Class =="2.9")
tally(PM_Male_SubAdults_2.9)

PM_Male_Juvenile <- subset(P.maniculatus, Sex =="M" & Age =="J")

###Females
PM_MiceData_Females <- subset(P.maniculatus, Sex =="F")
PM_Female_Adults <- subset(P.maniculatus, Sex =="F" & Age =="A" & Pregnant != "Y" & Pregnant != "Y?")

PM_Female_SubAdults <- subset(P.maniculatus, Sex =="F" & Age =="SA")
tally(PM_Female_SubAdults)

PM_Female_SubAdults_2.3 <- subset(P.maniculatus, Sex =="F" & Age =="SA" & Class =="2.3")
tally(PM_Female_SubAdults_2.3)
PM_Female_SubAdults_2.6 <- subset(P.maniculatus, Sex =="F" & Age =="SA" & Class =="2.6")
tally(PM_Female_SubAdults_2.6)
PM_Female_SubAdults_2.9 <- subset(P.maniculatus, Sex =="F" & Age =="SA" & Class =="2.9")
tally(PM_Female_SubAdults_2.9)

PM_Female_Juvenile <- subset(P.maniculatus, Sex =="F" & Age =="J")

##P.leucopus: By Gender & Age
###Males
PL_MiceData_Males <- subset(P.leucopus, Sex =="M")
PL_Male_Adults <- subset(P.leucopus, Sex =="M" & Age =="A")

PL_Male_SubAdults <- subset(P.leucopus, Sex =="M" & Age =="SA")

PL_Male_SubAdults_2.3 <- subset(P.leucopus, Sex =="M" & Age =="SA" & Class =="2.3")
tally(PL_Male_SubAdults_2.3)
PL_Male_SubAdults_2.6 <- subset(P.leucopus, Sex =="M" & Age =="SA" & Class =="2.6")
tally(PL_Male_SubAdults_2.6)
PL_Male_SubAdults_2.9 <- subset(P.leucopus, Sex =="M" & Age =="SA" & Class =="2.9")
tally(PL_Male_SubAdults_2.9)

PL_Male_Juvenile <- subset(P.leucopus, Sex =="M" & Age =="J")

###Females
PL_MiceData_Females <- subset(P.leucopus, Sex =="F")
PL_Female_Adults <- subset(P.leucopus, Sex =="F" & Age =="A" & Pregnant != "Y" & Pregnant != "?")

PL_Female_SubAdults <- subset(P.leucopus, Sex =="F" & Age =="SA")

PL_Female_SubAdults_2.3 <- subset(P.leucopus, Sex =="F" & Age =="SA" & Class =="2.3")
tally(PL_Female_SubAdults_2.3)
PL_Female_SubAdults_2.6 <- subset(P.leucopus, Sex =="F" & Age =="SA" & Class =="2.6")
tally(PL_Female_SubAdults_2.6)
PL_Female_SubAdults_2.9 <- subset(P.leucopus, Sex =="F" & Age =="SA" & Class =="2.9")
tally(PL_Female_SubAdults_2.9)

PL_Female_Juvenile <- subset(P.leucopus, Sex =="F" & Age =="J")

###Number of Observations: abbr No.Obsv
####P. maniculatus
c(tally(PM_Male_Adults), tally(PM_Male_SubAdults), tally(PM_Male_Juvenile))
c(tally(PM_Female_Adults), tally(PM_Female_SubAdults), tally(PM_Female_Juvenile))
####P. leucopus
c(tally(PL_Male_Adults), tally(PL_Male_SubAdults), tally(PL_Male_Juvenile))
c(tally(PL_Female_Adults), tally(PL_Female_SubAdults), tally(PL_Female_Juvenile))


##P.maniculatus mean body length [MeanL]
MeanL_PM_Male_Adults <- mean(c(PM_Male_Adults$Body))
MeanL_PM_Male_SubAdults <- mean(c(PM_Male_SubAdults$Body))
MeanL_PM_Male_Juveniles <- mean(c(PM_Male_SubAdults$Body))

MeanL_PM_Female_Adults <- mean(c(PM_Female_Adults$Body))
MeanL_PM_Female_SubAdults <- mean(c(PM_Female_SubAdults$Body))
MeanL_PM_Female_Juveniles <- mean(c(PM_Female_Juveniles$Body))

##P.leucopus mean body length [MeanL]
MeanL_PL_Male_Adults <- mean(c(PL_Male_Adults$Body))
MeanL_PL_Male_SubAdults <- mean(c(PL_Male_SubAdults$Body))
MeanL_PL_Male_Juveniles <- mean(c(PL_Male_SubAdults$Body))

MeanL_PL_Female_Adults <- mean(c(PL_Female_Adults$Body))
MeanL_PL_Female_SubAdults <- mean(c(PL_Female_SubAdults$Body))
MeanL_PL_Female_Juveniles <- mean(c(PL_Female_Juveniles$Body))

#Equation: BCI = Weight..g.*(meanL/Body.num)^b
###MiceData_Body.num <- within(MiceData, Body.num <- ???)
###MiceData_BCI <- within(MiceData_Body.num, BCI <- Weight..g.*(meanL/Body.num)^b)
