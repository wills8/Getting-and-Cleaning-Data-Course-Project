

# Getting and Cleaning Data Class Project

## Introduction
The purpose of this repo is to demonstrate the ability to take raw data and transform it into a tidy data set for future analysis. The source data for the project is of 30 subjects who had data collected using a smart phone on six physical activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.  The data collected can be obtained at this URL:

(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Detailed information about the source data can be found here: 

(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Repo Overview
The repo contains three files:
1. Readme.md containing information about the data and repo.
2. Codebook.md containg information about the code used in run_analysis.R
3. run_analysis.R script that takes the raw data and produces a tidy data set.

The run_analysis.R script will create a "projectData" folder in your working directory that will contain the unzipped downloaded data.  There is no need to create a new working directory folder.  The final output of the run_analysis.R will be titled "tidyData.txt" and will be located in the "projectData/UCI HAR Dataset" folder.  

## Project Instructions
The instructions for the project are as follows:

You should create one R script called run_analysis.R that does the following.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

