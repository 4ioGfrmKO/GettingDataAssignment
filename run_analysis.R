# set working directory
setwd("G:\\DataScience\\3-GettingData\\Assignment\\GettingDataAssignment")

nrowsDef <- -1

# Downloading part of the script - deactivated
if (FALSE) {
  
  tf <- "Dataset.zip"
  
  # run the download file function, download as binary..  save the result to the temporary file
  download.file(
    "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
    tf ,
    mode = 'wb' 
  )
  
  # unzip the files to the temporary directory
  files <- unzip( tf  )

}


###################################################################################################
## Analysis code
# Assumes ZIP file in unzipped into "UCI HAR Dataset" in the local working directory

# 1. Merges the training and the test sets to create one data set.

# read training set data
xtrain <- read.csv(".\\UCI HAR Dataset\\train\\X_train.txt", sep="", nrows=nrowsDef, header=F )
xtest <- read.csv(".\\UCI HAR Dataset\\test\\X_test.txt", sep="", nrows=nrowsDef, header=F)
X <- rbind(xtrain,xtest)
xtrain <- xtest <- NULL


# read training set data
ytrain <- read.csv(".\\UCI HAR Dataset\\train\\y_train.txt", sep="", nrows=nrowsDef, header=F, col.names=c("id"))
ytest <- read.csv(".\\UCI HAR Dataset\\test\\y_test.txt",  sep="", nrows=nrowsDef, header=F, col.names=c("id"))
y <- rbind(ytrain, ytest)
ytest <- ytrain <- NULL       # clear ytrain, ytest

# Load subject data
subjtrain <- read.csv(".\\UCI HAR Dataset\\train\\subject_train.txt",sep="", nrows=nrowsDef, header=F, col.names=c("subjectid"))
subjtest <- read.csv(".\\UCI HAR Dataset\\test\\subject_test.txt", sep="", nrows=nrowsDef, header=F, col.names=c("subjectid"))
subject <- rbind(subjtrain, subjtest)
subjtest <- subjtrain <- NULL

#########################################################################
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# read column header names
colHeaders <- read.csv(".\\UCI HAR Dataset\\features.txt", header=F, sep="", stringsAsFactors=F, col.names=c("id", "names"))
                      
# select only the columns that contain "-mean(" or "-std("
relevantCols <- grepl("-mean\\(|-std\\(", colHeaders$names, perl=T)

# select relevant Columns
X <- X[,which(relevantCols)]                      

# set column names for X
colnames(X) <- colHeaders[which(relevantCols),]$names

#########################################################################
# 3. Uses descriptive activity names to name the activities in the data set

# read activity labels
actLabels <- read.csv(".\\UCI HAR Dataset\\activity_labels.txt", 
                      header=F, sep="", stringsAsFactors=F,
                      col.names=c("id", "activity")
)

# merge data frames
res <- cbind(y, subject, X)


# add activity labels
resbckp <- res
res <- merge(actLabels,res, by.x="id", by.y="id")
res <- subset(res, select=-id)
#y1[order(y1$rowid), ]

#colnames(y1)[1] <- "activityid"
#colnames(y1)[2] <- "activityname"


#X <- y <- subject <- y1 <- NULL
                                            
#########################################################################
# 4. Appropriately labels the data set with descriptive variable names. 

# already done above
tst <- gsub("\\()","",colnames(res))
tst <- gsub("-mean","Mean",tst)
tst <- gsub("-std","StandardDev",tst)
tst <- gsub("Acc","Acceleration",tst)
tst <- gsub("^t","TimeDomain",tst)
tst <- gsub("^f","FrequencyDomain",tst)
tst <- gsub("-","",tst)
colnames(res) <- tst
#write.table(tst, file="cols.txt", row.names=F, col.names=F, quote=F)

#########################################################################
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#res$activityname <- as.factor(res$activityname)
aggdata <-aggregate(res, by=list(subject = res$subjectid, activity = res$activity), FUN=mean, na.rm=TRUE)
aggdata <- subset(aggdata, select=-subjectid)
aggdata <- subset(aggdata, select=-activity.1)
write.table(aggdata, file="aggredatedData.txt", row.names=F)

write.table(res, file="cleanData.txt", row.names=F)

