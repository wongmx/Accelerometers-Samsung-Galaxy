library(dplyr)

#Download and unzip data files
if(!file.exists("./data")){dir.create("./data")}
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile="./data/Dataset.zip")
unzip("./data/Dataset.zip", exdir = "./data")
path <- file.path("./data" , "UCI HAR dataset")
files <-list.files(path, recursive=TRUE)

#Reading all data files
ActivityTest  <- read.table(file.path(path, "test" , "Y_test.txt" ),header = FALSE)
ActivityTrain <- read.table(file.path(path, "train", "Y_train.txt"),header = FALSE)
SubjectTrain <- read.table(file.path(path, "train", "subject_train.txt"),header = FALSE)
SubjectTest  <- read.table(file.path(path, "test" , "subject_test.txt"),header = FALSE)
FeaturesTest  <- read.table(file.path(path, "test" , "X_test.txt" ),header = FALSE)
FeaturesTrain <- read.table(file.path(path, "train", "X_train.txt"),header = FALSE)
activity_labels <- read.table(file.path(path, "activity_labels.txt"),header=FALSE,col.names=c("activity","activity_label"))

#binding the data tables
SubjectData <- rbind(SubjectTrain, SubjectTest)
ActivityData<- rbind(ActivityTrain, ActivityTest)
FeaturesData<- rbind(FeaturesTrain, FeaturesTest)
names(SubjectData) <-c("subject")
names(ActivityData)<- c("activity")

#obtaining the activity name and assigning to the master data table
dataFeaturesNames <- read.table(file.path(path, "features.txt"), head = FALSE)
names(FeaturesData)<- dataFeaturesNames$V2

#remove any duplicated columns in the master data table
dataCombine <- cbind(SubjectData, ActivityData)
Data <- cbind(dataCombine, FeaturesData)
Data <- Data[,!duplicated(colnames(Data))]

#extract the means and standard deviation from the master data table, and calculate the average
Data %>%
  select(subject, activity, contains("mean()"), contains("std()")) %>%
  inner_join(activity_labels,by="activity") %>%
  group_by(subject,activity,activity_label) %>%
  summarise_each(funs(mean)) %>%
  #export the result in the tidydata.txt file
  write.table(file = "tidydata.txt",row.names=FALSE)
  
