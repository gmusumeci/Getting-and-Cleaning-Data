---
title: "README.md"
author: "Giuseppe Musumeci"
date: "Wednesday, September 10, 2014"
---

The purpose of this project is to work with the following data set:
**https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip** 
The goal is to prepare a script for an output of tidy data that can be used for later analysis. 
The script called run_analysis.R  does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each     activity and each subject.

__The R wd() must be set as parent of data storage directory__