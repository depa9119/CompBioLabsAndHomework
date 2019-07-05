# Lab08 Metadata

## 1. Complete markdown tutorial
Markdown tutorial walks user through basic functions of how to design text on a markdown (.md) file. Specifically how to alter text to appear different on the audience's screen or to have practical use.
For example:
1. _italics_
2. **bolding**
3. links
4. images
5. block quotes
6. paragraph breaks
6. bullet lists
7. numbered lists

## 2. Replace old README (.txt) file with a (.md) file
### Why markdown (.md)?
* easy syntax
 *  easier to add different types of emphasis
 *  user friendly to organization
* fast
* clean (quickly formats to HTML)
* portable = cross-platform
### Why plain text (.txt) ?
* no compatibility issues: no special application needed to read text files
* no/few updates: you do not have to relearn how to write in plain text
* flexible: supported by all machine types and throughout internet programs/websites

## 3. Discrete Time Logisitic Growth Model
Taking old coding from Lab04 (a lab designed to teach writing loops), rewrite to achieve same results but instead design a new function.

#141 creation of new function name = "logisticGrowthModel" requiring four arguements
* 'r' intrinsic growth rate
* 'K' carrying capacity
* 'population' starting population size
* 'generations' passage of time or how many generations

#142 creation of new variable **abundance** that creates string of the same number (**population**) repeating specified length of instances (**generations**)

#143 start of for loop of number of instances defined by generation time
#144 overwriting population (i.e. creation of a new population) with previously provided equation used to find exponential growth of a population as defined by included variables
* **population**
* **r**
* **K**

_the overwriting of the population is necessary to find the next population size (n+1) using the previous population size(n) so as to show population of growth over time_

#145 new population (n+1) is assigned to new variable= **abundance** for instances of vector [i] in loop

#147 plot is created using pasage of time (**generations**) on x axis and change in population size (**abundance**) over time on y axis

#148 data table is created with calculated **generations** associated with their defined **abundance**

#149 working directory is set to store where the #148 data set will be sent to and saved in
#150 a csv file is written using table defined in #148 and named "Lab08.csv"

#151 return abundance so as to be read **abundance** data in R console
