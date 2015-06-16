#Getting and Cleaning Data - README

The run_analysis script can be sub-divided into several sections:

1. The read.table function is used to read the six subject, test and
training sets into the properly named variables.

2. The train and test data sets are then merged.

3. An index file of mean and standard deviation logic codes is created.

4. The merged data file is then updated to only include the indexed records.

5. Regular expressions are used to format descriptive variable and
activity names in the dataset.

6. Files are combined for a complete tidy dataset.

7. A routine is then run to create a second tidy dataset with the average of each variable for each activity and each subject.

8. An output text file is created from the second file.

9. An additional optional step will read the second file and print out
a number of records from the beginning of the file.
