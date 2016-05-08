# Coursera-Getting-and-Cleaning-Data
This is my solution for the course project "Getting and Cleaning Data"

The task was to collect a raw data set at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and provide a script, that turns it into "tidy" data, according to following demands:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script run_analysis.R uses dataset root directory as working directory. Before starting it, data from the link below must be unpacked an the script file placed in that directory (default name "UCI HAR Dataset". Set it as R working directory.

Note: this script uses dplyr package to work. Make sure it is installed.

Run the script with the foolowing command:

source("run_analysis.R")

Training and test data are simply bound together, since they are acquired on different groups of test subjects and don't intersect.
Labels of activities from files test_y.txt and train_y.txt are replaced by activity names.
Selection of variables is based on feature names and descriptions.

Final operations (grouping, calculating average) is performed with dplyr package methods

The resulting data set is saved in file cleaned_data_set.txt.

See also: Codebook.
