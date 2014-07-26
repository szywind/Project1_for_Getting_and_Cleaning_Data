## Course Project 1 for Getting and Cleaning Data
## run_analysis.R
##  -Input: 
##     - 'features.txt': List of all features.
##     - 'activity_labels.txt': Links the class labels with their activity name.
##     - 'train/X_train.txt': Training set.
##     - 'train/y_train.txt': Training labels.
##     - 'test/X_test.txt': Test set.
##     - 'test/y_test.txt': Test labels.
##     - 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
##  -Output: Tidy data set obtained with the following steps.  
##
##  Note: The file README.md in the repo describes how the script works and the code book describes the variables.

#==================================================================================
# 0. Initialize.
# set up the current work directory
setwd('/Users/shenzhenyuan/Desktop/MOOC/Coursera/JHU-Data Science/Getting and Cleaning Data/Courser Project/UCI HAR Dataset/')

# read training and test data
subject_train<-read.table('./train/subject_train.txt', colClasses = "numeric")
x_train<-read.table('./train/X_train.txt', colClasses = "numeric")
y_train<-read.table('./train/y_train.txt', colClasses = "numeric")

subject_test<-read.table('./test/subject_test.txt', colClasses = "numeric")
x_test<-read.table('./test/X_test.txt', colClasses = "numeric")
y_test<-read.table('./test/y_test.txt', colClasses = "numeric")

# read feature lists and activity labels
feature<-read.table('features.txt', colClasses = "character")
activity<-read.table('activity_labels.txt', colClasses = "character")

#==================================================================================
# 1. Merges the training and the test sets to create one data set.
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

data1 <- cbind(x, y, subject)

#==================================================================================
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
featureNames = feature[,2]

selected_features = (grepl('mean()',featureNames)|grepl('std()',featureNames))&(!grepl('BodyBody',featureNames))
data2<-data1[,selected_features]
names(data2) <- c(as.character(featureNames)[selected_features], 'label','subject')

#==================================================================================
# 3. Uses descriptive activity names to name the activities in the data set.
names(activity) <- c('label','activity')
data3 <- merge(data2, activity, by.x="label", by.y ="label")
data3$label = NULL

#==================================================================================
# 4. Appropriately labels the data set with descriptive variable names. 
data4 <- data3

# change misleading abbreviations to the full words
names(data4) <- sub("tBody", "timeDomainBody", names(data4))
names(data4) <- sub("fBody", "freqDomainBody", names(data4))
names(data4) <- sub("tGravity", "timeGravity", names(data4))
names(data4) <- gsub("std", "stddev", names(data4))
names(data4) <- gsub("Acc", "Acceleration", names(data4))
names(data4) <- gsub("Mag", "Magnitude", names(data4))
names(data4) <- gsub("Gyro", "Gyroscope", names(data4))
# remove the hyphens
names(data4) <- gsub("-", "",names(data4))
# remove the brackets
names(data4) <- gsub("\\(\\)", "",names(data4))

#=================================================================================
# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
library(reshape2)
# melting the data frame as lecture 3-04
data5 <- melt(data4, id = c("subject", "activity"))
# casting the data frame as lecture 3-04
tidydata <- dcast(data5, subject + activity ~ variable, fun.aggregate=mean)
# write to file
write.table(tidydata, file = "tidydata.txt")


