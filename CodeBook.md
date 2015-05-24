#CodeBook - Getting and Cleaning Data - Course Project

##Summary

The run_analysis.R script performs 5 general steps (with intermediate steps in between) to go from the raw UCI lab data to the output file averageData.txt. 

There are file pairs in the UCI data set that are split across testing and training sets. These data file pairs are otherwise similar in content and number of columns. I am referring to:
* x_train.txt & x_test.txt
* y_train.txt & y_test.txt
* subject_train.txt & subject_test.txt

These files are merged via the rbind() function.

Next, column names that contain 'mean' or 'txt' are extracted from features.txt, and applied to the data. 

Next, activity names are extracted from activity_labels.txt and applied to the activity indices in the data set. 

Next, more descriptive column names are applied to the columns that have vague titles.

Next, the data, labels, and subject columns are merged together via the cbind() function to create one tidy dataset.

Lastly, run_analysis.R outputs a data frame that takes the average of the columns in the tidy dataset. 

