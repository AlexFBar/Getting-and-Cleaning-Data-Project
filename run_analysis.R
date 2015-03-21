## This script create a tidy data set fom Samsung Galaxy S data
## To use, execute this script in R on working directory where "UCI HAR Dataset" directory was created.

##Step1 - Merges the training and the test sets to create one data set with labels of descriptive variable names. 
        ##Load all information on datasets
        trainingSet<-read.table(sprintf("%s/%s/%s",getwd(),"UCI HAR Dataset/train","X_train.txt"))
        testSet<-read.table(sprintf("%s/%s/%s",getwd(),"UCI HAR Dataset/test","X_test.txt"))
        trainingSubject<-read.table(sprintf("%s/%s/%s",getwd(),"UCI HAR Dataset/train","subject_train.txt"))
        testSubject<-read.table(sprintf("%s/%s/%s",getwd(),"UCI HAR Dataset/test","subject_test.txt"))
        trainingActivity<-read.table(sprintf("%s/%s/%s",getwd(),"UCI HAR Dataset/train","Y_train.txt"))
        testActivity<-read.table(sprintf("%s/%s/%s",getwd(),"UCI HAR Dataset/test","Y_test.txt"))
        variableLabels<-read.table(sprintf("%s/%s/%s",getwd(),"UCI HAR Dataset","features.txt"))
        activityLabels<-read.table(sprintf("%s/%s/%s",getwd(),"UCI HAR Dataset","activity_labels.txt"))
        
        ##Bind relative information in two datasets (training and test)
        trainingSet<-cbind(trainingSubject,trainingActivity,trainingSet)
        testSet<-cbind(testSubject,testActivity,testSet)
        
        ##Appropriately labels the data set with descriptive variable names
        colnames(trainingSet)<-c("Subject","Activity",as.vector(variableLabels[,2]))
        colnames(testSet)<-c("Subject","Activity",as.vector(variableLabels[,2]))

        ##Merge de two completed datasets (trainig and test) 
        theOneSet<-rbind(trainingSet,testSet)

##Step2 - Extracts only the measurements on the mean and standard deviation for each measurement.
        theOneSet2<-theOneSet[,c(1,2,grep("mean()",as.vector(names(theOneSet)),fixed=T),grep("std()",as.vector(names(theOneSet)),fixed=T))]

##Step3 - Uses descriptive activity names to name the activities in the data set.
        for(i in 1:6) {theOneSet2$Activity[theOneSet2$Activity==i]<-as.character(activityLabels$V2[activityLabels$V1==i])}

##Step4 - Create tidy data set with the average of each variable for each activity and each subject.
        library(dplyr)
        theOneSet3<-group_by(theOneSet2,Subject,Activity)
        colnames <- names(theOneSet3)[-1:-2]
        functionnames <- sapply(colnames ,function(x) substitute(mean(x), list(x=as.name(x))))
        finalSet<-do.call(summarise, c(list(.data=theOneSet3), functionnames))

##Step5 - Write text file with final tidy data set in working directory
        write.table(finalSet, file = "tidyDataSet.txt",row.names=FALSE)