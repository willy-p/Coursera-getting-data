# Coursera-getting-data
Project for Getting and Cleaning Data Coursera Course

There is only one analysis file in this repository: "run_analysis.R"
run_analysis downloads the UCI HAR data and extracts the raw data from testing and training. It merges these data with the associated subjects and activites being performed for each measurement. 
run_analysis then merges the testing and training data and extracts only the variables that contain mean or standard deviation measurements.
Finally, run_analysis creates a second tidy data set that calculates the mean of each variable for each activity and each subject.
