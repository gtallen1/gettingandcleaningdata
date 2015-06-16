#merge test and training data sets
subjectTrain<-read.table('./data/subject_train.txt')
dataTrain<-read.table('./data/X_train.txt')
labelTrain<-read.table('./data/y_train.txt')
subjectTest<-read.table('./data/subject_test.txt')
dataTest<-read.table('./data/X_test.txt')
labelTest<-read.table('./data/y_test.txt') 
mergeData<-rbind(dataTrain, dataTest)
mergeLabel<-rbind(labelTrain, labelTest)
mergeSubject<-rbind(subjectTrain, subjectTest)

#extract mean and standard deviation measurements
features<-read.table('./data/features.txt')
meanStdIndices<-grep('mean\\(\\)|std\\(\\)',features[,2])
mergeData<-mergeData[,meanStdIndices]

#label data set with descriptive variable names
names(mergeData)<-gsub('\\(\\)','',features[meanStdIndices,2])
names(mergeData)<-gsub('-','',names(mergeData)) 
names(mergeData)<-gsub('mean','Mean',names(mergeData))
names(mergeData)<-gsub('std','Std',names(mergeData))

#use descriptive activity names for activities in data set
activity<-read.table('./data/activity_labels.txt')
activity[,2]<-gsub("", "",activity[,2])
activityLabel<-activity[mergeLabel[,1],2]
mergeLabel[,1]<-activityLabel
names(mergeLabel)<-'Activity'
names(mergeSubject)<-'Subject'

#combine files
cleanData<-cbind(mergeSubject,mergeLabel,mergeData)
#write.table(cleanData,'merge_data.txt')

#create tidy data set with averages
subjectLen<-length(table(mergeSubject))
activityLen<-dim(activity)[1]
variableLen<-dim(cleanData)[2]
aveData<-matrix(,nrow=subjectLen*activityLen,ncol=variableLen) 
aveData<-as.data.frame(aveData)
colnames(aveData)<-colnames(cleanData)
r<-1
for(i in 1:subjectLen){
  for(j in 1:activityLen){
    aveData[r,1]<-sort(unique(mergeSubject)[,1])[i]
    aveData[r,2]<-activity[j,2]
    l1<-i==cleanData$Subject
    l2<-activity[j,2]==cleanData$Activity
    aveData[r,3:variableLen]<-colMeans(cleanData[l1&l2,3:variableLen])
    r<-r+1
  }
}

aveData[1:20,1:5]
write.table(aveData,'./data/ave_data.txt',row.name=FALSE)
#write.table(aveData,'./data/ave_data2.txt')

tidyData<-read.table('./data/ave_data.txt')
tidyData[1:20, 1:5]
