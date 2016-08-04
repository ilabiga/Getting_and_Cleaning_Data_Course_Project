# Getting_and_Cleaning_Data_Course_Project
This is the repository for the final project for the Coursera course called "Getting and Cleaning Data"

The input data, the output data and the transformations performed for this project (with the R script *run_analysis.R*) are all described in the file **CodeBook.md** contained in the repo.

The final output tidy data is in the file **OutputData.txt**.

The R script written for obtaining the output data set (from the input data set) is the file **run_analysis.R**.

In order to run this R script you first need:
* to install the R package “dplyr”
* to download and unzip the input data from the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* to save the script *run_analysis.R* inside the directory where you saved and unzip the data folder (*UCI HAR Dataset*)
* to set the R working directory equal to that directory (with the *setwd(dir)* comamnd)
* to run the script run_analysis.R (with the command *source("run_analysis.R")* in the R Studio console).

### Project Instructions

The purpose of this project is to demonstrate your ability to collect, work with and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

You will be graded by your peers on a series of yes/no questions related to the project. 

You will be required to submit:

* a tidy data set as described below
* a link to a Github repository with your script for performing the analysis
* a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md
* README.md explaining how all of the scripts work and how they are connected


One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each
measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average
of each variable for each activity and each subject.

