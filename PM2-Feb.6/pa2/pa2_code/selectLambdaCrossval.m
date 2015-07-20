function best_lambda = selectLambdaCrossval(X,y,lambda_low,lambda_high,lambda_step)
% Select the best lambda for training set (X,y) by sweeping a range of
% lambda values from lambda_low to lambda_high in steps of lambda_step
%
% For each lambda value, divide the data into 10 equal folds
% using crossvalind. 
% Then, repeat i = 1:10:
%  1. Retain fold i for testing, and train logistic model on the other 9 folds
%  with that lambda
%  2. Evaluate accuracy of model on left out fold i
% Accuracy associated with that lambda is the averaged accuracy over all 10
% folds.
% Do this for each lambda in the range and pick the best one.

candidate_lam = [lambda_low;lambda_high;lambda_step]
folds = 10;
best_lambda = 0;
high_accuracy = realmax


for i = 1:length(candidate_lam)
    lambda = candidate_lam(i);
    for j = 1:folds
        [stdFeatures(X),y]
        
        
    

    
    
    
