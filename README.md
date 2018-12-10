# UCI HAR Dataset
This repo contains a script for cleaning and sifting through the smartphone data from the human activity recognition experiment. 

This script sifts through the data and creates four variables for use in R: 
* output - This is the combined table with Subject, Activity and measurements for 562 variables. 
* summary - This table contains the averages for each of the 562 variables grouped by subject and activity.
* means - This table contains the means for the 562 variables.
* stdev - This table contains the standard deviation for each of the 562 variables.

See [CodeBook.md](CodeBook.md) for a more detailed look at the above.

It also writes the summary table to a file named UCIHAR_Summary.csv

## Instructions
1. Download the UCI HAR dataset for free from this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Expand the dataset into your working directory. It should all be contained a folder named "UCI HAR Dataset" within your working directory.
3. Run the script.
