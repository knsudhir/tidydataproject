This wearable computing sample is based on the data collected from Samsung Galaxy S smartphone accelerometer. Source (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Design and Background : The pace of innovation in sensor technology gives opportunity to one of the most exciting areas in all of data science right now that is wearable computing.The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

RAW Data : Aaccelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ at a constant rate of 50 Hz, Body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) with a corner frequency of 0.3 Hz, Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals  (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to produce frequency domain signals fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 

The set of variables that were estimated from these signals are: 
mean(Mean value), std(Standard deviation), mad(Median absolute deviation), max(Largest value in array), min(Smallest value in array), sma(Signal magnitude area), energy(Energy measure), iqr(Interquartile range), entropy(Signal entropy), arCoeff(Autorregresion coefficients with Burg order equal to 4), correlation(correlation coefficient between two signals), maxInds(index of the frequency component with largest magnitude), meanFreq(Weighted average of the frequency components to obtain a mean frequency), skewness(skewness of the frequency domain signal), kurtosis(kurtosis of the frequency domain signal), bandsEnergy(Energy of a frequency interval within the 64 bins of the FFT of each window) angle(Angle between to vectors)

Processed Data : A new data set is created to combine the training and the test data. The project extracts signals only on the variables of the mean(Mean Value) and std(Standard deviation) for each measurement. Subject Id (30 Volunteers) and descriptive activity names are given to both training and test data before merging the dataset. All the variables for the combined data set are appropriately labelled with descriptive variable name. Finally, an independent tidy data set is created with the average of each variable for each activity and each subject.

Guide to create the tidy data file :
1) Load the activity labels file (activity_labels.txt)
2) Load the test and training labels (y_test.txt, y_train.txt)
3) Create a data frame by merging test and training data with the activty labels by using label identifier
4) Create another data frame by loading the test and training subject identifier data
5) Load the 561-feature vector time and frequency domain variables that will be used as column names in the data sets
6) Clean up the labels to remove duplicates
7) Create data frames by loading the test and training data set
8) Use the 561 feature cleaned vector variables as variable names for both the test and training data set
9) Merge the 3 data frames by binding subject identifier df, activity names df and measures data set df for both test and training data

Cleaning the tiday data set:
1) Use the dplyr to select subject identifier, activity name and variable names containing mean and standard deviation
2) Merge both the test and training data set
3) Create a tidy data set by calculating average means for each variable in the main data set grouped by subject and activity identifiers
4) Write the tidy data set to a file


40 X 88 dimesnion tidy data set
Variables present in the dataset:

1) subject : subject identifier denoted dy number in the rage of 1-30 from the list of 30 volunteers.
2) activityName : Activity performed by each subject
3) Average by subject and activity of Time signals (prefix 't') mentioned above in the raw data for calculated mean and standard deviation variables.
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
4) Average by subject and activity of Frequency signals (prefix 'f') mentioned above in the raw data for calculated mean and standard deviation variables.
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
