
This file describes the variables, the data, and any transformations or work done to clean up the data.


### Merges the training and the test sets to create one data set.
- Download the dataset and extract under the file `UCI HAR Dataset`
- `x_train` :7352 rows, 561 columns  
*training set*

- `y_train` :7352 rows, 1 column  
*training labels*

- `subject_train` :7352 rows, 1 column  
*Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. *

- `x_test` :2947 rows, 561 columns  
*test set*

- `y_test` :2947 rows, 1 column  
*test labels*

- `subject_test` :2947 rows, 1 column  
*Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. *

- `rawdata` :10299 rows, 563 columns  
*The dataset consists of training data and test data.*

### Extracts only the measurements on the mean and standard deviation for each measurement.
- `features` :1 row, 561 columns  
*names of the measurements*

- `featureIndex` :1 row, 66 columns  
*names of the measurements on the mean and standard deviation*

- `data` :10299 rows, 68 columns  
*select `subject`, `activity` and the measurements on the mean and standard deviation*

### Uses descriptive activity names to name the activities in the data set.
- `data$activity <- factor()`  
*change the numbers in `activity` column into the name of activities*

### Appropriately labels the data set with descriptive variable names.
- Use `gsub` to rename the columns:
    + All start with `t` replaced by `Time`
    + All start with `f` replaced by `Frequency`
    + All `Acc` replaced by `Accelerometer`
    + All `Gyro` replaced by `Gyroscope`
    + All `Mag` replaced by `Magnitude`
    + All brackets removed

### From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- Use `group_by` to group the `data` and then use `summarise_all` to find the average of each variable for each activity and each subject. 
- `tidydata` : 180 rows, 68 columns
- `write.table(tidydata, "./MeanData.txt", row.names = FALSE)` : export `tidydata` to the `MeanData.txt` file