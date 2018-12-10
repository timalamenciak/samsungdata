## We'll use Dplyr so let's import it.
library(dplyr)


## Pull in both the activity label spreadsheets
train_label <- read.table("UCI HAR Dataset/train/Y_train.txt")
test_label <- read.table("UCI HAR Dataset/test/Y_test.txt")

## Grab the column names and activity labels 
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
varnames <- read.table("UCI HAR Dataset/features.txt")

## Pull in the test and train databases, using the features as labels.
train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = varnames[,2])
test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = varnames[,2])

## Pull in the subject tables
train_subj <- read.table("UCI HAR Dataset/train/subject_train.txt")
test_subj <- read.table("UCI HAR Dataset/test/subject_test.txt")

## Add the labels to a new column
train$Activity <- unlist(train_label)
test$Activity <- unlist(test_label)
train$Subject <- unlist(train_subj)
test$Subject <- unlist(test_subj)

## Add a column to indicate if the observation was from the test or train pool
train$db <- "train"
test$db <- "test"

## Merge the databases
output <- full_join(train, test)

## Apply the activity names in place of the numbers
output$Activity <- activities[output$Activity, 2]

## Clean up, clean up, everybody clean up
rm (test, test_label, test_subj, train, train_label, train_subj, varnames, activities)

## Make a vector with the means excluding non-numeric columns
drops <- c("Activity", "db", "Subject")
means <- colMeans(select(output, -drops), na.rm = TRUE)

## And the standard deviation
stdev <- apply(select(output, -drops), 2, sd)

## Pull out a tidy dataset and spit out a summary table grouped by Subject and Activity
tidy <- group_by(output, Subject, Activity)
summary <- summarise_all(select(tidy, -"db"), funs(mean))

## Tidy up time 2
rm (drops, tidy)

## Write the summary data
write.table(summary, "UCIHAR_summary.csv", row.name = FALSE)