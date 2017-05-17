#Check working
getwd()

#Ensure packages are loaded "readr" "Rcpp" "lme4" "brms"

#Load libraries needed for analysis:
library("tidyr")
library("dplyr")
library("lme4")
library("brms")

#Load data
library(readr)
sn <- read_csv("~/Dropbox/WORK/Research/Snare Surveys/Analysis/Snare Analysis/snares_expt.csv")


##############################################################################################

# How to create one large dataset from several smaller sn/sq level datsets

Sn_Loc <- read.csv("~/Dropbox/WORK/Research/Snare Surveys/Analysis/R/SnareAnalysis/Sn_Loc.csv")

#Replace csv with data table, using gather function from tidyr package
Sn_Loc <- gather(Sn_Loc, "tm.det", "det", 14:17, na.rm = TRUE)


#Add in search effort 
Sn_Loc$eff <- c(90,90,15,15,75,75,30,30,60,60,45,45)[Sn_Loc$sq]

#To create/save as a csv:
write.csv(x = Sn_Loc, file = "snares_expt.csv", row.names = FALSE) ]

#where:
# x =   means use this data source
# file =  save the file under this name
# row.names = FALSE   dont include column for row numbers in csv


