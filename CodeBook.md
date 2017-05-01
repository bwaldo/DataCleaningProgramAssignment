# CodeBook

Full description of the data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#### Library used: dplyr

### Aquire and and save data to local working directgory
  * The data has been unziped and placed in the local working directory for processing
### Load the below files into data frames
  * activity_labels
  * features
  * X_test
  * Y_test
  * subject_test
  * X_train
  * Y_train
  * subject_train
  
### 1. Merges the training and the test sets to create one data set by columns.
  Note: Merge the data together using dplyr bind_col (single arguemnt containing a list of data frames)
  * combined the training data xTrain & yTrain and subjectTrain into trainingData
  * combined the testing data xTest, yTest and testingData into testingData
  * cominded the above 2 datasets into the FullDataSet that will be the main data set used for the rest of the script.

### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
  * tidy up the dataset for simplicity for later use
  * select everything from the second column and change -std to std
  * select everything from the second column and change -mean to mean
  * select everything from the second column and remove -()
  * get the columns that have Mean or Std

### 3. Uses descriptive activity names to name the activities in the data set
  * Add the subject and activity columns
  
### 4. Appropriately labels the data set with descriptive variable names.
  * Changed labels to be more appropriate and readable
  * Changed column names to lower case

### 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
    The name of the file is tidy.txt and is a tab delimited file
  * created a second data set using the aggregate function
  * sorted the data
  * created file named tidy.txt
  
## Tidy Data guidlines were followed in creating tidy.txt 

# Output variables
names(meanData)
 [1] "activity"                                         "subject"                                         
 [3] "accelerometermeanx"                               "accelerometermeany"                              
 [5] "accelerometermeanz"                               "accelerometerstdx"                               
 [7] "accelerometerstdy"                                "accelerometerstdz"                               
 [9] "accelerometermeanx"                               "accelerometermeany"                              
[11] "accelerometermeanz"                               "accelerometerstdx"                               
[13] "accelerometerstdy"                                "accelerometerstdz"                               
[15] "accelerometerjerkmeanx"                           "accelerometerjerkmeany"                          
[17] "accelerometerjerkmeanz"                           "accelerometerjerkstdx"                           
[19] "accelerometerjerkstdy"                            "accelerometerjerkstdz"                           
[21] "timebodygyroscopemeanx"                           "timebodygyroscopemeany"                          
[23] "timebodygyroscopemeanz"                           "timebodygyroscopestdx"                           
[25] "timebodygyroscopestdy"                            "timebodygyroscopestdz"                           
[27] "timebodygyroscopejerkmeanx"                       "timebodygyroscopejerkmeany"                      
[29] "timebodygyroscopejerkmeanz"                       "timebodygyroscopejerkstdx"                       
[31] "timebodygyroscopejerkstdy"                        "timebodygyroscopejerkstdz"                       
[33] "accelerometermagnitudemean"                       "accelerometermagnitudestd"                       
[35] "accelerometermagnitudemean"                       "accelerometermagnitudestd"                       
[37] "accelerometerjerkmagnitudemean"                   "accelerometerjerkmagnitudestd"                   
[39] "timebodygyroscopemagnitudemean"                   "timebodygyroscopemagnitudestd"                   
[41] "timebodygyroscopejerkmagnitudemean"               "timebodygyroscopejerkmagnitudestd"               
[43] "accelerometermeanx"                               "accelerometermeany"                              
[45] "accelerometermeanz"                               "accelerometerstdx"                               
[47] "accelerometerstdy"                                "accelerometerstdz"                               
[49] "accelerometermeanfreqx"                           "accelerometermeanfreqy"                          
[51] "accelerometermeanfreqz"                           "accelerometerjerkmeanx"                          
[53] "accelerometerjerkmeany"                           "accelerometerjerkmeanz"                          
[55] "accelerometerjerkstdx"                            "accelerometerjerkstdy"                           
[57] "accelerometerjerkstdz"                            "accelerometerjerkmeanfreqx"                      
[59] "accelerometerjerkmeanfreqy"                       "accelerometerjerkmeanfreqz"                      
[61] "frequencyuencybodygyroscopemeanx"                 "frequencyuencybodygyroscopemeany"                
[63] "frequencyuencybodygyroscopemeanz"                 "frequencyuencybodygyroscopestdx"                 
[65] "frequencyuencybodygyroscopestdy"                  "frequencyuencybodygyroscopestdz"                 
[67] "frequencyuencybodygyroscopemeanfreqx"             "frequencyuencybodygyroscopemeanfreqy"            
[69] "frequencyuencybodygyroscopemeanfreqz"             "accelerometermagnitudemean"                      
[71] "accelerometermagnitudestd"                        "accelerometermagnitudemeanfreq"                  
[73] "accelerometerjerkmagnitudemean"                   "accelerometerjerkmagnitudestd"                   
[75] "accelerometerjerkmagnitudemeanfreq"               "frequencyuencybodygyroscopemagnitudemean"        
[77] "frequencyuencybodygyroscopemagnitudestd"          "frequencyuencybodygyroscopemagnitudemeanfreq"    
[79] "frequencyuencybodygyroscopejerkmagnitudemean"     "frequencyuencybodygyroscopejerkmagnitudestd"     
[81] "frequencyuencybodygyroscopejerkmagnitudemeanfreq" "activity"                                        
[83] "subject"  
