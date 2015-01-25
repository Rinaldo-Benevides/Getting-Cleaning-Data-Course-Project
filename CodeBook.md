# Course Project Code Book
=====

The goal is to prepare tidy data that can be used for later analysis.

The R script called "run_analysis.R" that does the following:

* 1. Download and unzip de raw data.
* 2. Merges the training and the test sets to create one data set.
* 3. Extracts only the measurements on the mean and standard deviation for each measurement. 
* 4. Uses descriptive activity names to name the activities in the data set
* 5. Appropriately labels the data set with descriptive variable names. 
* 6. From the data set in step 5, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Read the README.txt file to know the instructions.

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained in [this site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 


## Instructions
=====

* 1. Copy run_analysis.R to your work directory
* 2. Load program: source("run_analysis.R")
* 3. Execute function: run()
* 4. Result file: "tydiData.csv"


## Variables
=====

### Description

The tidyData.csv contains the average of each variable analysed (all mean and standard deviation) for each activity and each subject.


### Labels

* subject: volunteer's ID number. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each volunteer have a ID number.

* activity: Each person (volunteer) performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.


### Mean

index                                 name
*    1                    tBodyAcc_mean___X
*    2                    tBodyAcc_mean___Y
*    3                    tBodyAcc_mean___Z
*    4                     tBodyAcc_std___X
*    5                     tBodyAcc_std___Y
*    6                     tBodyAcc_std___Z
*   41                 tGravityAcc_mean___X
*   42                 tGravityAcc_mean___Y
*   43                 tGravityAcc_mean___Z
*   44                  tGravityAcc_std___X
*   45                  tGravityAcc_std___Y
*   46                  tGravityAcc_std___Z
*   81                tBodyAccJerk_mean___X
*   82                tBodyAccJerk_mean___Y
*   83                tBodyAccJerk_mean___Z
*   84                 tBodyAccJerk_std___X
*   85                 tBodyAccJerk_std___Y
*   86                 tBodyAccJerk_std___Z
*  121                   tBodyGyro_mean___X
*  122                   tBodyGyro_mean___Y
*  123                   tBodyGyro_mean___Z
*  124                    tBodyGyro_std___X
*  125                    tBodyGyro_std___Y
*  126                    tBodyGyro_std___Z
*  161               tBodyGyroJerk_mean___X
*  162               tBodyGyroJerk_mean___Y
*  163               tBodyGyroJerk_mean___Z
*  164                tBodyGyroJerk_std___X
*  165                tBodyGyroJerk_std___Y
*  166                tBodyGyroJerk_std___Z
*  201                   tBodyAccMag_mean__
*  202                    tBodyAccMag_std__
*  214                tGravityAccMag_mean__
*  215                 tGravityAccMag_std__
*  227               tBodyAccJerkMag_mean__
*  228                tBodyAccJerkMag_std__
*  240                  tBodyGyroMag_mean__
*  241                   tBodyGyroMag_std__
*  253              tBodyGyroJerkMag_mean__
*  254               tBodyGyroJerkMag_std__
*  266                    fBodyAcc_mean___X
*  267                    fBodyAcc_mean___Y
*  268                    fBodyAcc_mean___Z
*  269                     fBodyAcc_std___X
*  270                     fBodyAcc_std___Y
*  271                     fBodyAcc_std___Z
*  294                fBodyAcc_meanFreq___X
*  295                fBodyAcc_meanFreq___Y
*  296                fBodyAcc_meanFreq___Z
*  345                fBodyAccJerk_mean___X
*  346                fBodyAccJerk_mean___Y
*  347                fBodyAccJerk_mean___Z
*  348                 fBodyAccJerk_std___X
*  349                 fBodyAccJerk_std___Y
*  350                 fBodyAccJerk_std___Z
*  373            fBodyAccJerk_meanFreq___X
*  374            fBodyAccJerk_meanFreq___Y
*  375            fBodyAccJerk_meanFreq___Z
*  424                   fBodyGyro_mean___X
*  425                   fBodyGyro_mean___Y
*  426                   fBodyGyro_mean___Z
*  427                    fBodyGyro_std___X
*  428                    fBodyGyro_std___Y
*  429                    fBodyGyro_std___Z
*  452               fBodyGyro_meanFreq___X
*  453               fBodyGyro_meanFreq___Y
*  454               fBodyGyro_meanFreq___Z
*  503                   fBodyAccMag_mean__
*  504                    fBodyAccMag_std__
*  513               fBodyAccMag_meanFreq__
*  516           fBodyBodyAccJerkMag_mean__
*  517            fBodyBodyAccJerkMag_std__
*  526       fBodyBodyAccJerkMag_meanFreq__
*  529              fBodyBodyGyroMag_mean__
*  530               fBodyBodyGyroMag_std__
*  539          fBodyBodyGyroMag_meanFreq__
*  542          fBodyBodyGyroJerkMag_mean__
*  543           fBodyBodyGyroJerkMag_std__
*  552      fBodyBodyGyroJerkMag_meanFreq__
*  555          angle_tBodyAccMean_gravity_
*  556 angle_tBodyAccJerkMean__gravityMean_
*  557     angle_tBodyGyroMean_gravityMean_
*  558 angle_tBodyGyroJerkMean_gravityMean_
*  559                 angle_X_gravityMean_
*  560                 angle_Y_gravityMean_
*  561                 angle_Z_gravityMean_