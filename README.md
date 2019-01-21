# gcd_courseProject
## Getting and Cleaning Data Course Project
### By Rodrigo Careaga

This repository contains 3 files.

1. run_analysis.R - R script to perform the analysis.
2. codeBook.md - indicate all the variables and summaries calculated, along with units, and any other relevant information.
3. README.md - file that explains the analysis files in a clear and understandable way.

### Analysis
The run_analysis program does the following tasks:
First it download and unzipped the files in case you haven't already done it.
Then it reads the files of the train and the test data and stores the values in variables. This is repeated with the features and activities labels text files.

It continues executing the following tasks:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3.Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
