# CodeBook
## Files
1. README.md - describes how the analysis was performed.
2. run_analysis.R - R script that performs analysis on UCI HAR data 
3. features.txt - list of all variables in raw data set
4. features_info.txt - description of variables and how they were measured / calculated

## run_analysis.R
### description of variables
see "features.txt" and "features_info.txt"

### transformations on raw data
1. used the features list to rename all variables in the raw data set
2. renamed activities from numbers to words in data set using "activity_labels.txt" file
3. added subject and activity info to raw data
4. merged test and training data
5. extracted only variables that were calculated mean and standard deviation values
6. created a second tidy data set that is grouped by subject and activity
7. calculated the mean for each subject for each activity for all previously extracted variables
