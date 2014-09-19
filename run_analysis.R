##Function created to stitch data together to create a tidy data set.
##Data includes motion information from wearable technology

run_analysis<- function(){
  
  feat<-read.table("data/features.txt")
  ###
  #Read in test data
  ###
  x<-read.table("data/test/X_test.txt")
  y<-read.table("data/test/y_test.txt")
  s<-read.table("data/test/subject_test.txt")
  colnames(x)<-feat$V2
  colnames(y)<-"Activity ID"
  colnames(s)<-"Subject"
  
  
  #extract only the mean and standard deviation columns
  Cols<-c(grep("mean()",feat$V2, fixed=TRUE),grep("std()",feat$V2, fixed=TRUE))
  x<-x[,Cols]
  #append columns
  test<-cbind(s,y,x)
  
  ####
  #Read in train data
  ####
  x<-read.table("data/train/X_train.txt")
  y<-read.table("data/train/y_train.txt")
  s<-read.table("data/train/subject_train.txt")
  colnames(x)<-feat$V2
  colnames(y)<-"Activity ID"
  colnames(s)<-"Subject"
  
  
  #extract only the mean and standard deviation columns
  Cols<-c(grep("mean()",feat$V2, fixed=TRUE),grep("std()",feat$V2, fixed=TRUE))
  x<-x[,Cols]
  
  #append columns
  train<-cbind(s,y,x)
  
  #cobmine datasets
  data<-rbind(test,train)
  
  #add activity label references
  lab<-read.table("data/activity_labels.txt")
  colnames(lab)<-c("Activity ID","Activity")
  data<-merge(data,lab,by="Activity ID" )
  
  #write tidy data to a file
  write.table(data,"TidyDataStep4.txt", row.names=FALSE)
  

  data2<-aggregate(data, by=list(data$Activity), mean)
  write.table(data2,"TidyDataStep5.txt", row.names=FALSE)
  
  #return Tidy data
  data
}
