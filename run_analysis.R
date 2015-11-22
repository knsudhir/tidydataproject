# load packages
library(dlpyr)

# load the activity labels and name the columns
activity_labels <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", col.names = c("labelId", "activityName"))

# load the test and training labels and name the columns
test_lables <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", col.names="labelId")
train_lables <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", col.names="labelId")

# create a data frame by merging test and training data with the activty labels by labelId and do not allow sorting of the data set
activity_test_labels <- merge(test_lables, activity_labels, sort = FALSE)
activity_train_labels <- merge(train_lables, activity_labels, sort = FALSE)

# create another data frame by loading the test and training subject id data
subject_test <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
subject_train <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

# load the 561-feature vector time and frequency domain variables that will be used as column names in te data sets
features <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt", col.names=c("featureId","featureName"))

# clean up the labels to remove duplicates
feature_names <- gsub("\\.", "", make.names(features[, 2], unique=TRUE, allow_=FALSE))

# create data frames by loading the test and training data set
test_set <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
train_set <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")

# Use the 561 feature cleaned vector variables as variable names for both the test and training data set
test_set <- setNames(test_set, feature_names)
train_set <- setNames(train_set, feature_names)

# merge the 3 data frames by binding subject identifier, activity names and measures data set for both test and training data
cbind_test_set <- cbind(subject_test, activity_test_labels, test_set)
cbind_train_set <- cbind(subject_train, activity_train_labels, train_set)

# use the dplyr select to get subject id, activity name and variable names containing mean and standard deviation
test_set <- select(cbind_test_set, subject, activityName, contains("mean"), contains("std"))
train_set <- select(cbind_train_set, subject, activityName, contains("mean"), contains("std"))

# merge both the test and training data set
main_set <- rbind(test_set, train_set)

# create a tidy data set by calculating average means for each variable in the main data set grouped by subject and activity identifiers
tidy_data_set <- main_set %>% group_by(subject, activityName) %>% summarise_each(funs(mean))

# write the tidy data set to a file
write.table(tidy_data_set, "tidy_data.txt", row.names = FALSE)