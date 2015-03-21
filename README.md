----------------------------------------------------------------------------------------------------------
## This project create a tidy data set from Samsung Galaxy S data
##
## Description of the files:
##      1) run_analysis.R       -- The script who produce a text file with final tidy data set on work directory
##      2) CodeBook.md          -- Describes the variables, the data, and any transformations to clean up the orginial data
##      3) README.md            -- This file with general information
##
## To use, execute the script "run_analysis.R" in R on working directory where "UCI HAR Dataset" directory was created.
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
##The "run_analysis.R" script have 5 steps:

##Step1 - Merges the training and the test sets to create one data set with labels of descriptive variable names. 
        ##Load all information on datasets
        ##Bind relative information in two datasets (training and test)
        ##Appropriately labels the data set with descriptive variable names
        ##Merge de two completed datasets (trainig and test) 
##Step2 - Extracts only the measurements on the mean and standard deviation for each measurement.
##Step3 - Uses descriptive activity names to name the activities in the data set.
##Step4 - Create tidy data set with the average of each variable for each activity and each subject.
##Step5 - Write a text file with final tidy data set in working directory

----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
##Final tidy data set SAMPLE
============================
> finalSet
Source: local data frame [180 x 68]
Groups: Subject

  Subject     Activity tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z ...
        1             LAYING         0.2215982      -0.040513953        -0.1132036 ...
        1            SITTING         0.2612376      -0.001308288        -0.1045442 ...
        1           STANDING         0.2789176      -0.016137590        -0.1106018 ...
        1            WALKING         0.2773308      -0.017383819        -0.1111481 ...
        1 WALKING_DOWNSTAIRS         0.2891883      -0.009918505        -0.1075662 ...
        1   WALKING_UPSTAIRS         0.2554617      -0.023953149        -0.0973020 ...
        2             LAYING         0.2813734      -0.018158740        -0.1072456 ...
        2            SITTING         0.2770874      -0.015687994        -0.1092183 ...
        2           STANDING         0.2779115      -0.018420827        -0.1059085 ...
        2            WALKING         0.2764266      -0.018594920        -0.1055004 ...
        .                ...               ...               ...               ... ...
