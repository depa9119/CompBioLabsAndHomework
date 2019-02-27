#title: Lab05
#author: Deanna Payne
#date: 2/15/2019
Sys.time()



#Part1
##1.1 create x
x <- 22
if(x > 5) {
  print("result is larger than 5")
} else {
  print("result is smaller than 5")
}

##1.2 import "Vector1.csv"
setwd("~/CompBio/compBioSandbox/CompBio_on_git/Labs/Lab05/")
Vector1 <- read.csv("Vector1.csv")
Vector1.2a <- Vector1$x

##1.2a
for( i in 1:length(Vector1.2a)) {
  if ( Vector1.2a[i] < 0) {
    Vector1.2a[i] <- NA
  }
}

##1.2b. replace all those `NA` values with `NaN`
is.na(Vector1.2a)
Vector1.2a[is.na(Vector1.2a)] <- NaN
Vector1.2a

###or
Vector1.2b <- which(is.na(Vector1.2a))
####Vector1.2b gives POSITIONS for 'NA' values i.e. "TRUE" values that are NA
Vector1.2a[Vector1.2b] <- NaN
####^ asks all positions recognized by Vector1.2b to be changed to NaN within the overall Vector1.2a

##1.2c
Vector1.2c <- which(is.nan(Vector1.2a))
Vector1.2a[Vector1.2c] <- 0

##1.2d and 1.2e
###1.2e create a new vector of data that has all the values from the imported data that fall in the range between 50 and 100
FiftytoOneHundred <- subset(Vector1.2a, Vector1.2a >= 50 & Vector1.2a <=100)
###1.2d how many of the values from the imported data fall in the range between 50 and 100
length(FiftytoOneHundred)

##1.2f
setwd("/Users/deannagallegospayne/CompBio/CompBioLabsAndHomework/Labs/Lab05")
write.csv(x = FiftytoOneHundred, file = "FiftytoOneHundred")

##1.3
setwd("/Users/deannagallegospayne/CompBio/compBioSandbox/CompBio_on_git/Labs/Lab04")
CO2_data_cut_paste <- read.csv("CO2_data_cut_paste.csv")

##1.3a first year on "Gas" non-zero Emmissions
Gasnonzero <- subset(CO2_data_cut_paste, Gas >= 1)
show(Gasnonzero[1,1])

##1.3b During which years were "Total" emissions between 200 and 300 million metric tons of carbon?
TotalEmissions <- subset(CO2_data_cut_paste, Total >= 200 & Total <= 300)
show(TotalEmissions[1])

#Part2
#### n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1])
#####`n[t]` represents the abundance of prey at time `t`

#### p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])
#####`p[t]` the abundance of predators at time `t`. 

##2.1 set up parameters
totalGenerations <- 1000
initPrey <- 100 	# initial prey abundance at time t = 1
initPred <- 10		# initial predator abundance at time t = 1
a <- 0.01 		# attack rate
r <- 0.2 		# growth rate of prey
m <- 0.05 		# mortality rate of predators
k <- 0.1 		# conversion constant of prey into predators

##2.2 create a "time" vector, and make two additional vectors to store results, one for the values of `n` over time, and the other to store values of `p`.
time <- rep(1:1000)
###^ 1000 generations

prey <- rep_len(0, 1000)
prey[1] <- initPrey

pred <- rep_len(0, 1000)
pred[1] <- initPred

##2.3 Loop that implements calculations

for(t in seq (2 , 1000)) {
  prey[t] <- prey[t-1] + (r * prey[t-1]) - (a * prey[t-1] * pred[t-1])
  pred[t] <- pred[t-1] + (k * a * prey[t-1] * pred[t-1]) - (m * pred[t-1])
  if( pred[t] < 0) {
    pred[t] <- 0
  }
  if(prey[t] < 0) {
    prey[t] <- 0
  }
}


##2.5 plot  prey and predators over time
plot(time, prey)
lines(time, pred, col = "green")

##2.6 create a matrix of your results named "myResults" in which the first column is named "TimeStep", the second column is named "PreyAbundance", and the third column is named "PredatorAbundance".
myResults <- cbind(time, prey, pred)
colnames(myResults) <- c("TimeStep", "PreyAbundance", "PredatorAbundance")

##2.6 Write this matrix to a csv in your Lab05 working directory with the command `write.csv(x = myResults, file = "PredPreyResults.csv")`  
setwd("/Users/deannagallegospayne/CompBio/CompBioLabsAndHomework/Labs/Lab05")
write.csv(x = myResults, file = "PredPreyResults.csv")

