The input data, the output data and the transformations performed for this project are described here.

### Input data

The input dataset used for this project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Dataset content:

* *README.txt*, *features_info.txt*, *features.txt*, *activity_labels.txt*
* a subdirectory called *train* containing the files *X_train.txt* and *y_train.txt*
* a subdirectory called *test* containing the files *X_test.txt* and *y_test.txt*

These data refer to an experiment carried out with a group of 30 volunteers who performed different activities (walking, walking  upstairs, walking downstairs, sitting, standing, laying) while wearing a smartphone Samsung Galaxy S II on the waist. Using the smartphone embedded accelerometer and gyroscope,  3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. 

The sensor signals were processed as described in the *README.txt* and *features_info.txt*. 561 features were thus obntained, which are listed in the file *features.txt* and discussed in the file *features_info.txt*.

The 6 activity performed during each experiment are labeled as presented in the file *activity_labels.txt*.

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The identifiers for the subjects performing each experiment are listed in the files *subject_train.txt* and *subject_test.txt*. The range is from 1 to 30. Each observation refer to one of the train and test experiments (7352 and 2947 respectively).

The identifiers for the activities performed during each experiment are listed in the files *y_train.txt* and *y_test.txt*. The range is from 1 to 6. Each observation refer to one of the train and test experiments (7352 and 2947 respectively).

The results for these experiments are in the dataset *X_train.txt* and *X_test.txt*. Each row refers to one experiment (7352 and 2947 respectively) and each column to one of the 561 features.

### Output file

Name: *OutputData.txt*

The final dataset obtained during this project is a table contained in the repository as *OutputData.txt*. 

The first column contains the identifiers for the subject who performed the experiment. Its range is from 1 to 6.

The second column contains the label for the performed activity: *WALKING*, *WALKING_UPSTAIRS*, *WALKING_DOWNSTAIRS*, *SITTING*, *STANDING*, *LAYING*.

The remaning 79 columns refers to those features containing the mean and standard deviations of different variables calculated from the sensor temporal signals (body acceleration along the x,y and z directions, gravitational acceleration acceleration along the x,y and z directions, ...). Features are normalized and the range is from -1 to 1.

The 180 rows of the dataset refer to every distinct combination subject - activity, where all the 6 activities and all the 30 subjects (independently if they belong to the train or test partitions) were considered. The feauture values are the averages of the experimental results obtained for each subject and each activity.

### Transformations performed to obtained the output dataset from the input dataset:

* a single vector called “subject” was created appending the subject identifiers for the test set after the ones for the training set
* descriptive activity names were associated to activity identifiers for each experiment, performing left joins between the yTrain/yTest data and the activityLabels data
* a single data set called “activity” was created appending the activity identifiers/labels for the test set after the ones for the training set
* a single data set called “xDataSet” was created appending the test set after the training set
* a data set called “xDataSetExtract” was created extracting from xDataSet only the measurements on the mean and standard deviation for each measurement
* a single data set called “DataAll” was created adding information about the subject identifiers and using descriptive activity names and variable names
* the final data set called “DataFinal” was created, which contains the average of each variable for each activity and subject
* DataFinal was exported in the file called “OutputData.txt”
