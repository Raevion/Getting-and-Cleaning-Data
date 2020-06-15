#1.Merges the training and the test sets to create one data set.
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
data_train <- cbind(subject_train,y_train,x_train)
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
data_test <- cbind(subject_test,y_test,x_test)
rawdata <- rbind(data_train,data_test)

#2.Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("./UCI HAR Dataset/features.txt",stringsAsFactors = FALSE)[,2]
featureIndex <- grep("mean\\(\\)|std\\(\\)", features)
data <- rawdata[,c(1,2,featureIndex + 2)]
colnames(data) <- c("subject", "activity", features[featureIndex])

#3.Uses descriptive activity names to name the activities in the data set.
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
data$activity <- factor(data$activity, levels = activities[,1], labels = activities[,2])

#4.Appropriately labels the data set with descriptive variable names.
names(data) <- gsub("^t","Time",names(data))
names(data) <- gsub("^f","Frequency",names(data))
names(data) <- gsub("Acc","Accelerometer",names(data))
names(data) <- gsub("Gyro","Gyroscope",names(data))
names(data) <- gsub("Mag","Magnitude",names(data))
names(data) <- gsub("BodyBody","Body",names(data))
names(data) <- gsub("\\(\\)","",names(data))

#5.From the data set in step 4, creates a second, independent tidy data set with the average #of each variable for each activity and each subject.
library(dplyr)
tidydata <- data %>% group_by(subject, activity) %>% summarise_all(funs(mean))
write.table(tidydata, "./MeanData.txt", row.names = FALSE)
