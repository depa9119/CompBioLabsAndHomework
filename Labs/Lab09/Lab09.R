#Deanna Payne
#Lab 09: Parsing Data

###I am sorry I came to lab late, I went to the NARF conference in Wolf Law and the keynote speaker went over...then I had to walk from Wolf Law

##Problem1
setwd("~/CompBio/compBioSandbox/CompBio_on_git/Datasets/Cusack_et_al/")
camData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)

DateTime <- camData$DateTime
trialDateTime <- DateTime[1:5]

origformat <- strptime(trialDateTime, format = "%d/%m/%Y %H:%M")
myday <- strptime("20/10/2013 01:00", format = "%d/&m/%Y %H:%M")

#read as mo/day/yr (without century or time)
origformatvector <- c(origformat)

date1 <- as.Date.numeric(origformatvector, "%m/%d/%Y")
date1
# ^above is failure because error: character string is not in a standard unambiguous format. wth
## given as a complicated list of date time object instead of string

date2 <- c(format(as.Date(origformat, format= "%m/%d/%Y")))
date2
# ^above is failure because string gives y/mo/day