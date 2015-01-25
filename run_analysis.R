# Getting & Cleaning Data Course Project
#
# Operating Instructions
# 1. Copy run_analysis.R to your work directory
# 2. Load program: source("run_analysis.R")
# 3. Execute function: run()
# 4. Result file: "tydiData.csv"
#
# Package dependency: data.table
# To install data.table package: install.packages("data.table")

run <- function() {
    
    getRawData()
    
    activity <- getActivity("./UCI HAR Dataset/activity_labels.txt")
    
    features <- getFeatures("./UCI HAR Dataset/features.txt")
        
    test  <- createWorkData(
          features
        , activity
        , subject = readFile("./UCI HAR Dataset/test/subject_test.txt")
        , x = readFile("./UCI HAR Dataset/test/X_test.txt")
        , y = readFile("./UCI HAR Dataset/test/y_test.txt")
    )
    
    train <- createWorkData(
          features
        , activity
        , subject = readFile("./UCI HAR Dataset/train/subject_train.txt")
        , x = readFile("./UCI HAR Dataset/train/X_train.txt")
        , y = readFile("./UCI HAR Dataset/train/y_train.txt")
    )
    
    data <- rbind(test, train)
    
    #write.csv(data, "data.csv")
    
    tidyData <- data[, lapply(.SD, mean), by = .(subject,activity)]
    
    write.csv(tidyData, "tydiData.csv")
    
    TRUE
}



########################################################
###
### createWorkData function: Merge all tables in one
###
### Input Parameters: 
### Data Tables features, activity, subject, x, y.
### 'x' Data Table with all values in one column.
##  The column name must be 'V1' (default fread name)
###
### Return: Data Table with each value in one column.
### Column names and types are correct.
###
########################################################

createWorkData <- function(features, activity, subject, x, y) {
        
    x[,subject  := factor(subject$V1)]
    x[,activity := factor(activity[index == y$V1]$name)]
    
    columnLength <- 16
        
    qtdFeatures <- dim(features)[1]
    
    for(value in 1:qtdFeatures) {
        
        # Add measurement (feature value) with correct column name.
        x[, features[value]$name := as.numeric(substring(
            V1
            , ((features[value]$index - 1) * columnLength) + 1
            , features[value]$index * columnLength
        ))]
        
    }      
        
    x[, V1 := NULL]
    
    setkey(x, subject)
    
    setorder(x, subject, activity)
    
    x
}


########################################################
###
### getFeatures function
###
### Input Parameter: Path + File Name
###
### Return: only mean and standard deviation features
### Data Table with two columns (index and name)
### 
### Name value: 
### Contains alphanumeric chars and '_'. 
### All non alphanumeric chars are replaced with '_'
###
########################################################

getFeatures <- function(fullFileName) {
    
    require("data.table")
    
    df <- read.table(fullFileName)
    
    dt <- data.table(
        index = df$V1,
        name  = gsub("[^[:alnum:]]", "_", df$V2)
    )
    
    dt[grepl("mean|std", name, ignore.case=TRUE)]   
}



########################################################
###
### getActivity function
###
### Input Parameter: Path + File Name
###
### Return: Data Table with two columns (index and name) 
###
########################################################

getActivity <- function(fullFileName) {
    
    require("data.table")
    
    df <- read.table(fullFileName)
    
    data.table(
        index = df$V1,
        name  = df$V2
    )
       
}



########################################################
###
### readFile function is the fast way to read the values
###
### Input Parameter: Path + File Name
###
### Return: Data Table with all values in one column 
###
########################################################

readFile <- function(fullFileName) {

    require("data.table")
    
    fread(fullFileName
                  , header = FALSE
                  , sep = "\n"
                  , data.table = TRUE
                  , stringsAsFactors = FALSE
                  , showProgress = FALSE
                  , verbose = FALSE
    )
    
}


########################################################
###
### getRawData function: Download and unzip raw data.
###
########################################################

getRawData <- function() {
    
    zipFileName <- "getdata-projectfiles-UCI HAR Dataset.zip"
    
    if (!file.exists(zipFileName)) {
        
        download.file(
            url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
            , destfile = zipFileName
            , quiet = TRUE
            , mode = "wb"
        )
    }
    
    
    dataFolderName <- "UCI HAR Dataset"
    
    if (!file.exists(dataFolderName)) {
        # NOTE this works under windows 7, modify if nessesairy
        unzip(zipFileName)
    }
    
    TRUE
}



########################################################
###
### createWorkData_Prototype function: Test extract values.
### Explain the logic in didactical way.
###
### Extract the column values and convert to numeric.
###
### Input Parameters: 
### Data Tables features, activity, subject, x, y.
### 'x' Data Table with all values in one column.
##  The column name must be 'V1' (default fread name)
###
### Return: Data Table with each value in one column.
### Column names and types are correct.
###
########################################################

createWorkData_Prototype <- function(features, activity, subject, x, y) {
    
    x[,subject  := factor(subject$V1)]
    x[,activity := factor(activity[index == y$V1]$name)]
    
    columnLength <- 16
    
    x[, `:=` (
        meanX = as.numeric(substring(V1, 1, columnLength)), # 1 = index feature
        meanY = as.numeric(substring(V1, columnLength      + 1, columnLength * 2)),# 2=index feature
        meanZ = as.numeric(substring(V1,(columnLength * 2) + 1, columnLength * 3)),# 3=index feature
        stdX  = as.numeric(substring(V1,(columnLength * 3) + 1, columnLength * 4)),# 4=index feature
        stdY  = as.numeric(substring(V1,(columnLength * 4) + 1, columnLength * 5)),# 5=index feature
        stdZ  = as.numeric(substring(V1,(columnLength * 5) + 1, columnLength * 6)),# 6=index feature
        meanX2= as.numeric(substring(V1,(columnLength *40) + 1, columnLength *41)),#41=index feature
        meanY2= as.numeric(substring(V1,(columnLength *41) + 1, columnLength *42)),#42=index feature
        meanZ2= as.numeric(substring(V1,(columnLength *42) + 1, columnLength *43)),#43=index feature
        V1    = NULL
    )]
    
    setkey(x, subject)
    
    setorder(x, subject, activity)
    
    #x[order(subject, activity)]
    
    x
}




