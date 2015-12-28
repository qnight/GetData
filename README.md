# Cleaning and Getting Data course project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Content

- **README.md** explains how all of the scripts work and how they are connected.
- **CodeBook.md** describes the variables, the data, and any transformations or work that you performed to clean up the data 
- **run_analysis.R** does the following: 
    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names. 
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- **tidy.txt** run_analysis.R output file with tidy data
    
## Getting started

We run run_analysis.R

1. It will check for UCI HAR Dataset folder in working directory. If it is not found it will download and extract the data, saving only the data keeping its folder structure not the zip file.

    The dataset includes the following files:
    
    - 'README.txt'
    
    - 'features_info.txt': Shows information about the variables used on the feature vector.
    
    - 'features.txt': List of all features.
    
    - 'activity_labels.txt': Links the class labels with their activity name.
    
    - 'train/X_train.txt': Training set.
    
    - 'train/y_train.txt': Training labels.
    
    - 'test/X_test.txt': Test set.
    
    - 'test/y_test.txt': Test labels.
    
    The following files are available for the train and test data. Their descriptions are equivalent. 
    
    - 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
    
    - 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
    
    - 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
    
    - 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
    
    Notes: 
    
    - Features are normalized and bounded within [-1,1].
    - Each feature vector is a row on the text file.

2. Merges the training and the test sets to create one data set.

3. Extracts only the measurements on the mean and standard deviation for each measurement.

4. Uses descriptive activity names to name the activities in the data set

5. Appropriately labels the data set with descriptive variable names. 

6. From the data set in previous step, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
