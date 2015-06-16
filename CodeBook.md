Getting and Cleaning Data - CodeBook

variables for loading data:
1. subjectTrain     loads subject_train.txt
2. dataTrain        loads X_train.txt
3. labelTrain       loads y_train.txt
4. subjectTest      loads subject_test.txt
5. dataTest         loads X_test.txt
6. labelTest        loads y_test.txt
7. features         loads features.txt
8. activity         loads activity_labels.txt

variables for merging data:
1. mergeData        merges dataTrain and dataTest
2. mergeLabel       merges labelTrain and labelTest
3. mergeSubject     merges subjectTrain and subjectTest

variable for creating mean and standard deviation index file:
1. meanStdIndices

variable for activity label:
1. activityLabel

variables for the tidy data files, which are the merged subject,
    label, and data files
1. cleanData        initial complete file
2. aveData          final average data file

Data files used in this project:
1. features.txt         List of all features
2. activity_labels.txt  Links the class labels with their activity name
3. subject_train.txt    Each row identifies the subject who performed
                        the activity for each window sample.
                        Its range is from 1 to 30.
4. subject_test.txt     Same as subject_train.txt
5. X_train.txt          Training set
6. y_train.txt          Training labels
7. X_text.txt           Test set
8. y_test.txt           Test labels

Transformations:
1. Test and training sets merged
2. Mean and standard deviation measurements extracted
3. Activity and variable names given descriptive labels
4. Tidy data sets created - complete and average values
