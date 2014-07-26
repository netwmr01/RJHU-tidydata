RJHU-tidydata
=============

Coursera project for getting and cleaning data

You can find information about the data in codebook.md.

The data can be download from the following link

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Extract it into the data directory under your R working directory.

The run_analysis.R script can be invoke to clean the data and write out a tidy dataset. 
The script assume the your R working directory contain a folder name "UCI HAR Dataset" like the following


under your R working directory/

    -->UCI HAR Dataset/
    
        -->test/
        
        -->train/
        
        activity_labels.txt
        
        features.txt
        
        features_info.txt
        
        README.txt
        
If your extract the dataset into a different folder, please replace the first line of run_analysis.R.
Change datadir  <-"UCI HAR Dataset" to path to your directory.
        
