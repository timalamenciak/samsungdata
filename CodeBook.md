# Code Book
This document contains the original code book from the dataset below. The modifications done by [run_analysis.R](run_analysis.R) result in a collected data table, a table of summaries, a table of means and a table of standard deviations. This file goes through how those are calculated in plain language.

## Data frame: output
This contains the data from both the test and train sets of the original UCI HAR dataset. Each entry indicates which dataset it is from, as well as the subject and activity that resulted in the measurements.

## Data frame: summary
This is a summary table created by dplyr's group_by function. It is grouped according to the subject and the activity. The means for each measurement variable are calculated. This is also written to a CSV file in your working directory.

## Vector: means
This contains the means of each row for the output table.

## Vector: stdev
This contains the standard deviation for each row of the output table.

# See features.txt in the dataset for a complete list of the variables.
