#---------------------------------------------------------------
#Store temporarily files to be read in memory
#---------------------------------------------------------------
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
Subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
Subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
activity_lables<-read.table("./UCI HAR Dataset/activity_labels.txt")
features<-read.table("./UCI HAR Dataset/features.txt")

#---------------------------------------------------------------
#Merges the training and the test sets to create one data set.
#-----------------------------------------------------------------
X<-rbind(X_train,X_test)

#---------------------------------------------------------------
#Set the names of the columns for the data set
#---------------------------------------------------------------
colnames(X) <- c(as.character(features[,2]))

#---------------------------------------------------------------
#Extracts only the measurements on the mean and standard deviation for each record
#---------------------------------------------------------------
Mean<-grep("mean()",colnames(X),fixed=TRUE)
SD<-grep("std()",colnames(X),fixed=TRUE)

#---------------------------------------------------------------
#Create a data.frame using Mean and SD
#---------------------------------------------------------------
Mean_SD<-X[,c(Mean,SD)]

#---------------------------------------------------------------
#Uses descriptive activity names to name the activities in the data set.
#---------------------------------------------------------------
Y<-rbind(y_train,y_test)
Extraction<-cbind(Y,Mean_SD)
colnames(Extraction)[1] <- "Activity"

#---------------------------------------------------------------
#Labels the data set with descriptive activity names.
#---------------------------------------------------------------
activity_lables[,2]<-c(as.character(activity_lables[,2]))

for(i in 1:length(Extraction[,1])){
        Extraction[i,1]<-activity_lables[Extraction[i,1],2]
}

#---------------------------------------------------------------
#Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#---------------------------------------------------------------
Subject<-rbind(Subject_train,Subject_test)

Set2<-cbind(Subject,Extraction)

colnames(Set2)[1] <- "Subject"

#---------------------------------------------------------------
#Aggregate data for each activity and each subject.
#--------------------------------------------------------------
aggrec<-aggregate(Set2[,3:ncol(Set2)], Set2[,1:2], mean)

#---------------------------------------------------------------
#Write output
#--------------------------------------------------------------
write.table(aggrec, file = "output.txt",row.names=FALSE)

#Final<-read.table("./output.txt")