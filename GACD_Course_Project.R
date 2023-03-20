#5 tasks as below
#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement. 
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names. 
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


library(plyr) 
#download the data from the provided url
if(!file.exists("./Course_Project_GACD")){dir.create("./Course_Project_GACD")}
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "./Course_Project_GACD/rawdata.zip")

#unzip the zip file into folder
unzip(zipfile = "./Course_Project_GACD/rawdataUYNJ,.zip", exdir = "./Course_Project_GACD")

##Task 1 - #Merges the training and the test sets to create one data set.
##Task 4 - #Appropriately labels the data set with descriptive variable names. 
#1> load datasets - train data, test data, features and activiteis
train_x <- read.table("./Course_Project_GACD/UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("./Course_Project_GACD/UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("./Course_Project_GACD/UCI HAR Dataset/train/subject_train.txt")

test_x <- read.table("./Course_Project_GACD/UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("./Course_Project_GACD/UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("./Course_Project_GACD/UCI HAR Dataset/test/subject_test.txt")

features <- read.table("./Course_Project_GACD/UCI HAR Dataset/features.txt")

activity_labels <- read.table("./Course_Project_GACD/UCI HAR Dataset/activity_labels.txt")

#2> assign names to the variables in tables 
colnames(train_x) <- features[,2]
colnames(train_y) <- "activity_number"
colnames(train_subject) <- "subject"

colnames(test_x) <- features[,2]
colnames(test_y) <- "activity_number"
colnames(test_subject) <- "subject"

colnames(activity_labels) <- c("activity_number","activity_name")

#3>Merge the tables into the respective datasets for train and test data then combine the 
#two into one finalized dataset
train_combined <- cbind(train_x,train_y,train_subject)
test_combined <- cbind(test_x, test_y, test_subject)
data_merged <- rbind(train_combined,test_combined)

##Task 2 - #Extracts only the measurements on the mean and standard deviation for each measurement.
#Getting the names of varaible names of table data_merged
colNames <- colnames(data_merged)
#generate a vector for desired column names including mean,standard deviation, activity number and subject
mean_and_std <- (grepl("activity_number", colNames) |
                   grepl("subject", colNames) |
                   grepl("mean..", colNames) |
                   grepl("std...", colNames)
                )
#Subset the data_merged into the data_filtered with required columns 
data_filtered <- data_merged[ , mean_and_std == TRUE]

##Task 3 - #Uses descriptive activity names to name the activities in the data 
data_filtered <- merge(data_filtered, activity_labels, by = "activity_number", all.x = TRUE)

##Task 5 - #From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
write.table(data_filtered,"FinalTidyDataset.txt", row.names = FALSE)