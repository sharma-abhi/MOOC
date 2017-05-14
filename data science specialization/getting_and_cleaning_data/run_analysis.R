library(reshape2)
# setting the working directory
setwd("GitHub//datasciencecoursera//getting_and_cleaning_data")

## Step 1

# fetching the subject training data.
df_sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# fetching the X training data.
df_x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")

# fetching the Y training data.
df_y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

# combining all the 3 training data sets.
df_train <- cbind(df_sub_train, df_x_train, df_y_train)


# fetching the subject test data.
df_sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# fetching the X test data.
df_x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

# fetching the Y test data.
df_y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

# combining all the 3 test data sets.
df_test <- cbind(df_sub_test, df_x_test, df_y_test)

# Merging the training and the test data sets to create one data set.
df <- rbind(df_train, df_test)

## Step 2

# fetching the feature labels
features <- read.table("./UCI HAR Dataset/features.txt",stringsAsFactors = FALSE)

# Appropriately labeling the data set with descriptive variable names. 
names(df) <- c("subject", features$V2, "activity")

## Step 3

# Extracting the measurements on the mean and standard deviation for 
# each measurement. 
mean_cols <- grep("mean",names(df))
std_cols <- grep("std",names(df))
df <- df[,c(1,mean_cols,std_cols,563)]

## Step 4

# fetching the activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
# Using descriptive activity names to name the activities in the data set
df$activity <- factor(df$activity,labels=activity_labels$V2)
names(df) <- gsub("\\()","",names(df))
names(df) <- gsub("-",".",names(df))
## Step 5

# creating a second, independent tidy data set with the average of each 
# variable for each activity and each subject.
dfMelt <- melt(df, id=c("subject","activity"))
tidyData <- dcast(dfMelt, subject + activity ~ variable, mean)

# Creating a .txt file with write.table() 
write.table(tidyData, file="tidy_data.txt",row.names = FALSE)

# reading the tidy dataset (for debug purposes)
# dp <- read.table("tidy_data.txt", header=TRUE)
# View(dp)