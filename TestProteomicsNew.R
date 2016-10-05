#==========================================================================#
# File for Reading in Proteomics Data & Applying Correct Headers
# Created by Rachel Johnson 09/07/2016
# Last updated by Rachel Johnson 09/22/2016
#==========================================================================#


#Read in data
setwd("C:/Users/johnsra3/Documents/Projects/Project_Proteomics")
#Open data in Excel (File>Open>Browse>All Files, not just Excel files),
  #then save it as a .csv
data <- read.csv("TestFile.csv", header = FALSE)

#Remove nonsense information and blanks from beginning of data set
readnoheads <- data[!data$V1 == "",]
row <- which(readnoheads$V1 == "^TABLE_BEGIN")
readnoheads <- readnoheads[-c(1:row),]

#Extract current column names found in row 1 of readnoheads and remove blanks
colnames <- readnoheads[1,]
colnames <- colnames[!sapply(colnames, function(x) all(x == ""))]

#Extracts headings from test and removes blank columns at beginning
headings <- data[data$V1 == "",]
headings <- headings[!sapply(headings, function(x) all(x == ""))]

#Choose heading type that you want to use, these can be found in headings[,1]
#***THESE HEADINGS DEPEND ON YOUR DATA SET; NEED TO LOOK THROUGH TO DETERMINE  
  #WHICH ROW CONTAINS YOUR DESIRED HEADINGS***

#For example, we want to select TargetFullName as the desired column names
TargetFullName <- headings[3,] 
allcolnames <- cbind(colnames, TargetFullName) 

#Combine all column names with observations
readnoheads[1,] <- allcolnames
names(readnoheads) = as.character(unlist(readnoheads[1,]))
readnoheads <- readnoheads[-1,]
View(readnoheads)










