#Test data processing
subTest <- read.table("./Project/Test/subject_test.txt")
XTest <- read.table("./Project/Test/X_test.txt")
YTest <- read.table("./Project/Test/y_test.txt")
features <- read.table("./Project/features.txt")
activity <- read.table("./Project/activity_labels.txt")

names(XTest) <- features$V2

names(subTest) <- "SubjectID"

names(YTest) <- "ActivityID"

TestSubset<- XTest[,grep("mean|std", colnames(XTest))]

TestData <- cbind(subTest, YTest, TestSubset)

TestDataMerged <- merge(TestData, activity, by.x="ActivityID", by.y="ActivityID", all=FALSE)


# Train data processing
subTrain <- read.table("./Project/Train/subject_train.txt")
XTrain <- read.table("./Project/Train/X_train.txt")
YTrain <- read.table("./Project/Train/y_train.txt")

names(XTrain) <- features$V2

names(subTrain) <- "SubjectID"

names(YTrain) <- "ActivityID"

TrainSubset<- XTrain[,grep("mean|std", colnames(XTrain))]

TrainData <- cbind(subTrain, YTrain, TrainSubset)

TrainDataMerged <- merge(TrainData, activity, by.x="ActivityID", by.y="ActivityID", all=FALSE)

#Combining the test and train data sets into one
BigData <- rbind(TestDataMerged, TrainDataMerged)

#Moving the last column to the 3rd position
BigData <- BigData[,c(2,1,82,3:81)]

#Ordering according to SubjectID
BigData <- BigData[order(BigData$SubjectID),]

#Summarizing
attach(BigData)
Tidy_Data <- aggregate(BigData, by=list(SubjectID,ActivityID), FUN=mean, na.rm=TRUE)
Tidy_Data$SubjectID <- NULL
Tidy_Data$ActivityID <- NULL
Tidy_Data$Activity <- NULL

names(Tidy_Data)[names(Tidy_Data) == "Group.1"] <- "Subject"
names(Tidy_Data)[names(Tidy_Data) == "Group.2"] <- "Activity"

