#Getting and Cleaning Data - Course Project

*This project is primarily an exercise in data arrangement and mutation. It uses the Human Activity Recognition Using Smartphones Data Set from the UCI Machine Learning Repository. The original data set can be found at the following link.*
[Human Activity Recognition Using Smartphones](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

The bulk of this project is an R script called run_analysis.R. This script assumes that the above data set has been unpacked and that certain files have been moved to the working directory. The files that need to be moved to the working directory are:
* x_train.txt
* x_test.txt
* y_train.txt
* y_test.txt
* subject_test.txt
* subject_train.txt
* features.txt
* activity_labels.txt

In summary, this script will aggregate the data to merge testing and training sets. It will drop most of the original data unless it pertains to the mean or standard deviation measurements. Lastly, it will return an output file called averageData.txt which is the average value of the original mean and standard deviation measurements. 