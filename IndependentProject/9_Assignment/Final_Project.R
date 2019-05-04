# __title__ Computational Biology Assignment 9 Final Project
# __author__ Deanna Payne
# __date__ 4/23/2019

library(dplyr)
setwd("~/CompBio/CompBioLabsAndHomework/IndependentProject/9_Assignment")

RawMiceData <- read.csv("MLBS2016_2018.csv")
MiceData_noblood <- subset(RawMiceData[,1:108])
names(MiceData_noblood) ####double check blood categories are excluded

MiceData <- subset(MiceData_noblood, capture.info =="cap" & days.since.previous.treatment.ctl !="NA" & days.since.previous.treatment.ctl !="0" & Body !="NA")

#Subsets: By Species
P.maniculatus <- subset(MiceData, Species == "PM")
P.leucopus <- subset(MiceData, Species == "PL")

#Creating BCI category
##Body Condition using Scaled Mass Index[Mi] = Mindv* (MeanL/Lindv)^(b.sma)

###Mean body length [MeanL]
MeanL_PM_total <- mean(c(P.maniculatus$Body))
MeanL_PL_total <- mean(c(P.leucopus$Body))

###P.leucopus individuals
ln.PL_Mass <- log(P.leucopus$Weight..g.)
ln.PL_Length <- log(P.leucopus$Body)

PL_b.ols <- coef(lm(ln.PL_Mass ~ ln.PL_Length))
PL_b.ols <- PL_b.ols[2]
PL_r <- cor(ln.PL_Mass, ln.PL_Length)
PL_b.sma <- PL_b.ols/PL_r

####Assigning BCI to each individual based on P.leucopus species average body length
P.leucopus <- within(P.leucopus, BCI_total <- P.leucopus$Weight..g.*(MeanL_PL_total/P.leucopus$Body)^PL_b.sma)
names(P.leucopus)[109] ####double check creation of new column BCI
head(P.leucopus$BCI_total) ####double check that each individual has unique BCI as described by their independent body length and weight variables.

###P.maniculatus individuals
ln.PM_Mass <- log(P.maniculatus$Weight..g.)
ln.PM_Length <- log(P.maniculatus$Body)

PM_b.ols <- coef(lm(ln.PL_Mass ~ ln.PL_Length))
PM_b.ols <- PM_b.ols[2]
PM_r <- cor(ln.PM_Mass, ln.PM_Length)
PM_b.sma <- PM_b.ols/PM_r

####Assigning BCI to each individual based on P.maniculatus species average body length
P.maniculatus <- within(P.maniculatus, BCI_total <- P.maniculatus$Weight..g.*(MeanL_PM_total/P.maniculatus$Body)^PM_b.sma)
names(P.maniculatus)[109] ####double check creation of new column BCI
head(P.maniculatus$BCI_total) ####double check that each individual has unique BCI as described by their independent body length and weight variables.

#ANOVA Analysis
## Confirming siginficant relationship of BCI to Sex and Age
PL_Check_w.categorical <- aov(BCI_total~Sex*Age, data = P.leucopus)
print(summary(PL_Check_w.categorical))
PL_Check_wo.categorical <- aov(BCI_total~Sex+Age, data = P.leucopus)
print(summary(PL_Check_wo.categorical))
print(anova(PL_Check_w.categorical, PL_Check_wo.categorical))

PM_Check_w.categorical <- aov(BCI_total~Sex*Age, data = P.maniculatus)
print(summary(PM_Check_w.categorical))
PM_Check_wo.categorical <- aov(BCI_total~Sex+Age, data = P.maniculatus)
print(summary(PM_Check_wo.categorical))
print(anova(PM_Check_w.categorical, PM_Check_wo.categorical))

##Subset By Age and Class
###P.maniculatus
PM_Adults <- subset(P.maniculatus, Age == "A")

PM_SubAdults <- subset(P.maniculatus, Age =="SA")
tally(PM_SubAdults)

PM_SubAdults_2.3 <- subset(P.maniculatus, Age =="SA" & Class =="2.3")
tally(PM_SubAdults_2.3)
PM_SubAdults_2.6 <- subset(P.maniculatus, Age =="SA" & Class =="2.6")
tally(PM_SubAdults_2.6)
PM_SubAdults_2.9 <- subset(P.maniculatus, Age =="SA" & Class =="2.9")
tally(PM_SubAdults_2.9)

PM_Juvenile <- subset(P.maniculatus, Age =="J")
tally(PM_Juvenile)
###P.leucopus

PL_Adults <- subset(P.leucopus, Age == "A")

PL_SubAdults <- subset(P.leucopus, Age =="SA")
tally(PL_SubAdults)

