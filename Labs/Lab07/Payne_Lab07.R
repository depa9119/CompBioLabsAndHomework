#title: Lab07
#author: Deanna Payne
#date: 3/1/2019
Sys.time()

#Problem1: Triangle Area

##basic way
base <- 10
height <- 9
triangleArea <- 0.5 * base * height
show(triangleArea)

##function way
triangleArea <- function(base, height) {
  myarea <- 0.5 * base * height
  return(myarea)
}

triangleArea(10, 9)

#Problem2: Absolute Value

##already existing function
ex1 <- 5
abs(ex1)
show(ex1)

ex2 <- -2.3
abs(ex2)
show(ex2)

ex3 <- c(1.1, 2, 0, -4.3, 9, -12)
abs(ex3)
show(abs(ex3))

##create function like abs()
### 'a' acts as a variable to which the coding refers to like 'i'

###Opt1: must include for loop for a vector not neccessary for single scalar value
myAbs1 <- function(a) {
  for (i in 1:length(a)){
      if (a[i] < 0) {
        a[i] <- a[i] * (-1)
      }
    }
  return(a)
}

myAbs1(ex1)
myAbs1(ex2)
myAbs1(ex3)

###Opt2: cheater way
myAbs2 <- function (a) {
  ifelse(a>=0, a, (a * (-1)))
}

myAbs2(ex1)
myAbs2(ex2)
myAbs2(ex3)

#Problem3:Fibonacci

##LAB04 Review
###OLD_start with 1
fibOLD <- rep_len(1, 20)

for(i in 3:20) {
  fibOLD[i] <- fibOLD[i-1] + fibOLD[i-2]
  print(fibOLD[i])
}

###MODERN_start at 0
fibNEW <- rep_len(1, 20)
fibNEW[1] <- 0
fibNEW

for(i in 3:20) {
  fibNEW[i] <- fibNEW[i-1] + fibNEW[i-2]
  print(fibNEW[i])
}

##Fibonacci Function
###n=start number
###s=length of sequence

fibfx <- function(n, s) {
  fib <- rep_len(0, s)
  fib[2] <- 1
  fib[1] <- n
  for(i in 3:s) {
    fib[i] <- fib[i-1] + fib[i-2]
  }
  return(fib)
}
fibfx(0, 20)
fibfx(1, 20)

#Problem 4
##4a_1: Function that takes two numbers as arguements
x <- 3
y <- 5
squarediff <- function(x, y) {
  function4 <- (x-y) ^ 2
  return(function4)
}
squarediff(x, y)
##4a_2: Function where first arguement is vector
x <- c(2, 4, 6)
y <- 4

squarediff(x, y)

##4b_1: create function to calculate average of a vector of numbers
z <- c(5, 15, 10)

calcAvg <- function(z) {
  meanZ <- sum(z)/length(z)
  return(meanZ)
}

calcAvg(z)

##4b_2: demonstrate your average function calling in data
setwd("~/CompBio/compBioSandbox/CompBio_on_git/Labs/Lab07/")
###importing data creates a data frame not a vector
dataLab07 <- read.csv("DataForLab07.csv")
###transformation from data frame to vector
dataLab07 <- dataLab07$x
calcAvg(dataLab07)

##4c: Sum of Squares use functions defined by 4a and 4b
###c4_1 for a data set, one calculates the mean
###c4_2 mean is subtracted from the data point
###c4_3 resulting difference is squared
###c4_4 squared differences are summed

####4a: squared differences between inputed vectors squarediff(x, y)
####4b: average vector calcAvg(z)

sumOfSquares_cheaterversion <- function(c4) {
  sum((c4 - mean(c4))^2)
}
sumOfSquares_cheaterversion(dataLab07)
#179442.4

sumOfSquares_with4bOnly <- function(c4) {
  b4Only <- sum(
    (c4 - calcAvg(c4))^2
  )
  return(b4Only)
}

sumOfSquares_with4bOnly(dataLab07)

sumOfSquares_with4a4b <- function(c4) {
  x <- dataLab07
  y <- calcAvg(c4)
  a4b4 <- sum(
    squarediff(x, y)
  )
  return(a4b4)
}

sumOfSquares_with4a4b(dataLab07)
