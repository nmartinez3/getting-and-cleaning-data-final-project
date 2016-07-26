#importing all the data
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")

X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")

#rename the obvious variables
names(subject_train)[1]<-"subject"
names(subject_test)[1]<-"subject"
names(y_train)[1]<-"activity"
names(y_test)[1]<-"activity"

#merge into test and train sets
require(dplyr)
train<-bind_cols(subject_train,y_train,X_train)
test<-bind_cols(subject_test,y_test,X_test)

#merge into full data set
full<-bind_rows(train,test)
full<-full %>% arrange(subject,activity)

#renaming activities
activity_labels<-read.table("~/RWD/UCI HAR Dataset/activity_labels.txt",stringsAsFactors = FALSE)
act_labs<-activity_labels[,2]
full$activity<-ifelse(full$activity==1,act_labs[1],
                      ifelse(full$activity==2,act_labs[2],
                             ifelse(full$activity==3,act_labs[3],
                                    ifelse(full$activity==4,act_labs[4],
                                           ifelse(full$activity==5,act_labs[5],act_labs[6])))))

#renaming features
features<-read.table("~/RWD/UCI HAR Dataset/features.txt",stringsAsFactors = FALSE)
colnames(full)[3:563]<-features[,2]

#extracting only mean and std related variables
keep<-grep("Mean|mean|std",colnames(full))
full<-full[,c(1,2,keep)]

#descriptively naming variables
colnames(full)<-gsub("mean\\(\\)|mean","Mean",colnames(full))
colnames(full)<-gsub("std\\(\\)|std","Std",colnames(full))
colnames(full)<-gsub("Freq\\(\\)","Frequency",colnames(full))
colnames(full)<-gsub("^t","Time",colnames(full))
colnames(full)<-gsub("^f","Frequency",colnames(full))
colnames(full)<-gsub("Acc","Accelerometer",colnames(full))
colnames(full)<-gsub("Mag","Magnitude",colnames(full))
colnames(full)<-gsub("tBody","TimeBody",colnames(full))
colnames(full)<-gsub("BodyBody","Body",colnames(full))
colnames(full)<-gsub("Gyro","Gyroscope",colnames(full))

#getting mean() for each variable
maindata<-data.frame()
for(i in unique(full$subject)){
      tempdata<-data.frame()
      for(j in unique(full$activity)){
            prep<-full %>% filter(subject==i&activity==j)
            means<-prep[1,]
            for(k in 3:ncol(prep)){
                  means[,k]<-mean(prep[,k])
            }
            tempdata<-bind_rows(tempdata,means)
      }
      maindata<-bind_rows(maindata,tempdata)
}

#making new tidy data set with mean for each variable per person per activity
write.table(maindata,file="tidy_run_analysis.txt",row.names = FALSE)