The CodeBook.md is included in this repo per requirement

**Purpose - to explain from the get data from the url to the final step of generating the required tidy dataset**

**The Source Data**

The raw data is provided by the course 
Below is the url used to download the dataset 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Explanation of the script 
The file "GACD_Course_Project.R" include the R script which I think would be reproducible. 
Below steps also can be found in the file "GACD_Course_Project.R"

#download the data from the provided url
#unzip the zip file into folder

##Task 1 - #Merges the training and the test sets to create one data set.
#1> load datasets - train data, test data, features and activiteis
#2> assign names to the variables in tables 
#3> Merge the tables into the respective datasets for train and test data then combine the 

##Task 2 - #Extracts only the measurements on the mean and standard deviation for each measurement.
#Getting the names of varaible names of table data_merged
#generate a vector for desired column names including mean,standard deviation, activity number and subject
#Subset the data_merged into the data_filtered with required columns 

##Task 3 - #Uses descriptive activity names to name the activities in the data 

##Task 4 - #Appropriately labels the data set with descriptive variable names. 

##Task 5 - #From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


**Variables**


Data in the downloaded files are stored in below variables - **train_x, train_y, train_subject, test_x, test_y, test_subject**
Combined datasets variables includes -** test_subject, test_combined, data_merged**
Final dataset used to generate the required tidy dataset - **data_filtered**
