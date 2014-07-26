datadir  <-"UCI HAR Dataset"

trainx<-read.table( paste(datadir,"train/X_train.txt", sep="/") )
testx<-read.table(paste(datadir,"test/X_test.txt", sep="/"))
trainy<-read.table(paste(datadir,"train/y_train.txt", sep="/"))
testy<-read.table(paste(datadir,"test/y_test.txt", sep="/"))
Subject_train<-read.table(paste(datadir,"train/subject_train.txt", sep="/"))
Subject_test<-read.table(paste(datadir,"test/subject_test.txt", sep="/"))
activity_lables<-read.table(paste(datadir,"activity_labels.txt", sep="/"))
features<-read.table(paste(datadir,"features.txt", sep="/"))

#Union the training and the test sets
allx<-rbind(trainx,testx)
ally<-rbind(trainy,testy)

#Extracts only mean and standard deviation for each measurement.
colnames(allx) <- c(as.character(features[,2]))

mean_sd<-grep("mean|std",colnames(allx))

MeanSD<-allx[,mean_sd]

#Uses descriptive activity names to name the activities in the data set.
all_activity<-cbind(ally,MeanSD)

colnames(all_activity)[1] <- "Activity"

#labels the data set with descriptive activity names.
activity_lables[,2]<-as.character(activity_lables[,2])

for(i in 1:length(all_activity[,1])){
  all_activity[i,1]<-activity_lables[all_activity[i,1],2]
}

#Creates a tidy data set with the average of each variable for each activity and each subject.

Subject_all<-rbind(Subject_train,Subject_test)

all<-cbind(Subject_all,all_activity)

colnames(all)[1] <- "Subject"

tidy <- aggregate( all[,3] ~ Subject+Activity, data = all, FUN= "mean" )

for(i in 4:ncol(all)){
  tidy[,i] <- aggregate( all[,i] ~ Subject+Activity, data = all, FUN= "mean" )[,3]
}

colnames(tidy)[3:ncol(tidy)] <- colnames(MeanSD)

write.table(tidy, file = paste(datadir, "tidydata.txt", sep="/"))
