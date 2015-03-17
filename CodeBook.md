# Code Book
## General information

This dataset contains data on Human Activities measured with the accelerometer and gyroscope of a smartphone. It is based on a raw dataset "Human Activity Recognition Using Smartphones Dataset" created by Reyes-Ortiz et.al. of university of Genova/Italy. You can find additional information in the section "Study Design". Please also take note of the license of the dataset in section "Copyright/license".

## Information about summary choices made

The two datasets below were created using an R-script (see script file "run_analysis.R").

### cleanData.txt

Major steps of the processing include

1. Merge the training and the test sets to create one data set.
3. Extract only the measurements on the mean and standard deviation for each measurement. 
2. Include the information on the subject and the activity into the data set.
4. Use descriptive activity names to name the activities in the data set
4. Update the variable names to be more descriptive 

### aggredatedData.txt

This data set was created by aggregating for each activity and each subject to obtain the average of each variable.


## Information about variables

- All time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 

- Similarly, the acceleration signal was then separated into body and gravity acceleration signals (TimeDomainBody... and TimeDomainGravity...) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

- Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (...Jerk...). 

- Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (...Mag... )

- Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing derived Frequency Domain variables (...FrequencyDomain). 


# Study Design

## This dataset is based on the raw data from the following study

> ==================================================================
> Human Activity Recognition Using Smartphones Dataset
> Version 1.0
> ==================================================================
> Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
> Smartlab - Non Linear Complex Systems Laboratory
> DITEN - Università degli Studi di Genova.
> Via Opera Pia 11A, I-16145, Genoa, Italy.
> activityrecognition@smartlab.ws
> www.smartlab.ws
> ==================================================================
> 
> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed > six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy > S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular > velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset > has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% > the test data. 
> 
> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width 
> sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and
> body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The
> gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was
> used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See
> 'features_info.txt' for more details. 


# Copyright/ License

Please find attached the license granted by the original authors.

> License:
> ========
> Use of this dataset in publications must be acknowledged by referencing the following publication [1] 
> 
> [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
> This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
> Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.