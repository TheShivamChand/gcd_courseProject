##created by Rodrigo Careaga
##january 20th, 2019

## use of the dplyr package
## install.packages("dplyr")
library(dplyr)

## string variables for file download
fileName <- "UCIdata.zip"
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dir <- "UCI HAR Dataset"

## File download verification. If file does not exist, file is downloaded.
if(!file.exists(fileName)){
  download.file(url,fileName, mode = "wb")
}

## File unzip verification. If the directory does not exist, the file is unzipped.
if(!file.exists(dir)){
  unzip("UCIdata.zip", files = NULL, exdir=".")
}


## Read the files of the train data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## Read the files of the test data
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## Read the features of the data and the activity labels
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## 1. Merges the training and the test sets to create one data set.
x_total <- rbind(X_train, x_test)
y_total <- rbind(y_train, y_test)
subject_total <- rbind(subject_train, subject_test)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
selected_var <- features[grep("mean\\(\\)|std\\(\\)",features[,2]),]
x_total <- x_total[,selected_var[,1]]

## 3. Uses descriptive activity names to name the activities in the data set
colnames(y_total) <- "activity"
y_total$activitylabel <- factor(y_total$activity, labels = as.character(activity_labels[,2]))
activitylabel <- y_total[,-1]

## 4. Appropriately labels the data set with descriptive variable names.
colnames(x_total) <- features[selected_var[,1],2]


## 5. From the data set in step 4, creates a second, independent tidy data set with the average
## of each variable for each activity and each subject.
colnames(subject_total) <- "subject"
total <- cbind(x_total, activitylabel, subject_total)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_all(mean)
write.table(total_mean, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
