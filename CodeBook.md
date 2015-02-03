# Getting and Cleaning Data
# Course Project - Codebook

## Data Source
The source data was provided by the experiment "Human Activity Recognition Using Smartphones Dataset" conducted by Smartlab (University of Genova, Italy). 

Source data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Project Information

From the original description:

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.


## Relevant Raw Data Files
The raw data was split into multiple files:

* Training Data (folder train/)
    * <code>train/X_train.txt</code> - Training Data
    * <code>train/y_train.txt</code> - Training Labels
    * <code>train/subject_train.txt</code> - TRaining Subjects

* Test Data (folder test/)
    * <code>test/X_train.txt</code> - Testing Data
    * <code>test/y_train.txt</code> - Testing Labels
    * <code>test/subject_train.tx</code>t - Testing Subjects

* Additional Label Data
    * <code>activity_labels.txt</code> - Mapping of Activity ID to textual description
    * <code>features.txt</code> - Mapping of Feature ID to textual description


## Cleaning and Processing Steps
### 1. Merging the training and the test sets
The training, test, subject and label data sets were read into separate data frames via <code>read.table()</code> and merged afterwards via the <code>rbind()</code> function.

### 2. Extracting only the measurements on the mean and standard deviation for each measurement
Within the features data frame, the IDs of textual representations containing the strings "mean" and "std" were determined via the <code>grepl()</code> function (<code>data_merged</code>, <code>labels_merged</code>, <code>subjects_merged</code>). 

This created a logical vector (<code>features_mean_std</code>) which was used to subset the data frame so only mean and standard deviation rows were retained.

This subset data frame (<code>data_merged</code>) was merged the label (<code>labels_merged</code>) and subject (<code>subjects_merged</code>) data frames via the <code>rbind()</code> function.

An additional data frame (<code>data_averages</code>) was created to aggregate the merged data set by activity and subject in order to determine the average for each variable.

### 3. Using descriptive activity names to name the activities in the data set
Since the training and test data sets only contained numerical activity IDs, the appropriate textual descriptions were mapped from the <code>activities</code> data frame to the <code>data_merged</code> data frame.

### 4. Appropriately labels the data set with descriptive variable names
Since the training and test data sets only contained numerical feature IDs, the appropriate textual descriptions were mapped from the <code>features</code> data frame to the <code>data_merged</code> data frame.

### 5. Writing data
The <code>data_averages</code> data frame was written to the output file <code>data_averages.txt</code> via the <code>write.table()</code> function. To enhance readibility, opening and closing brackets were removed from the feature labels via the <code>gsub()</code> function.

## Tidy Data Structure
From the original <code>features_info.txt</code> description:

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
>
>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
>
>These signals were used to estimate variables of the feature vector for each pattern:  
>'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The tidy data frames <code>data_merged</code> and <code>data_averages</code> contain the following columns:

* Activity
* Subject
* tBodyAcc-mean-X
* tBodyAcc-mean-Y
* tBodyAcc-mean-Z
* tBodyAcc-std-X
* tBodyAcc-std-Y
* tBodyAcc-std-Z
* tGravityAcc-mean-X
* tGravityAcc-mean-Y
* tGravityAcc-mean-Z
* tGravityAcc-std-X
* tGravityAcc-std-Y
* tGravityAcc-std-Z
* tBodyAccJerk-mean-X
* tBodyAccJerk-mean-Y
* tBodyAccJerk-mean-Z
* tBodyAccJerk-std-X
* tBodyAccJerk-std-Y
* tBodyAccJerk-std-Z
* tBodyGyro-mean-X
* tBodyGyro-mean-Y
* tBodyGyro-mean-Z
* tBodyGyro-std-X
* tBodyGyro-std-Y
* tBodyGyro-std-Z
* tBodyGyroJerk-mean-X
* tBodyGyroJerk-mean-Y
* tBodyGyroJerk-mean-Z
* tBodyGyroJerk-std-X
* tBodyGyroJerk-std-Y
* tBodyGyroJerk-std-Z
* tBodyAccMag-mean
* tBodyAccMag-std
* tGravityAccMag-mean
* tGravityAccMag-std
* tBodyAccJerkMag-mean
* tBodyAccJerkMag-std
* tBodyGyroMag-mean
* tBodyGyroMag-std
* tBodyGyroJerkMag-mean
* tBodyGyroJerkMag-std
* fBodyAcc-mean-X
* fBodyAcc-mean-Y
* fBodyAcc-mean-Z
* fBodyAcc-std-X
* fBodyAcc-std-Y
* fBodyAcc-std-Z
* fBodyAcc-meanFreq-X
* fBodyAcc-meanFreq-Y
* fBodyAcc-meanFreq-Z
* fBodyAccJerk-mean-X
* fBodyAccJerk-mean-Y
* fBodyAccJerk-mean-Z
* fBodyAccJerk-std-X
* fBodyAccJerk-std-Y
* fBodyAccJerk-std-Z
* fBodyAccJerk-meanFreq-X
* fBodyAccJerk-meanFreq-Y
* fBodyAccJerk-meanFreq-Z
* fBodyGyro-mean-X
* fBodyGyro-mean-Y
* fBodyGyro-mean-Z
* fBodyGyro-std-X
* fBodyGyro-std-Y
* fBodyGyro-std-Z
* fBodyGyro-meanFreq-X
* fBodyGyro-meanFreq-Y
* fBodyGyro-meanFreq-Z
* fBodyAccMag-mean
* fBodyAccMag-std
* fBodyAccMag-meanFreq
* fBodyBodyAccJerkMag-mean
* fBodyBodyAccJerkMag-std
* fBodyBodyAccJerkMag-meanFreq
* fBodyBodyGyroMag-mean
* fBodyBodyGyroMag-std
* fBodyBodyGyroMag-meanFreq
* fBodyBodyGyroJerkMag-mean
* fBodyBodyGyroJerkMag-std
* fBodyBodyGyroJerkMag-meanFreq