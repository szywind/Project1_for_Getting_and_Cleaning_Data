
Study design

The data for this project was collected from Human Activity Recognition database (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), which was built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
 
Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


Code Book:

The original data was cleaned up following these steps:

Step 0: Read the 6 training and test datasets (subject_train.txt, X_train.txt, y_train.txt, subject_test.txt, X_test.txt, y_test.txt) into the corresponding data frames denoted with the suffix "_train" and "_test" respectively. Feature names and activity labels are also read from features.txt and activity_labels.txt into data frames "feature" and "activity".

Step 1: Merge the 6 training and test data frames and save the merged data frame as "data1", which contains 10299 observations and 563 variables.

Step 2: Extracts the measurements on the mean and standard deviation by searching the key words "mean()" and "std()" from the feature names first and then ruling out the probable wrong names like "fBodyBody..." by observation. And wind up with the data frame "data2" with 10299 observations and 72 variables.
tidy data:

Step 3: Uses descriptive activity name like "SITTING" to name the activities in "data2" by first merging "data2" with "activity" by the common activity labels and then ruling out the "bridge"-activity labels. The resultant data frame is named as "data3" with the same dimensions as "data2".

Step 4: Appropriately labels the data set with descriptive variable names by substituting the misleading abbreviates with the full words like changing "tBody..." to "timeDomainBode...". Besides, to make the basic R operations like subsetting work, hyphens and brackets are removed afterwards. The resultant data frame is named as "data4" with the same dimensions as "data2".

Step 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject by melting, "aggregate" and casting "data4". The tidy data frame obtained has 180 observations and 72 variables.

NOTE: 
- Feature variables in the tidy data frame are normalized and bounded within            [-1,1], so they have no units.
- "stddev" stands for "standard deviation" and "freq" stands for "frequency" 

Variables of the tidy data:

subject                                       "numeric"  
activity                                      "character"
timeDomainBodyAccelerationmeanX               "numeric"  
timeDomainBodyAccelerationmeanY               "numeric"  
timeDomainBodyAccelerationmeanZ               "numeric"  
timeDomainBodyAccelerationstddevX             "numeric"  
timeDomainBodyAccelerationstddevY             "numeric"  
timeDomainBodyAccelerationstddevZ             "numeric"  
timeGravityAccelerationmeanX                  "numeric"  
timeGravityAccelerationmeanY                  "numeric"  
timeGravityAccelerationmeanZ                  "numeric"  
timeGravityAccelerationstddevX                "numeric"  
timeGravityAccelerationstddevY                "numeric"  
timeGravityAccelerationstddevZ                "numeric"  
timeDomainBodyAccelerationJerkmeanX           "numeric"  
timeDomainBodyAccelerationJerkmeanY           "numeric"  
timeDomainBodyAccelerationJerkmeanZ           "numeric"  
timeDomainBodyAccelerationJerkstddevX         "numeric"  
timeDomainBodyAccelerationJerkstddevY         "numeric"  
timeDomainBodyAccelerationJerkstddevZ         "numeric"  
timeDomainBodyGyroscopemeanX                  "numeric"  
timeDomainBodyGyroscopemeanY                  "numeric"  
timeDomainBodyGyroscopemeanZ                  "numeric"  
timeDomainBodyGyroscopestddevX                "numeric"  
timeDomainBodyGyroscopestddevY                "numeric"  
timeDomainBodyGyroscopestddevZ                "numeric"  
timeDomainBodyGyroscopeJerkmeanX              "numeric"  
timeDomainBodyGyroscopeJerkmeanY              "numeric"  
timeDomainBodyGyroscopeJerkmeanZ              "numeric"  
timeDomainBodyGyroscopeJerkstddevX            "numeric"  
timeDomainBodyGyroscopeJerkstddevY            "numeric"  
timeDomainBodyGyroscopeJerkstddevZ            "numeric"  
timeDomainBodyAccelerationMagnitudemean       "numeric"  
timeDomainBodyAccelerationMagnitudestddev     "numeric"  
timeGravityAccelerationMagnitudemean          "numeric"  
timeGravityAccelerationMagnitudestddev        "numeric"  
timeDomainBodyAccelerationJerkMagnitudemean   "numeric"  
timeDomainBodyAccelerationJerkMagnitudestddev "numeric"  
timeDomainBodyGyroscopeMagnitudemean          "numeric"  
timeDomainBodyGyroscopeMagnitudestddev        "numeric"  
timeDomainBodyGyroscopeJerkMagnitudemean      "numeric"  
timeDomainBodyGyroscopeJerkMagnitudestddev    "numeric"  
freqDomainBodyAccelerationmeanX               "numeric"  
freqDomainBodyAccelerationmeanY               "numeric"  
freqDomainBodyAccelerationmeanZ               "numeric"  
freqDomainBodyAccelerationstddevX             "numeric"  
freqDomainBodyAccelerationstddevY             "numeric"  
freqDomainBodyAccelerationstddevZ             "numeric"  
freqDomainBodyAccelerationmeanFreqX           "numeric"  
freqDomainBodyAccelerationmeanFreqY           "numeric"  
freqDomainBodyAccelerationmeanFreqZ           "numeric"  
freqDomainBodyAccelerationJerkmeanX           "numeric"  
freqDomainBodyAccelerationJerkmeanY           "numeric"  
freqDomainBodyAccelerationJerkmeanZ           "numeric"  
freqDomainBodyAccelerationJerkstddevX         "numeric"  
freqDomainBodyAccelerationJerkstddevY         "numeric"  
freqDomainBodyAccelerationJerkstddevZ         "numeric"  
freqDomainBodyAccelerationJerkmeanFreqX       "numeric"  
freqDomainBodyAccelerationJerkmeanFreqY       "numeric"  
freqDomainBodyAccelerationJerkmeanFreqZ       "numeric"  
freqDomainBodyGyroscopemeanX                  "numeric"  
freqDomainBodyGyroscopemeanY                  "numeric"  
freqDomainBodyGyroscopemeanZ                  "numeric"  
freqDomainBodyGyroscopestddevX                "numeric"  
freqDomainBodyGyroscopestddevY                "numeric"  
freqDomainBodyGyroscopestddevZ                "numeric"  
freqDomainBodyGyroscopemeanFreqX              "numeric"  
freqDomainBodyGyroscopemeanFreqY              "numeric"  
freqDomainBodyGyroscopemeanFreqZ              "numeric"  
freqDomainBodyAccelerationMagnitudemean       "numeric"  
freqDomainBodyAccelerationMagnitudestddev     "numeric"  
freqDomainBodyAccelerationMagnitudemeanFreq   "numeric" 


	- 