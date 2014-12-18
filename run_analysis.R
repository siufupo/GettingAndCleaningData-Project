# 1. set path
setwd("~/R/coursera/project")
library(plyr)
library(reshape2)

# 2. import 'features' and 'labels'
features<-read.table("./UCI HAR Dataset/features.txt")
labels<-read.table("./UCI HAR Dataset/activity_labels.txt")

# 3. import 'testSet', 'testSubjects', 'testLabels', 'trainSet', 'trainSubjects', 'trainLabels'
testSet<-read.table("./UCI HAR Dataset/test/X_test.txt")
testSubjects<-read.table("./UCI HAR Dataset/test/subject_test.txt")
testLabels<-read.table("./UCI HAR Dataset/test/y_test.txt")

trainSet<-read.table("./UCI HAR Dataset/train/X_train.txt")
trainSubjects<-read.table("./UCI HAR Dataset/train/subject_train.txt")
trainLabels<-read.table("./UCI HAR Dataset/train/y_train.txt")

# 4. row bind test data and train data
bindSet<-rbind(testSet,trainSet)
bindSubjects<-rbind(testSubjects,trainSubjects)
bindLabels<-rbind(testLabels,trainLabels)

# 5. change activity labels to the 6 activity names in 'labels', e.g. 'WALKING'
bindLabels$V1<-as.factor(bindLabels$V1)
levels(bindLabels$V1)<-labels$V2

# 6. change subjects to factor levels
bindSubjects$V1<-as.factor(bindSubjects$V1)

# 7. set column names for subjects, activities and features
names(bindSubjects)<-"subject"
names(bindLabels)<-"activity"
names(bindSet)<-as.character(features$V2)

# 8. column bind all data (step 1, 3, 4)
dataAll<-cbind(bindSubjects,bindLabels,bindSet)

# 9. extract mean and std for each row (step 2)
dataExtract<-dataAll[,c(1,2,grep("(mean|std)\\(",(names(dataAll))))]

# 10. tidy data set with the average of feature by subject by activity (step 5)
dataTidy<-aggregate(. ~ subject + activity, data = dataExtract, mean)
write.table(dataTidy,"tidy.txt",row.names=FALSE)
check <- read.table("tidy.txt", header = TRUE)
