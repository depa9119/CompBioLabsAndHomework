#Lab01finalProblem.sh
#How could you, perhaps in multiple commands, make a new data file that had (i) only columns 2-4, (ii) the header row, and (iii) only the last 10 lines of data? In other words, what commands could you issue to create a new .csv file with 11 lines of data total and three columns total, in which the top line should be the original headers, and the other 10 lines should be the last 10 lines of the original data?

cut -f 2-4 -d , PredPreyData.csv | head -n 1 > NewPredPreyData.csv
##(i) only columns 2-4, (cut)
##(ii) the header row, (head -n 1)

cut -f 2-4 -d , PredPreyData.csv | tail >> NewPredPreyData.csv
##(iii) only the last 10 lines of data
