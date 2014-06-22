DATA:

The data is obtained from the UCI machine learning repository.

The experiments for the data have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The data was downloaded in a zip file which had to be unzipped for further processing.

The files utilized for the analysis are:
features.txt - lists all the attributes measured in the experiment
features_info.txt - explains the attributes
activity_labels.txt - lists all the activities performed by the subjects

subject_test.txt - subject data for test data set
X_test.txt - attribute values for test data set
y_test.txt - activity data for test data set

subject_train.txt - subject data for training data set
X_train - attribute values for training data set
y_train.txt - activity data for training data set


VARIABLES/ATTRIBUTES/FEATURES:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

There are 561 features totally. Only the mean and standard deviation variables out of these have been utilized for the analysis.

The other variables used are:
SubjectID - ID of the subject performing the activity
ActivityID - ID given to the activity
Activity - descriptive name of the activity

TRANSFORMATIONS:

- The test data set and training data set are read from the .txt files using the read.table function.
- The features and activity files are read using the read.table function.
- Descriptive variable names are given to the test data set using the features data table.
- Column names are changed in the subject_test table and the y_test table to SubjectID and ActivityID respectively.
- A test subset with variables for mean and standard deviation is created from the test data set using the grep function.
- The subject data, y_test data and test subset are combined together using cbind.
- The combined data obtained in the previous step is merged with the activity data to give descriptive activity names to name the activities in the data set. The merge function is used.
- Exactly the same steps are performed on the training data set.
- The resulting test and training data sets are combined into one using the rbind funciton.
- To create the final independent tidy data set with the average of each variable for each activity and each subject, the aggregate function is used.
