#title: Lab04 
#author: Deanna Payne
#date: 2/8/2019


##Part 1: Practice writing "for loops"
#1_print 'hi' to the console 10 times

for (i in seq(1,10))
  print("hi")

#2. amt little timmy has after 8 weeks

piggybank <- 10
allowance <- 5
gumcost <- 1.34
expenses <- 2 * gumcost

for ( i in seq(1,8)) {
  piggybank <- piggybank + allowance - expenses
  print(piggybank)}

#3 wild animal population shinkage after 7 years
shinkage <- .05
currentpopulation <- 2000

for ( i in seq(1,7)) {
  currentpopulation <- currentpopulation - (currentpopulation * shinkage)
  print(currentpopulation)}
  
#4

time <- seq(1:12)
#^year if a loop is equivalent to seq(1,12)
K <- 10000
#^pop carrying capacity
r <- .8
#^instrisic growth rate
population1 <- 2500
#^ n[1] initial population size at first time  = 2500

# n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )
# n[1] = n[0] + .8 * n[0] * (10000-n[0]/10000) = 2500
# n[0] + .8n[0] * ((10000/10000) * (-n[0]/10000)) = 2500
# 1n[0] + .8n[0] * (1 * (-n[0]/10000)) = 2500
# 1n[0] + .8 n[0] -.8 ((n[0]^2) /10000) = 2500
# (-.8/10000) n[0]^2 + 1.8 n[0] -2500 = 0
# quadratic formula : n[0] = 1487.19 or 21012.8 since it is a positive growth rate population increases each year indicating 1487.19 < 2500
population <- 1487.19

# prediction population12 ~ super close to the carrying capacity because of large (almost 1) growth rate~ 10000

for (i in seq(1,12)) {
  population <- population +  r * population * ((K - population)/K)
  print(population)
  }


##Part 2: Practice writing “for loops” AND practice storing the data produced by your loops in arrays.

#5a "rep" command of repeating 0s
a5 <- rep(0, 18)
a5

#5b: have sequence increase by 3
for (a5 in seq(1:18)) {
  a5 <- a5 * 3
  print(a5)
}

#5c: change the first digit in the sequence
a5 <- rep (0, 18)
c5 <- rep (1, 1)
line5c <- c(c5, a5)
line5c

#5c: 2nd try_ change the first digit in the sequence
c5 <- rep (0, 18)
c5[1] <- 1
c5

#5d: loop for [1 + (2 * previous entry)]
for (i in seq(2,18)) {
  c5[i] <- (1+ (2 * c5[i-1]))
  print(c5)
}

show(c5)

#6 fibonacci sequence
fib <- rep_len(1, 20)
fib[1] <- 0
fib[2] <- 1
fib

for(i in 3:20) {
  fib[i] <- fib[i-1] + fib[i-2]
  print(fib[i])
}

#7 Plot Question 4
#name vectors, time = years & abundance = population

abundance <- c(2500.003,
               4000.005,
               5920.005,
               7852.293,
               9201.447,
               9789.274,
               9954.302,
               9990.693,
               9998.132,
               9999.626,
               9999.925,
               9999.985)
plot(time , abundance)

