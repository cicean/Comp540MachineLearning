function [error_train, error_val] = ...
    learningCurve_Averaged(X, y, Xval, yval, lambda)
%LEARNINGCURVE_AVERAGED Generates the train and cross validation set errors needed 
%to plot a learning curve
%   [error_train, error_val] = ...
%       LEARNINGCURVE_AVERAGED(X, y, Xval, yval, lambda) returns the train and
%       validation set errors for a learning curve. In particular, 
%       it returns two vectors of the same length - error_train and 
%       error_val. Then, error_train(i) contains the training error for
%       i examples (and similarly for error_val(i)).
%
%   In this function, you will compute the train and test errors for
%   dataset sizes from 1 up to m. In practice, when working with larger
%   datasets, you might want to do this in larger intervals.
%   N random draws from the training set are used to calculate these errors
%   for a particular i.
%

% Number of training examples
N = 50;
m = size(X, 1);

% You need to return these values correctly
error_train = zeros(m, 1);
error_val   = zeros(m, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return training errors in 
%               error_train and the cross validation errors in error_val. 
%               i.e., error_train(i) and 
%               error_val(i) should give you the errors
%               obtained after training on i examples.
%
% Note: You should evaluate the training error on i randomly chosen 
%       training examples 
%
%       For the validation set error, you should instead evaluate on
%       the _entire_ validation set (Xval and yval).
%
% Note: If you are using your cost function (linearRegCostFunction)
%       to compute the training and  validation error, you should 
%       call the function with the lambda argument set to 0. 
%       Do note that you will still need to use lambda when running
%       the training to obtain the theta parameters.
%
theta = zeros(1, size(X, 2));
mval = size(Xval, 1);

for i = 1:m
    for j = 1:N
        Xtrain = [];
        ytrain = [];
        arr = randperm(m);
        for k = 1:i
            Xtrain = [Xtrain; X(arr(k),:)];
            ytrain = [ytrain; y(arr(k))];
        end
        [theta] = trainLinearReg(Xtrain, ytrain, lambda);
        error_train(i) = error_train(i)+sum((Xtrain*theta-ytrain).^2)/(2*i);
        error_val(i) = error_val(i)+sum((Xval*theta-yval).^2)/(2*mval);
    end
    error_train(i) = error_train(i)/N; 
    error_val(i) = error_val(i)/N; 
end
% -------------------------------------------------------------

% =========================================================================

end
