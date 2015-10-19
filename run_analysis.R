if (file.exists("UCI HAR Dataset")) {
	setwd("UCI HAR Dataset")
} else {
	stop("UCI HAR Dataset directory does not exist!!")
}
	
# Read the test data, column bind the 561 feature data with subject ids and activity ids
test_data <- read.table("test/X_test.txt")
test_sub_data <- read.table("test/subject_test.txt")
colnames(test_sub_data) <- "subject"
test_y_data <- read.table("test/y_test.txt")
colnames(test_y_data) <- "activity"
test_final <- cbind(test_sub_data, test_y_data, test_data)

# Read the train data, column bind the 561 feature data with subject ids and activity ids
train_data <- read.table("train/X_train.txt")
train_sub_data <- read.table("train/subject_train.txt")
colnames(train_sub_data) <- "subject"
train_y_data <- read.table("train/y_train.txt")
colnames(train_y_data) <- "activity"
train_final <- cbind(train_sub_data, train_y_data, train_data)

#1.0 Merge the test and train data using rbind as column names would be same for both test and train
## Also the subject ids will be different for two sets
## After combining the two sets, the merged data would represent data for all 30 subjects
## and for various activities labelled by [1-6]
merged_data <- rbind(train_final, test_final)
###

#2.0 Extract measurements on the mean and standard deviation for each measurement
## I have included data angle data for mean as well because it was asked to include
### measurement on the mean/std deviation for each measurement and angle is one of the measurements

#Read feature data
feat_data <- read.table("features.txt")

#[IGNORE]Remove entries having "angle" in it as we don't want to include the entries
#[IGNORE]mod_feat_data <- feat_data[!grepl("(*angle*)",feat_data$V2),]
#[IGNORE]col_ind <- mod_feat_data[grep("[mM][eE][aA][nN]|[sS][tT][dD]",mod_feat_data$V2),1]
#[IGNORE]col_names <- mod_feat_data[grep("[mM][eE][aA][nN]|[sS][tT][dD]",mod_feat_data$V2),2]
col_ind <- feat_data[grep("[mM][eE][aA][nN]|[sS][tT][dD]",feat_data$V2),1]
col_names <- feat_data[grep("[mM][eE][aA][nN]|[sS][tT][dD]",feat_data$V2),2]
mod_merged_data <- merged_data[,c(1,2,(col_ind+2))]
###

#3.0 Assign descriptive activity names in consolidated data set
mod_merged_data$activity <- sub(1,"walking",mod_merged_data$activity)
mod_merged_data$activity <- sub("2","walkingup",mod_merged_data$activity)
mod_merged_data$activity <- sub("3","walkingdown",mod_merged_data$activity)
mod_merged_data$activity <- sub("4","sitting",mod_merged_data$activity)
mod_merged_data$activity <- sub("5","standing",mod_merged_data$activity)
mod_merged_data$activity <- sub("6","laying",mod_merged_data$activity)
###

#4.0 Appropriate name for the variable names
##Modify column names for better readability, they would be assigned later on to modified merged data as new column names
temp1 <- gsub("-","",col_names)
temp2 <- gsub("[()]","",temp1)
temp3 <- gsub("Body", "body",temp2)
temp4 <- gsub("bodybody", "body",temp3)
temp5 <- gsub(",","And", temp4)
temp6 <- gsub("mean","Mean", temp5)
mod_col_names <- gsub("std","StanDev", temp6)
colnames(mod_merged_data) <- c("subject", "activity", mod_col_names)
###
#5.0 Create second tidy data set with the average of each variable for each activity and each subject

split_mod_mer_data <- split(mod_merged_data, list(mod_merged_data$subject, mod_merged_data$activity))
temp <- sapply(split_mod_mer_data, function(x) colMeans(x[,c(3:ncol(x))]))
res <- t(temp)
res <- data.frame(res)
split_names <- strsplit(rownames(res),"\\.")
subject <- sapply(split_names, function(x) x[1])
activity <- sapply(split_names, function(x) x[2])
res1 <- cbind(activity, res)
res2 <- cbind(subject, res1)
rownames(res2) <- gsub("\\.","",rownames(res2))
write.table(res2, row.name = FALSE, file = "Mod3_W4_S5_Proj.txt")
setwd("..")
message("Mod3_W4_S5_Proj.txt has been created under UCI HAR Dataset directory")
