#load necessary packages
library(tidyverse)

# download training and test data sets, and features list
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

temp <- tempfile()
download.file(fileUrl, temp)
files <- unzip(temp, list = T)
features <- read_table(unz(temp, files$Name[2]), col_names = F)
activity_labels <- read_table(unz(temp, files$Name[1]), col_names = F)
testx <- read_table(unz(temp, files$Name[17]), col_names = F)
testy <- read_table(unz(temp, files$Name[18]), col_names = F)
testsub <- read_table(unz(temp, files$Name[16]), col_names = F)
trainx <- read_table(unz(temp, files$Name[31]), col_names = F)
trainy <- read_table(unz(temp, files$Name[32]), col_names = F)
trainsub <- read_table(unz(temp, files$Name[30]), col_names = F)
unlink(temp)

# name test and training data sets with features
names(testx) <- features$X1
names(trainx) <- features$X1

# rename activities
names(activity_labels) <- c("activityvalue", "activity")
names(testy) <- "activityvalue"
names(trainy) <- "activityvalue"
testy <- left_join(testy, activity_labels, by = "activityvalue")
trainy <- left_join(trainy, activity_labels, by = "activityvalue")

# add subject and activity names for test and training data sets
test <- bind_cols(testsub, testy, testx)
train <- bind_cols(trainsub, trainy, trainx)

# label data sets as test or training
test <- add_column(test, type = "test", .before = "activity")
colnames(test)[1] <- "subject"
train <- add_column(train, type = "training", .before = "activity")
colnames(train)[1] <- "subject"

# merge the two data sets 
data <- bind_rows(test, train)

# extract mean and standard deviation for each measurement
data <- data %>% select(subject, type, activity, 
                        contains("mean"), contains("std"))

# create a second data set with average of each variable for each activity
# and each subject
summarydata <- data %>% group_by(subject, activity)
summarydata <- summarydata %>% summarize(across(where(is.double), mean))