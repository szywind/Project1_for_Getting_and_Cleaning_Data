
README.md for run_analysis.R

================================================================================
This file describes some details in writing run.analysis.R script. We can run the script to clean up the data via the following steps.

================================================================================
Step 0. Initialize. 

line 18, Let's set up the current work directory. 
 
line 21~23, read the training data and save as data frame with suffix "_train".  

line 25~27, read the test data and save as data frame with suffix "_test". 

line 30~31, read the feature names and activity labels. 

================================================================================
Step 1. Merges the training and the test sets to create one data set.

line 35~37, merge the data frames "x_train" and "x_test" which share the same number of columns to "x", similarly for "y" and "subject".

line 39, merge the data frames "x", "y" and "subject" which share the same number of rows to "data1".

================================================================================
Step 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

line 45, extract the measurements on the mean and standard deviation by searching the key words "mean()" and "std()" from the feature names first and then ruling out the probable wrong names like "fBodyBody..." by observation.  

line 47, assign names to the columns of the data frame "data2". 

================================================================================
Step 3. Uses descriptive activity names to name the activities in the data set.

line 52~53, merge "data2" with "activity" by the common activity labels and then ruling out the "bridge"-activity labels by assign NULL to "data3$label". 

================================================================================
Step 4. Appropriately labels the data set with descriptive variable names. 

line 60~66, change the misleading abbreviates, i.e. change "t" to "timeDomain", "f" to "freqDomain", "std" to "stddev", "Acc" to "Acceleration", "Mag" to "Magnitude", "Gyro" to "Gyroscope". 

line 68~70, remove hyphens("-") and brackets("()") to make the basic R operations like subsetting work. 

================================================================================
Step 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.  

line 76, melting data frames with the features regarded as variables while subject and activity as ids. 

line 78, casting data frames with "fun.aggregate = mean" which splits the variables into groups by the combination of ids and calculates the mean of each group.

line 80, write the tidy data back to file.

================================================================================