# Mod3W4ProjectDataClean
Repository for Project work assigned for Module3 - Getting &amp; Cleaning Data
## Instructions for execution
- Script assumes that the data is placed under "UCI HAR Dataset" directory
- Download the script and place it in the folder one level up the data folder "UCI HAR Dataset"
- Source the script using source("run_analysis.R") command
- Script will create tidy data set file Mod3_W4_S5_Proj.txt under "UCI HAR Dataset" directory

## 1.0 Merging the training and test data set
- Check "UCI HAR Dataset" data directory
- If found, set working directory as "UCI HAR Dataset"
- If not found, stop the execution and show error message

### Create final test data set
- Read test/X_test.txt in data frame
- Read test/subject_test.txt and assign "subject" as column name
- Read test/y_test.txt and assign "activity" as column name
- These specific column names were given to identify these columns clearly in merged final train data set
- Perform column bind for these three data sets to create final data set for test data

### Create final train data set
- Read test/X_train.txt in data frame
- Read test/subject_train.txt and assign "subject" as column name
- Read test/y_train.txt and assign "activity" as column name
- These specific column names were given to identify these columns clearly in merged final train data set
- Perform column bind for these three data sets to create final data set for train data

### Merge final training and final test data set into one data set
- Perform row bind to merge final training data and final test data

## 2.0 Extract only the measurements on the mean and standard deviation for each measurement
- Read data from features.txt
- Identify column index for the values containing string [mM][eE][aA][nN] or [sS][tT][dD]
- Identify those variables and read them in character vector 
- Assign those variables as column names to merged data frame for column 3 onwards as first column name is "subject" and second column name is "activity"

## 3.0 Use descriptive activity names to name the activities in the data set
- In modified merged data set with right column names, replace all numeric representation of activities with descriptive names using sub function
- Mapping of variables is (1,walking), (2, walkingup), (3, walkingdown), (4, sitting), (5, standing), (6, laying)

## 4.0	Assign appropriate labels to the data set with descriptive variable names
- Remove "-" from the column variable names
- Remove "(" and ")" from the column variable names
- Convert "Body" to "body" in the column variable names
- Replace "bodybody" with "body" in the column variable names
- Replace "," with "And" in the column variable names for angle variables
- Replace "mean" with "Mean" in the column variable names for better readability
- Replace "std" with "StanDev" in the column variable names for better readability

## 5.0	Create a second, independent tidy data set with the average of each variable for each activity and each subject
- Test
- End
