# This the the code book for run_analysis.R
## Course project for Coursera Getting and Cleaning Data

The purpose of this project is to practice to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

### About the raw data

Human Activity Recognition Using Smartphones Dataset

Version 1.0

link: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
 
### The tidying process

Project instruction:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Steps in my run_analysis.R:

1. Set working directory
2. Import the features vector and the activity labels vector
3. Import the test and training data sets respectively, each in 3 seperate data frame containing the subject id, activity id and 561 measurements
4. Row bind the test and training data sets vertically
5. Convert the activity id vector from integer 1-6 to factor, then rename with activity labels e.g. WALKING
6. Convert the subject id vector from integer 1-30 to factor
7. Set column names for the data: 'subject', 'activity' and 561 features names
8. Column bind the 3 data frame, first column 'subject', second column 'activity', followed by 561 feature measurements (steps 1,3,4 complete)
9. Extract mean and std measurments for each row (step 2 complete)
10. Creates a tidy data set with the average of each measurment for each activity and each subject (step 5 complete)

### About the fields of tidy.txt

List of fields (due to the large number of fields and limiting time factor, intepretation and units discussed below in bulk)

1.	subject
2.	activity
3.	tBodyAcc.mean...X
4.	tBodyAcc.mean...Y
5.	tBodyAcc.mean...Z
6.	tBodyAcc.std...X
7.	tBodyAcc.std...Y
8.	tBodyAcc.std...Z
9.	tGravityAcc.mean...X
10.	tGravityAcc.mean...Y
11.	tGravityAcc.mean...Z
12.	tGravityAcc.std...X
13.	tGravityAcc.std...Y
14. tGravityAcc.std...Z
15.	tBodyAccJerk.mean...X
16.	tBodyAccJerk.mean...Y
17.	tBodyAccJerk.mean...Z
18.	tBodyAccJerk.std...X
19.	tBodyAccJerk.std...Y
20.	tBodyAccJerk.std...Z
21.	tBodyGyro.mean...X
22.	tBodyGyro.mean...Y
23.	tBodyGyro.mean...Z
24.	tBodyGyro.std...X
25.	tBodyGyro.std...Y
26. tBodyGyro.std...Z
27.	tBodyGyroJerk.mean...X
28.	tBodyGyroJerk.mean...Y
29.	tBodyGyroJerk.mean...Z
30.	tBodyGyroJerk.std...X
31.	tBodyGyroJerk.std...Y
32.	tBodyGyroJerk.std...Z
33.	tBodyAccMag.mean..
34. tBodyAccMag.std..
35.	tGravityAccMag.mean..
36.	tGravityAccMag.std..
37.	tBodyAccJerkMag.mean..
38.	tBodyAccJerkMag.std..
39.	tBodyGyroMag.mean..
40.	tBodyGyroMag.std..
41.	tBodyGyroJerkMag.mean..
42.	tBodyGyroJerkMag.std..
43.	fBodyAcc.mean...X
44.	fBodyAcc.mean...Y
45.	fBodyAcc.mean...Z
46.	fBodyAcc.std...X
47.	fBodyAcc.std...Y
48.	fBodyAcc.std...Z
49.	fBodyAccJerk.mean...X
50.	fBodyAccJerk.mean...Y
51.	fBodyAccJerk.mean...Z
52.	fBodyAccJerk.std...X
53.	fBodyAccJerk.std...Y
54.	fBodyAccJerk.std...Z
55.	fBodyGyro.mean...X
56.	fBodyGyro.mean...Y
57.	fBodyGyro.mean...Z
58.	fBodyGyro.std...X
59.	fBodyGyro.std...Y
60.	fBodyGyro.std...Z
61.	fBodyAccMag.mean..
62.	fBodyAccMag.std..
63.	fBodyBodyAccJerkMag.mean..
64.	fBodyBodyAccJerkMag.std..
65.	fBodyBodyGyroMag.mean..
66.	fBodyBodyGyroMag.std..
67.	fBodyBodyGyroJerkMag.mean..
68.	fBodyBodyGyroJerkMag.std..

The features selected for the raw database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Features are normalized and bounded within [-1,1].

The tidy data contains for each subject, each activity, the average of the mean value (mean) and standard deviation (std) of the above features measurments.

