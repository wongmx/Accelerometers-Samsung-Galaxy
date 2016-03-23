#Accelerometers data from the Samsung Galaxy S smartphone - Data Extraction and Cleaning

##Introduction:

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This project creates a R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.

##Initial settings:

Users will need to install the "dplyr" packages as this R script will make use of the dplyr library such as Contain, Select, Chain, etc. The script needs to be stored an located at the working directory. 

This script will download the zipped datasets to your working directory, and then unzip the data files for you. So, you do not need to download the data files in advance. 


##Running the script code

After making sure the initial settings are done properly, to source the "run_analysis.R" script, you would need to type in the following at your R console:

-Change the working directory in R to the installation directory (called samsung in the Installation section).
-Source the script run_analysis.R in R: source("run_analysis.R")

##Codebook

Information about the datasets is provided in CodeBook.md.

##Output file

An output file called "tidydata.txt" will be automatically generated and saved to your working directory at the end of the script. 


