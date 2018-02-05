# Face_Recognition_with_KNN
Predict label or category for face images data set. Training data of 400 images is given. Train and develop model on training data set and use that model to predict labels of test data set. 

# Data set 
Data set was transformaed such that each column of training and test data will represent one image.
Two data sets were given:
Train data - Where labels or categories of images is known
Test data - Where labels or categories of images is unknown

# Algorithm
1. First calculate Euclidean distance for every test image with all the train images
2. Sort the distance values and select K (entered by user) lables from lables of train data 
3. Get unique labels and count of lables which are K near
4. Assign lable to test image based on maximum value got by voting

# Author
Aditya Dubal
