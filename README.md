# Mod3W4ProjectDataClean
Repository for Project work assigned for Module3 - Getting &amp; Cleaning Data
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

## 2.0 2.	Extracts only the measurements on the mean and standard deviation for each measurement
- Read data from features.txt
- Identify column index for the values containing string [mM][eE][aA][nN] or [sS][tT][dD]
- Identify those variables and read them in character vector 
- Assign those variables as column names to merged data frame
