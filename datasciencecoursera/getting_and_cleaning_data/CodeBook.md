### Instruction List
Following steps were completed in order:
* Step 1

  Extract the training and test sets and Merge both to create one data set.
* Step 2

  Fetching the feature labels from the "features.txt" file and appropriately labeling the data set with descriptive variable names. 
* Step 3

  Extracting the measurements on the mean and standard deviation for each measurement. 
* Step 4

  Fetching the activity labels and using descriptive activity names to name the activities in the data set.
  
  Also, "()" was removed from column names and "-" was replaced with "."
  ```
  names(df) <- gsub("\\()","",names(df))
  names(df) <- gsub("-",".",names(df))
  ```
* Step 5

  Creating a second, independent tidy data set with the average of each variable for each activity and each subject.
  ```
  dfMelt <- melt(df, id=c("subject","activity"))
  tidyData <- dcast(dfMelt, subject + activity ~ variable, mean)
  ```
* Step 6

  Creating a .txt file with write.table() 
* Step 7  (for debug purposes)

  Reading the tidy dataset
  ```
  dp <- read.table("tidy_data.txt", header=TRUE)
  View(dp)
  ```

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are: 

mean: Mean value

std: Standard deviation

### Code Book
* subject 2

  subject ids 
  * 1...30
* activity 6
  
  activities
  * WALKING
  * WALKING_UPSTAIRS
  * WALKING_DOWNSTAIRS
  * SITTING
  * STANDING
  * LAYING
* tBodyAcc.mean.X
* tBodyAcc.mean.Y
* tBodyAcc.mean.Z
* tGravityAcc.mean.X
* tGravityAcc.mean.Y
* tGravityAcc.mean.Z
* tBodyAccJerk.mean.X
* tBodyAccJerk.mean.Y
* tBodyAccJerk.mean.Z
  
  Average of Mean of Accelerometer  3-axial raw signals
  
* tBodyGyro.mean.X
* tBodyGyro.mean.Y
* tBodyGyro.mean.Z
* tBodyGyroJerk.mean.X
* tBodyGyroJerk.mean.Y
* tBodyGyroJerk.mean.Z
* tBodyAccMag.mean
* tGravityAccMag.mean
* tBodyAccJerkMag.mean
* tBodyGyroMag.mean
* tBodyGyroJerkMag.mean
  
  Average of Mean of Gyrometer 3-axial raw signals
  
* fBodyAcc.mean.X
* fBodyAcc.mean.Y
* fBodyAcc.mean.Z
* fBodyAcc.meanFreq.X
* fBodyAcc.meanFreq.Y
* fBodyAcc.meanFreq.Z
* fBodyAccJerk.mean.X
* fBodyAccJerk.mean.Y
* fBodyAccJerk.mean.Z
* fBodyAccJerk.meanFreq.X
* fBodyAccJerk.meanFreq.Y
* fBodyAccJerk.meanFreq.Z
* fBodyGyro.mean.X
* fBodyGyro.mean.Y
* fBodyGyro.mean.Z
* fBodyGyro.meanFreq.X
* fBodyGyro.meanFreq.Y
* fBodyGyro.meanFreq.Z
* fBodyAccMag.mean
* fBodyAccMag.meanFreq
* fBodyBodyAccJerkMag.mean
* fBodyBodyAccJerkMag.meanFreq
* fBodyBodyGyroMag.mean
* fBodyBodyGyroMag.meanFreq
* fBodyBodyGyroJerkMag.mean
* fBodyBodyGyroJerkMag.meanFreq

  Average of Mean of Fast Fourier Transform (FFT) signals

* tBodyAcc.std.X
* tBodyAcc.std.Y
* tBodyAcc.std.Z
* tGravityAcc.std.X
* tGravityAcc.std.Y
* tGravityAcc.std.Z
* tBodyAccJerk.std.X
* tBodyAccJerk.std.Y
* tBodyAccJerk.std.Z

  Average of Standard Deviation of Accelerometer 3-axial raw signals
  
* tBodyGyro.std.X
* tBodyGyro.std.Y
* tBodyGyro.std.Z
* tBodyGyroJerk.std.X
* tBodyGyroJerk.std.Y
* tBodyGyroJerk.std.Z
* tBodyAccMag.std
* tGravityAccMag.std
* tBodyAccJerkMag.std
* tBodyGyroMag.std
* tBodyGyroJerkMag.std

  Average of Standard Deviation of Gyrometer 3-axial raw signals
  
* fBodyAcc.std.X
* fBodyAcc.std.Y
* fBodyAcc.std.Z
* fBodyAccJerk.std.X
* fBodyAccJerk.std.Y
* fBodyAccJerk.std.Z
* fBodyGyro.std.X
* fBodyGyro.std.Y
* fBodyGyro.std.Z
* fBodyAccMag.std
* fBodyBodyAccJerkMag.std
* fBodyBodyGyroMag.std
* fBodyBodyGyroJerkMag.std

  Average of Standard Deviation of Fast Fourier Transform (FFT) signals
