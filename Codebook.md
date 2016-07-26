# Codebook
Nathan Martinez  
July 23, 2016  



#Codebook for Getting and Cleaning Data Final Project

###The Data
In this project, we were tasked with cleaning up a messy data set containing measurements from a Samsung smartphone gyroscope/accelerometer on 30 different individuals' movements while performing 6 different activities (walking, walking upstairs, walking downstairs, sitting, standing, and lying down).

The measurments for each variable were split into two data sets: `X_train.txt` and `X_test.txt`. The data for the subjects performing each activity and the activities being performed were in the data sets `subject_train.txt`, `subject_test.txt`, `y_train.txt`, and `y_test.txt`. The variable names were in a file called `features.txt`, and the activity names were in a file called `activity_labels.txt`.

First, the two data sets `X_train.txt` and `X_test.txt` had to be imported, and the data for the subjects performing each activity and the activities being performed had to be imported and appended to each data set. Then, the two data sets were merged into one full data set containing all of the data, after which the variable names were imported and added onto the data set as well as the activity labels.

###Transformations Performed in run_analysis.R
In importing the data and transforming it into its final form (`tidy_run_analysis.csv`), several steps were taken which I have outlined below:

* **Import test and training sets.** In this step, I imported all of the data into R.
* **Add subject and activity columns to test and training sets.** In this step, I added subject and activity columns to both the test and training sets. The subject and activity data was also imported from the original set of data sets, as it was given there.
* **Merge test and training sets into full data set.** In this step, I used the `dplyr` function `bind_rows` and `arrange` to create the full data set with both the test and training sets, ordered by subject.
* **Add descriptive names to activity names.** In this step, I used an `ifelse` command to take the activity names from the file given in the main data source and use them as the activity names in my data set in R.
* **Discard all columns that are not measurements of the mean or std.** In this step, I discarded all of the columns that were not measurements of the mean or standard deviation.
* **Rename all variables so that they are descriptive.** In this step, I renamed all of the variable names so that they were more descriptive and less jargon-ic. This was done by using the function `gsub` to find keywords in the variable names and exchange them for their full-word counterparts (e.g. taking `Gyro` and turning it into `Gyroscop`, etc.).
* **Create new tidy data set with mean of each variable for each subject and activity.** In this step, I used a three-part `for` loop (I know, not the best method at all) to take the mean of each variable for each subject and each activity and put it into a new data set that contained only the mean of each variable for each activity for each subject.
* **Save new tidy data set to a .csv file.** In this step, I used the function `write.csv` to write a .csv file with the new tidy data set containing only the mean of each variable for each activity for each subject.

Above is just a brief summary of the steps I took to get from the raw, untouched data to the polished, final data sets. Please take a look at the file titled `run_analysis.R` to get a thorough look at precisely how each transformation was performed.

