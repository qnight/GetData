library(dplyr)
library(data.table)


# Download and unzip the dataset
# the unzip of the file creates a folder UCI HAR Dataset so we check if it is already created
# we do not keep the zip file, we only want the data inside
temp <- tempfile()
if (!file.exists("UCI HAR Dataset")) {
    dataURL <-
        "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
    download.file(dataURL, temp, mode = "wb")
    unzip(temp)
}
unlink(temp)


# Read and create test dataset
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
s_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

test <- data.frame(s_test, y_test, x_test)

#  Read and create train dataset
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
s_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

train <- data.frame(s_train, y_train, x_train)

# Merge test and train datasets into one
merged_data <- rbind(train, test)

# Remove some variables
remove(s_test, x_test, y_test, test, s_train, x_train, y_train, train)

message("features")
# Read in the measurement labels dataset
features <-
    read.table("UCI HAR Dataset/features.txt", sep = "", header = FALSE)
column_names <- make.unique(as.vector(features[, 2]))
colnames(merged_data) <-
    c("subject_id", "activity_labels", column_names)

# Select only the columns that contain mean or standard deviations.
# Make sure to bring along the subject and label columns.
# Exclude columns with freq and angle in the name.
merged_data <-
    select(
        merged_data, contains("subject"), contains("label"), contains("mean"), contains("std"),-contains("freq"),-contains("angle")
    )

message("activity labels")
# Read in the activity labels dataset
activity_labels <-
    read.table("UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE)

# Replace the activity codes in the trimmed down running
# dataset with the labels from the activity labels dataset.
merged_data$activity_labels <-
    as.character(activity_labels[match(merged_data$activity_labels, activity_labels$V1), 'V2'])

message("cleaning")
# Clean up the column names of invalid characters (-).
setnames(merged_data, colnames(merged_data), gsub("\\(\\)", "", colnames(merged_data)))
setnames(merged_data, colnames(merged_data), gsub("-", "_", colnames(merged_data)))

# Group data and calculate the mean of every measurement.
tidy_merged_data <-
    merged_data %>% group_by(subject_id, activity_labels) %>% summarise_each(funs(mean))

# Write table in file
write.table(tidy_merged_data, file = "tidy.txt", row.name = FALSE)