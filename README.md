GetData-Coursera-Project
========================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

This script pulls together Samsung wearables data into one tidy dataset.

1. Read in test data
  - assign column names to the data
  - extract columns from measurement data with mean() and std() measurements
  - bind the columns together from the three data sets
2. Repeat step 1 for train data
3. Combine the datasets
4. Add in the provided activity names
5. Write tidy data to a file named:
      TidyDataStep4.txt (in reference to assignmet step number)
6. Use the aggregate function to create a mean of all measuremetns by 
    activity type
7. Write aggregated data to a file named: 
      TidyDataStep5.txt (in reference to assignmet step number)
  
To read created files use this code:

data <- read.table(file_path, header = TRUE) 
View(data)
 