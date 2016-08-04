## load the package dplyr
library(dplyr)

## READ DATA
## read 'features.txt' and 'activity_labels.txt' inside the directory 'UCI HAR Dataset':
features <- read.table("C:/Users/UL16971/Downloads/Dati-R/Corso-Getting-Cleaning-Data/Project/UCI HAR Dataset/features.txt")
activityLabels <- read.table("C:/Users/UL16971/Downloads/Dati-R/Corso-Getting-Cleaning-Data/Project/UCI HAR Dataset/activity_labels.txt")

## read 'subject_train.txt', 'y_train.txt' and 'X_train.txt' inside the directory 'UCI HAR Dataset/train':
subjectTrain <- read.table("C:/Users/UL16971/Downloads/Dati-R/Corso-Getting-Cleaning-Data/Project/UCI HAR Dataset/train/subject_train.txt")
yTrain <- read.table("C:/Users/UL16971/Downloads/Dati-R/Corso-Getting-Cleaning-Data/Project/UCI HAR Dataset/train/y_train.txt")
xTrain <- read.table("C:/Users/UL16971/Downloads/Dati-R/Corso-Getting-Cleaning-Data/Project/UCI HAR Dataset/train/X_train.txt")

## read 'subject_test.txt', 'y_test.txt' and 'X_test.txt' inside the directory 'UCI HAR Dataset/test':
subjectTest <- read.table("C:/Users/UL16971/Downloads/Dati-R/Corso-Getting-Cleaning-Data/Project/UCI HAR Dataset/test/subject_test.txt")
yTest <- read.table("C:/Users/UL16971/Downloads/Dati-R/Corso-Getting-Cleaning-Data/Project/UCI HAR Dataset/test/y_test.txt")
xTest <- read.table("C:/Users/UL16971/Downloads/Dati-R/Corso-Getting-Cleaning-Data/Project/UCI HAR Dataset/test/X_test.txt")

## DATA PREPARATION
## append subjectTest after subjectTrain:
subject <- rbind(subjectTrain,subjectTest)

## left join between yTrain/yTest and activityLabels; the corresponding activity name is associated to each experiment (= each row):
yTrainActivity <- left_join(yTrain,activityLabels)
yTestActivity <- left_join(yTest,activityLabels)

## append yTestActivity after yTrainActivity:
activity <- rbind(yTrainActivity,yTestActivity)

## 1) MERGE THE TRAINING AND TEST SETS TO CREATE ONE DATA SET
## append xTest after xTrain and use descriptive feature names as column names
xDataSet <- rbind(xTrain,xTest)
colnames(xDataSet) <- features$V2

## 2) EXTRACTS ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION
## search for the text "meaN()" or "std()" inside the feature names:
mean <- grepl("mean()",features$V2)
std <- grepl("std()",features$V2)
extraction <- mean | std
## column extraction:
xDataSetExtract <- xDataSet[,extraction]

## 3) USES DESCRIPTIVE ACTIVITY NAMES THE ACTIVITIES IN THE DATA SET
## add columns containing the subject ID and the activity name assicuated ti each experiment:
DataAll <- cbind(subject, activity[,2],xDataSetExtract)

## 4) APPROPIATELY LABELS THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES
## adjust column names:
colnames(DataAll) <- c("ID_Subject","Activity",colnames(xDataSetExtract))

## 5) CREATE A FINAL TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE
## FOR EACH ACTIVITY AND EACH SUBJECT
## aggregation on activity and subject and average calculation:
DataFinal <-aggregate(DataAll[,3:81], by=list(DataAll[,1],DataAll[,2]),FUN=mean, na.rm=TRUE)
## adjust column names:
colnames(DataFinal) <- c("Subject","Activity",colnames(xDataSetExtract))

## Export the final data set:
write.table(DataFinal, "C:/Users/UL16971/Downloads/Dati-R/Corso-Getting-Cleaning-Data/Project/UCI HAR Dataset/OutputData.txt", sep="\t", row.name=FALSE)

