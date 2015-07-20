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

folds = 10;
best_accuracy = 0;
best_lambda = 0;
m = size(X,1);
    
for lambda = lambda_low:lambda_step:lambda_high
    indices = crossvalind('Kfold',m,folds);
    cur_accuracy = 0;
    for i = 1:folds
        test = (indices == i);
        train = ~test;
        X_test = X(test,:);
        y_test = y(test,:);
        X_train = X(train,:);
        y_train = y(train,:);
        % Initialize fitting parameters
        initial_theta = zeros(size(X, 2), 1);
        
        % Set Options
        options = optimset('GradObj', 'on', 'MaxIter', 400);

        % Optimize
        [theta, J, exit_flag] = ...
            fminunc(@(t)(costFunctionReg(t, X_train, y_train, lambda)), initial_theta, options);
        %Test
        p = predict(theta, X_test);
        cur_accuracy = cur_accuracy+mean(double(p == y_test))*100;
    end
    cur_accuracy = cur_accuracy / 10;
    if cur_accuracy > best_accuracy
        best_accuracy = cur_accuracy;
        best_lambda = lambda;
    end
end
