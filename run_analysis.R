#Getting and Cleaning Data, Course Project

#set working directory
setwd("F:/mooc/dstrack/03_getting_cleaning_data/dataset")

#read all relevant files into memory
training_data <- read.table("train/X_train.txt")   #x_train
training_labels <- read.table("train/y_train.txt") #y_train
training_subjects <- read.table("train/subject_train.txt") #subject_train

test_data <- read.table("test/X_test.txt") #x_test
test_labels <-  read.table("test/y_test.txt") #y_test
test_subjects <-  read.table("test/subject_test.txt") #subject_test

features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")

#merge training and test data frames
data_merged <- rbind(training_data, test_data) #x_data
labels_merged <- rbind(training_labels, test_labels) #y_data
subjects_merged <- rbind(training_subjects, test_subjects) #subject_data

#create logical vector of feature names containing "mean" or "std"
features_mean_std <- grepl("mean|std", features[,2])

#subset data: keep only "mean" or "std" rows
data_merged <- data_merged[,features_mean_std]

#subsetting changed the column names to V1..V552, so: re-set names from features
names(data_merged) <- features[features_mean_std, 2]

#remove brackets from column names for better readibility
names(data_merged) <- gsub("()","",names(data_merged),fixed=TRUE)

#replace numeric label data (1..6) with textual description from activity list
labels_merged[, 1] <- activities[labels_merged[, 1], 2]

#change column name from V1 to proper name
names(labels_merged) <- "activity"

#correct column name from V1 to proper name
names(subjects_merged) <- "subject"

#column-bind data, labels and subjects into a single data frame
data_complete <- cbind(data_merged, labels_merged, subjects_merged)

#aggregate complete data by activity and subject and compute mean values
data_averages <- aggregate(data_complete,
                           list(Activity = data_complete$activity, 
                                Subject = data_complete$subject), FUN="mean")

#delete superfluous old columns (the newly created columns are upper-case)
data_averages["activity"] = NULL
data_averages["subject"] = NULL

#write averages to text file
write.table(data_averages, "data_averages.txt", row.name=FALSE)