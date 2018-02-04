%{
 Problem Statement: Implement K-Nearest Neighbour (KNN) classification algorithm on AT&T face recognition dataset.

Note: This algorithm can be used for Cancer prediction using DNA expressions recorded on microarrays.
Author: Aditya Dubal
Language: Matlab 
%}

% Clear the output screen
clc;
clear;

% Train data contains sample datasets whose labels are already known
train_data = load('C:\Users\***\trainDataXY.txt');

% Test data contains sample whose labels are unknown
test_data = load('C:\Users\***\testDataX.txt');

% Slice known labels from training dataset
known_labels = train_data(1,:);

% Get training data without labels
train = train_data(2:end,:);

% Number of columns in test data
columns_test = size(test_data,2);

% Number of columns in train data
columns_train = size(train,2);

% Get value of k denoting number of neighbours around selected class label  
k_neighbours = input('Enter value for K: ');

% Following for loop is to calculate euclidean distance
for test_column = 1:columns_test
    % Subtraction of each test column with all train columns
    for train_column = 1:columns_train
        difference_matrix(:,train_column) = test_data(:,test_column)-train(:,train_column);
    end
    
    % Square of all subtracted values
    square_matrix = difference_matrix.^2;
    
    % Sum all values in a column to give a single value
    summation_array = sum(square_matrix);
    
    % Square root will give the distance
    sq_root = summation_array.^(1/2);
    
    % Sort and save indices and vaues in two arrays
    [Min_array,Index_array] = sort(sq_root);
    
    % For loop to get k nearest neighbours in nearest_matrix
    for test_iterator = 1:k_neighbours
        nearest_matrix(test_column,test_iterator) = known_labels(Index_array(test_iterator));
    end
end

% Unique class labels in array
values_array = unique(known_labels);

% For loop to get count of respective labels
for y = 1:columns_test
    count_matrix(y,:) = hist(nearest_matrix(y,:),values_array);
end

% Label with maximum count value wins!
for z = 1:columns_test
    [Max_count,Id_value] = max(count_matrix(z,:));
    prediction(1,z) = Id_value;
end

% Print final output
prediction
