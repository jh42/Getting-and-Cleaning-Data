# Getting and Cleaning Data
# Course Project - Readme

## Data Source
The source data was provided by the experiment "Human Activity Recognition Using Smartphones Dataset" conducted by Smartlab (University of Genova, Italy).

Source data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Script Information
The <code>run_analysis.R</code> script

* reads all relevant source files into memory
* cleans and merges the appropriate data frames
* subsets the data so only mean and standard deviation are kept as requested by the assignment
* creates an additional data frame aggregating features per subject and activity
* writes the aggregated data frame to disk (<code>data_averages.txt</code>)

A description of the steps taken to clean and transform the raw data can be found in the corresponding <code>CodeBook.md</code> document.

## Running the Script
* Unzip the source data file and make sure the <code>run_analysis.R</code> script is located in the same folder as the <code>activity_labels.txt</code> and <code>features.txt</code>.
* Change the argument of the <code>setwd()</code> command in line 4 to the appropriate location; alternatively, delete the <code>setwd()</code> instruction if your current working directory is already the correct one.
* Run the <code>run_analysis.R</code> script.
* The data frames <code>data_complete</code> and <code>data_averages</code> are created in memory for further analysis.
* Also, the <code>data_averages</code> frame is written to disk into the file <code>data_averages.txt</code>.