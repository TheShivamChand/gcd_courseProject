# Getting and Cleaning Data Course Project
## Code Book
### By Rodrigo Careaga

#### File Download and unzip
* fileName: name of the zip file
* url: zip file url
* dir: name of the new directory

#### Reading the files of the train Data
X_train: values of variables in train
y_train: activity ID in train
subject_train: subject IDs in train data

#### Reading the files of the test Data
X_test: values of variables in test
y_test: activity ID in test
subject_train: subject IDs in test data

#### Reading the files of the features.txt and activity_labels.txt Data
activity_labels: Description of activity IDs in y_train and y_test data
features: description of each variables in X_train and X_test



#### 1. Merges the training and the test sets to create one data set.
X_total: binding of the X_train and the X_test data
y_total: binding of activity ID in test
subject_total: subject IDs in binded data

#### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
selected_var: variable to keep the measurements of the mean and the std. dev.
x_total: x_total values of the mean and std. dev.


#### 3. Uses descriptive activity names to name the activities in the data set
activitylabel: the labels of the different activities

#### 4. Appropriately labels the data set with descriptive variable names.


#### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
total_mean: data set with the total mean of the activitylabels
write.table to save the data as a tidydata.txt file
