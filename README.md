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
- Perform column bind for these three data sets to create final data set for test data

### Create final train data set
- Read test/X_train.txt in data frame
- Read test/subject_train.txt and assign "subject" as column name
- Read test/y_train.txt and assign "activity" as column name
- Perform column bind for these three data sets to create final data set for train data
