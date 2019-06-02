library(plyr)

# Preliminary Steps
## Download data and unzip data to a directory. Create directory if directory folder does not exist.
if(!file.exists("./projectData")){dir.create("./projectData")}
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(URL, destfile = "./projectData/dataset.zip", method = "curl")
zipFile <- "./projectData/dataset.zip"
unzip(zipFile, exdir = "./projectData")

## Set working directory to project data folder
setwd("./projectData/UCI HAR Dataset/")

## Read targeted data from unzipped folder.
features <- read.table('./features.txt',header=FALSE) 
actLabels <- read.table('./activity_labels.txt',header=FALSE) 
subTrain <- read.table('./train/subject_train.txt',header=FALSE)
subTest <- read.table('./test/subject_test.txt',header=FALSE)
trainSet <- read.table('./train/x_train.txt',header=FALSE)
trainLabels <- read.table('./train/y_train.txt',header=FALSE)
testSet <- read.table('./test/x_test.txt',header=FALSE)
testLabels <- read.table('./test/y_test.txt',header=FALSE) 

# Sec. 1: Combine test and train data sets. 
actData <- rbind(trainLabels, testLabels)
subData <- rbind(subTrain, subTest)
featureData <- rbind(trainSet, testSet)

## Assign column names to imported data from above.
colnames(featureData) <- features$V2
colnames(actData) <- c("activityID")
colnames(subData) <- c("subjectID")
colnames(actLabels) <- c("activityID", "activityType")

## Merge data sets.
combinedData <- cbind(subData, actData, featureData)

# Sec 2: Extracts only the measurements on the mean and standard deviation for each measurement.
subNames <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
selNames <- c(as.character(subNames), "subjectID", "activityID")
finalData <- subset(combinedData, select = selNames)

# Sec. 3: Merge activity labels into final data set.
finalData <- merge(finalData, actLabels, by.x = "activityID", by.y = "activityID", all.x=TRUE)

# Sec 4. Use gsub function to change variables to more meaningful names.
names(finalData) <- gsub("^f", "freq", names(finalData))
names(finalData) <- gsub("^t", "time", names(finalData))
names(finalData) <- gsub("Acc", "Accelerometer", names(finalData)) 
names(finalData) <- gsub("std", "StdDev", names(finalData))
names(finalData) <- gsub("Gyro", "Gyroscope", names(finalData))
names(finalData) <- gsub("Mag", "Magnitude", names(finalData))
names(finalData) <- gsub("BodyBody", "Body", names(finalData))
names(finalData) <- gsub("mean", "Mean", names(finalData))

# Sec. 5: Create new tidy data set that contains the average of each variable for each subject and activity. 
tidyData <- aggregate(. ~subjectID + activityID, finalData, mean)
tidyData <- tidyData[order(tidyData$subjectID,tidyData$activityID),]
write.table(tidyData, file = "tidyData.txt",row.name=FALSE)