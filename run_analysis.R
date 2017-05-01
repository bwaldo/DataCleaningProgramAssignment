library(dplyr)

# load the lable names
activityNames <- read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
featuresNames  <- read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)

# load training data
xTrain <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
yTrain <- read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
subjectTrain <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

# load testing data
xTest <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
yTest <- read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
subjectTest <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

# check the load
#print(activityNames, row.names = TRUE)
#print(featuresNames, row.names = TRUE)
#print(xTrain, row.names = TRUE)
#print(yTrain, row.names = TRUE)
#print(subjectTrain, row.names = TRUE)
#print(xTest, row.names = TRUE)
#print(yTest, row.names = TRUE)
#print(subjectTest, row.names = TRUE)
#dim(xTrain)
#dim(yTrain)
#dim(subjectTrain)
#dim(xTest)
#dim(yTest)
#dim(subjectTest)

# 1. Merges the training and the test sets to create one data set.
trainingData <- bind_cols(list(xTrain,yTrain,subjectTrain))
testingData <- bind_cols(xTest,yTest,subjectTest)

# Merge both sets together to create one full data set to use going forward
FullDataSet <- rbind(trainingData,testingData)

#check the merge
#print(FullDataSet, row.names=TRUE)
#dim(trainingData)
#dim(testingData)
#dim(FullDataSet)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#  tidy up the dataset for simplicity for later use
# select everything from the second column and change -std to std
featuresNames[,2] = gsub("-std", "std", featuresNames[,2])

# select everything from the second column and change -mean to mean
featuresNames[,2] = gsub("mean", "mean", featuresNames[,2])

# select everything from the second column and remove -()
featuresNames[,2] = gsub("[-()]", "", featuresNames[,2])

# get the columns that have mean or std
finalCols <- grep(".*mean.*|.*std.*", featuresNames[,2])
finalFeatures <- featuresNames[finalCols,]
finalCols <- union(finalCols, c(562, 563))

# Limit/Remove those columns.
finalData <- FullDataSet[,finalCols]

#check the final data columns
#print(finalData, row.names=TRUE)

# 3. Uses descriptive activity names to name the activities in the data set
colnames(finalData) <- c(finalFeatures$V2, "Activity", "Subject")

# 4. Appropriately labels the data set with descriptive variable names
names(finalData) <- gsub("^t", "time" , names(finalData))
names(finalData) <- gsub("^f", "frequency", names(finalData))
names(finalData) <- gsub(".*freq", "frequency", names(finalData))
names(finalData) <- gsub(".*Acc", "Accelerometer", names(finalData))
names(finalData) <- gsub("Gyro", "Gyroscope", names(finalData))
names(finalData) <- gsub("Mag", "Magnitude", names(finalData))
names(finalData) <- gsub("BodyBody", "Body", names(finalData))

# tidy data requires lower case column names
colnames(finalData) <- tolower(colnames(finalData))

# check
  # names(finalData)

# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
meanData  <- aggregate(finalData, by=list(activity=finalData$activity, subject=finalData$subject), mean)

# sort the data
meanData <- meanData[order(meanData$subject,meanData$activity),]

# write out final file for submission.  
write.table(meanData, file= "tidy.txt", sep="\t", row.name=FALSE)

# get output varialbes for codebook
# names(finalData)