###Updated Codebook/Variable Information
For the original codebook and variable information, please go to  [link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Below is a list of the new variable names:


```r
colnames(full[-(1:2),])
```

```
##  [1] "subject"                                              
##  [2] "activity"                                             
##  [3] "TimeBodyAccelerometer-Mean-X"                         
##  [4] "TimeBodyAccelerometer-Mean-Y"                         
##  [5] "TimeBodyAccelerometer-Mean-Z"                         
##  [6] "TimeBodyAccelerometer-Std-X"                          
##  [7] "TimeBodyAccelerometer-Std-Y"                          
##  [8] "TimeBodyAccelerometer-Std-Z"                          
##  [9] "TimeGravityAccelerometer-Mean-X"                      
## [10] "TimeGravityAccelerometer-Mean-Y"                      
## [11] "TimeGravityAccelerometer-Mean-Z"                      
## [12] "TimeGravityAccelerometer-Std-X"                       
## [13] "TimeGravityAccelerometer-Std-Y"                       
## [14] "TimeGravityAccelerometer-Std-Z"                       
## [15] "TimeBodyAccelerometerJerk-Mean-X"                     
## [16] "TimeBodyAccelerometerJerk-Mean-Y"                     
## [17] "TimeBodyAccelerometerJerk-Mean-Z"                     
## [18] "TimeBodyAccelerometerJerk-Std-X"                      
## [19] "TimeBodyAccelerometerJerk-Std-Y"                      
## [20] "TimeBodyAccelerometerJerk-Std-Z"                      
## [21] "TimeBodyGyroscope-Mean-X"                             
## [22] "TimeBodyGyroscope-Mean-Y"                             
## [23] "TimeBodyGyroscope-Mean-Z"                             
## [24] "TimeBodyGyroscope-Std-X"                              
## [25] "TimeBodyGyroscope-Std-Y"                              
## [26] "TimeBodyGyroscope-Std-Z"                              
## [27] "TimeBodyGyroscopeJerk-Mean-X"                         
## [28] "TimeBodyGyroscopeJerk-Mean-Y"                         
## [29] "TimeBodyGyroscopeJerk-Mean-Z"                         
## [30] "TimeBodyGyroscopeJerk-Std-X"                          
## [31] "TimeBodyGyroscopeJerk-Std-Y"                          
## [32] "TimeBodyGyroscopeJerk-Std-Z"                          
## [33] "TimeBodyAccelerometerMagnitude-Mean"                  
## [34] "TimeBodyAccelerometerMagnitude-Std"                   
## [35] "TimeGravityAccelerometerMagnitude-Mean"               
## [36] "TimeGravityAccelerometerMagnitude-Std"                
## [37] "TimeBodyAccelerometerJerkMagnitude-Mean"              
## [38] "TimeBodyAccelerometerJerkMagnitude-Std"               
## [39] "TimeBodyGyroscopeMagnitude-Mean"                      
## [40] "TimeBodyGyroscopeMagnitude-Std"                       
## [41] "TimeBodyGyroscopeJerkMagnitude-Mean"                  
## [42] "TimeBodyGyroscopeJerkMagnitude-Std"                   
## [43] "FrequencyBodyAccelerometer-Mean-X"                    
## [44] "FrequencyBodyAccelerometer-Mean-Y"                    
## [45] "FrequencyBodyAccelerometer-Mean-Z"                    
## [46] "FrequencyBodyAccelerometer-Std-X"                     
## [47] "FrequencyBodyAccelerometer-Std-Y"                     
## [48] "FrequencyBodyAccelerometer-Std-Z"                     
## [49] "FrequencyBodyAccelerometer-MeanFrequency-X"           
## [50] "FrequencyBodyAccelerometer-MeanFrequency-Y"           
## [51] "FrequencyBodyAccelerometer-MeanFrequency-Z"           
## [52] "FrequencyBodyAccelerometerJerk-Mean-X"                
## [53] "FrequencyBodyAccelerometerJerk-Mean-Y"                
## [54] "FrequencyBodyAccelerometerJerk-Mean-Z"                
## [55] "FrequencyBodyAccelerometerJerk-Std-X"                 
## [56] "FrequencyBodyAccelerometerJerk-Std-Y"                 
## [57] "FrequencyBodyAccelerometerJerk-Std-Z"                 
## [58] "FrequencyBodyAccelerometerJerk-MeanFrequency-X"       
## [59] "FrequencyBodyAccelerometerJerk-MeanFrequency-Y"       
## [60] "FrequencyBodyAccelerometerJerk-MeanFrequency-Z"       
## [61] "FrequencyBodyGyroscope-Mean-X"                        
## [62] "FrequencyBodyGyroscope-Mean-Y"                        
## [63] "FrequencyBodyGyroscope-Mean-Z"                        
## [64] "FrequencyBodyGyroscope-Std-X"                         
## [65] "FrequencyBodyGyroscope-Std-Y"                         
## [66] "FrequencyBodyGyroscope-Std-Z"                         
## [67] "FrequencyBodyGyroscope-MeanFrequency-X"               
## [68] "FrequencyBodyGyroscope-MeanFrequency-Y"               
## [69] "FrequencyBodyGyroscope-MeanFrequency-Z"               
## [70] "FrequencyBodyAccelerometerMagnitude-Mean"             
## [71] "FrequencyBodyAccelerometerMagnitude-Std"              
## [72] "FrequencyBodyAccelerometerMagnitude-MeanFrequency"    
## [73] "FrequencyBodyAccelerometerJerkMagnitude-Mean"         
## [74] "FrequencyBodyAccelerometerJerkMagnitude-Std"          
## [75] "FrequencyBodyAccelerometerJerkMagnitude-MeanFrequency"
## [76] "FrequencyBodyGyroscopeMagnitude-Mean"                 
## [77] "FrequencyBodyGyroscopeMagnitude-Std"                  
## [78] "FrequencyBodyGyroscopeMagnitude-MeanFrequency"        
## [79] "FrequencyBodyGyroscopeJerkMagnitude-Mean"             
## [80] "FrequencyBodyGyroscopeJerkMagnitude-Std"              
## [81] "FrequencyBodyGyroscopeJerkMagnitude-MeanFrequency"    
## [82] "angle(TimeBodyAccelerometerMean,gravity)"             
## [83] "angle(TimeBodyAccelerometerJerkMean),gravityMean)"    
## [84] "angle(TimeBodyGyroscopeMean,gravityMean)"             
## [85] "angle(TimeBodyGyroscopeJerkMean,gravityMean)"         
## [86] "angle(X,gravityMean)"                                 
## [87] "angle(Y,gravityMean)"                                 
## [88] "angle(Z,gravityMean)"
```

Understanding each variable is simple; their names are very descriptive and include keywords that indicate what each variable captures. I will expand on those keywords here:

**Prefixes:**
The following two words, when at the beginning of a variable name, have the following significance:

* *Time* this keyword means that that variable's units are measured in time (seconds)
* *Frequency* this keyword means that that variable is a measurement of frequency (hertz)
* *angle* this keyword means that the variable is an angle between two vectors, with the two vectors listed after the word *angle*

**Measurement Tools:**
The following two words, when used in a variable's name, indicate what tool was used to capture that variable's measurement:

* *Accelerometer* this keyword means that the variable was captured using the Samsung's accelerometer
* *Gyroscope* this keyword means that the variable was captured using the Samsung's gyroscope

**Std and Mean:**
The following two keywords denote between a measurement that is an average (mean) and a measurement that is a standard deviation (std):

* *Mean* this variable is the mean of its measurement
* *Std* this variable is the standard deviation of its measurement

**Others:**
Below are various other variable keywords that did not fit into the previous categories:

* *Jerk* this variable is a measurement of jerk (the derivative of acceleration with respect to time)
* *Body* this variable is a measurement taken from the person's body
* *Gravity* this variable is a measurement of the effect of gravity
* *Magnitude* this variable is an absolute value measurment
