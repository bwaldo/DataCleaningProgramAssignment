# CodeBook

Full description of the data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Library used: dplyr

Aquire and and save data to local working directgory
  * The data has been unziped and placed in the local working directory for processing
Load the below files into data frames
  * activity_labels
  * features
  * X_test
  * Y_test
  * subject_test
  * X_train
  * Y_train
  * subject_train
  
1. Merges the training and the test sets to create one data set by columns.
  Note: Merge the data together using dplyr bind_col (single arguemnt containing a list of data frames)
  * combined the training data xTrain & yTrain and subjectTrain into trainingData
  * combined the testing data xTest, yTest and testingData into testingData
  * cominded the above 2 datasets into the FullDataSet that will be the main data set used for the rest of the script.

2. Extracts only the measurements on the mean and standard deviation for each measurement.
  * tidy up the dataset for simplicity for later use
  * select everything from the second column and change -std to std
  * select everything from the second column and change -mean to mean
  * select everything from the second column and remove -()
  * get the columns that have Mean or Std

3. Uses descriptive activity names to name the activities in the data set
  * Add the subject and activity columns
  
4. Appropriately labels the data set with descriptive variable names.
  * Changed labels to be more appropriate and readable
  * Changed column names to lower case

5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
    The name of the file is tidy.txt and is a tab delimited file
  * created a second data set using the aggregate function
  * sorted the data
  * created file named tidy.txt
  
## Tidy Data guidlines were followed in creating tidy.txt 

