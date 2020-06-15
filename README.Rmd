---
title: "Getting and Cleaning Data Project"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

This repository is a course project for the Getting and Cleaning Data. 

## Source
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.

And the raw data of the project is from:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.

## File
- `run_analysis.R` can be run as long as the Samsung data is in your working directory. It does 5 steps according to the requirement:
    + Merges the training and the test sets to create one data set.
    + Extracts only the measurements on the mean and standard deviation for each measurement.
    + Uses descriptive activity names to name the activities in the data set.
    + Appropriately labels the data set with descriptive variable names.
    + From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

- `CodeBook.md` describes the variables, the data, and any transformations or work that I performed to clean up the data.

- `MeanData.txt` is the output from `run_analysis.R`.