PL_SubAdults_2.3 <- subset(P.leucopus, Age =="SA" & Class =="2.3")
tally(PL_SubAdults_2.3)
PL_SubAdults_2.6 <- subset(P.leucopus, Age =="SA" & Class =="2.6")
tally(PL_SubAdults_2.6)
PL_SubAdults_2.9 <- subset(P.leucopus, Age =="SA" & Class =="2.9")
tally(PL_SubAdults_2.9)

PL_Juvenile <- subset(P.leucopus, Age =="J")
tally(PL_Juvenile)
####Number of Observations: abbr No.Obsv
#####P. maniculatus
c(tally(PM_Adults), tally(PM_SubAdults), tally(PM_Juvenile))
#####P. leucopus
c(tally(PL_Adults), tally(PL_SubAdults), tally(PL_Juvenile))

##Allindv P.maniculatus 
### Total Intestinal Parasites (aka Total Endoparasites "EndoTots") 
PM_EndoTots_w.categorical <- aov(BCI_total~Endo.Total.Egg.g*Treated.or.control , data = P.maniculatus)
print(summary(PM_EndoTots_w.categorical))

PM_EndoTots_wo.categorical <- aov(BCI_total~Endo.Total.Egg.g+Treated.or.control  , data = P.maniculatus)
print(summary(PM_EndoTots_wo.categorical))

print(anova(PM_EndoTots_w.categorical, PM_EndoTots_wo.categorical))

###Species of Intestinal Parasites (aka types of Endoparasites "Endotypes")
PM_Endotypes_w.categorical <- aov(BCI_total~Cocc.Egg.g*Nem.Egg.g*Cestode.Egg.g*Treated.or.control , data = P.maniculatus)
print(summary(PM_Endotypes_w.categorical))

PM_Endotypes_wo.categorical <- aov(BCI_total~Cocc.Egg.g+Nem.Egg.g+Cestode.Egg.g+Treated.or.control  , data = P.maniculatus)
print(summary(PM_Endotypes_wo.categorical))

print(anova(PM_Endotypes_w.categorical, PM_Endotypes_wo.categorical))

##All indv P.maniculatus 
### Total Intestinal Parasites (aka Total Endoparasites "EndoTots") 
PL_EndoTots_w.categorical <- aov(BCI_total~Endo.Total.Egg.g*Treated.or.control, data = P.leucopus)
print(summary(PL_EndoTots_w.categorical))

PL_EndoTots_wo.categorical <- aov(BCI_total~Endo.Total.Egg.g+Treated.or.control, data = P.leucopus)
print(summary(PL_EndoTots_wo.categorical))

print(anova(PL_EndoTots_w.categorical, PL_EndoTots_wo.categorical))

###Species of Intestinal Parasites (aka types of Endoparasites "Endotypes")
PL_Endotypes_w.categorical <- aov(BCI_total~Cocc.Egg.g*Nem.Egg.g*Cestode.Egg.g*Treated.or.control, data = P.leucopus)
print(summary(PL_Endotypes_w.categorical))

PL_Endotypes_wo.categorical <- aov(BCI_total~Cocc.Egg.g+Nem.Egg.g+Cestode.Egg.g+Treated.or.control, data = P.leucopus)
print(summary(PL_Endotypes_wo.categorical))

print(anova(PL_Endotypes_w.categorical, PL_Endotypes_wo.categorical))

##ANOVA: Individuals PL seperated by Age
###P.leucopus Adults
PL_EndoTots_w.categorical_Adults <-aov(BCI_total~Endo.Total.Egg.g*Treated.or.control, data = PL_Adults)
print(summary(PL_EndoTots_w.categorical_Adults))
PL_EndoTots_wo.categorical_Adults <-aov(BCI_total~Endo.Total.Egg.g+Treated.or.control, data = PL_Adults)
print(summary(PL_EndoTots_wo.categorical_Adults))
anova(PL_EndoTots_w.categorical_Adults, PL_EndoTots_wo.categorical_Adults)

PL_Endotypes_w.categorical_Adults <- aov(BCI_total~Cocc.Egg.g*Nem.Egg.g*Cestode.Egg.g*Treated.or.control, data = PL_Adults)
print(summary(PL_Endotypes_w.categorical_Adults))
PL_Endotypes_wo.categorical_Adults <- aov(BCI_total~Cocc.Egg.g+Nem.Egg.g+Cestode.Egg.g+Treated.or.control, data = PL_Adults)
print(summary(PL_Endotypes_wo.categorical_Adults))
anova(PL_Endotypes_w.categorical_Adults, PL_Endotypes_wo.categorical_Adults)

###P.leucopus SubAdults
PL_EndoTots_w.categorical_SubAdults <-aov(BCI_total~Endo.Total.Egg.g*Treated.or.control, data = PL_SubAdults)
print(summary(PL_EndoTots_w.categorical_SubAdults))
PL_EndoTots_wo.categorical_SubAdults <-aov(BCI_total~Endo.Total.Egg.g+Treated.or.control, data = PL_SubAdults)
print(summary(PL_EndoTots_wo.categorical_SubAdults))
anova(PL_EndoTots_w.categorical_SubAdults, PL_EndoTots_wo.categorical_SubAdults)

PL_Endotypes_w.categorical_SubAdults <- aov(BCI_total~Cocc.Egg.g*Nem.Egg.g*Cestode.Egg.g*Treated.or.control, data = PL_SubAdults)
print(summary(PL_Endotypes_w.categorical_SubAdults))
PL_Endotypes_wo.categorical_SubAdults <- aov(BCI_total~Cocc.Egg.g+Nem.Egg.g+Cestode.Egg.g+Treated.or.control, data = PL_SubAdults)
print(summary(PL_Endotypes_wo.categorical_Adults))
anova(PL_Endotypes_w.categorical_SubAdults, PL_Endotypes_wo.categorical_SubAdults)

##P.leucopus Juveniles
PL_EndoTots_w.categorical_Juveniles <-aov(BCI_total~Endo.Total.Egg.g*Treated.or.control, data = PL_Juvenile)
print(summary(PL_EndoTots_w.categorical_Juveniles))
PL_EndoTots_wo.categorical_Juveniles <-aov(BCI_total~Endo.Total.Egg.g+Treated.or.control, data = PL_Juvenile)
print(summary(PL_EndoTots_wo.categorical_Juveniles))
anova(PL_EndoTots_w.categorical_Juveniles, PL_EndoTots_wo.categorical_Juveniles)

PL_Endotypes_w.categorical_SubAdults <- aov(BCI_total~Cocc.Egg.g*Nem.Egg.g*Cestode.Egg.g*Treated.or.control, data = PL_SubAdults)
print(summary(PL_Endotypes_w.categorical_SubAdults))
PL_Endotypes_wo.categorical_SubAdults <- aov(BCI_total~Cocc.Egg.g+Nem.Egg.g+Cestode.Egg.g+Treated.or.control, data = PL_SubAdults)
print(summary(PL_Endotypes_wo.categorical_SubAdults))
anova(PL_Endotypes_w.categorical_SubAdults, PL_Endotypes_wo.categorical_SubAdults)


##Graphs

PL_Graph1_BCI.EndoTot <- ggplot(P.leucopus, aes(x=Endo.Total.Egg.g, y=BCI_total, col = as.factor (Age))) + geom_point()+ xlim(0, 50000) + ggtitle("Graph1: P.leucopus~ BCI v EndoTot") + xlab("Total Endoparasites (per gram feces)") + ylab("BCI")
PL_Graph1_BCI.EndoTot
PL_Graph1_BCI.EndoTot_Zoom1 <- ggplot(P.leucopus, aes(x=Endo.Total.Egg.g, y=BCI_total, col = as.factor (Age))) + geom_point() + xlim(0, 50000) + ggtitle("Graph1: P.leucopus~ BCI v EndoTot") + xlab("Total Endoparasites (per gram feces)") + ylab("BCI")
PL_Graph1_BCI.EndoTot_Zoom1


PL_Graph2_BCI.Nem <- ggplot(P.leucopus, aes(x=Nem.Egg.g, y=BCI_total, col = as.factor (Treated.or.control)))+ geom_point()+ xlim(0, 15000) + ggtitle("Graph2: P.leucopus~ BCI v Nematodes") + xlab("Total Nematodes (per gram feces)") + ylab("BCI")
PL_Graph2_BCI.Nem
PL_Graph2_BCI.Nem_Zoom1 <- ggplot(Graph3, aes(x=Nem.Egg.g, y=BCI_total, col = as.factor (Treated.or.control)))+ geom_point()+ xlim(0, 5000) + ggtitle("Graph2: P.leucopus~ BCI v Nematodes") + xlab("Total Nematodes (per gram feces)") + ylab("BCI")
PL_Graph2_BCI.Nem_Zoom1
PL_Graph2_BCI.Nem_Zoom2 <- ggplot(Graph3, aes(x=Nem.Egg.g, y=BCI_total, col = as.factor (Treated.or.control)))+ geom_point()+ xlim(0, 1000) + ggtitle("Graph2: P.leucopus~ BCI v Nematodes") + xlab("Total Nematodes (per gram feces)") + ylab("BCI")
PL_Graph2_BCI.Nem_Zoom2
