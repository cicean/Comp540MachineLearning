function [error_train, error_val] = ...
    learningCurve(X, y, Xval, yval, lambda)
%LEARNINGCURVE Generates the train and cross validation set errors needed 
%to plot a learning curve
%   [error_train, error_val] = ...
%       LEARNINGCURVE(X, y, Xval, yval, lambda) returns the train and
%       validation set errors for a learning curve. In particular, 
%       it returns two vectors of the same length - error_train and 
%       error_val. Then, error_train(i) contains the training error for
%       i examples (and similarly for error_val(i)).
%
%   In this function, you will compute the train and test errors for
%   dataset sizes from 1 up to m. In practice, when working with larger
%   datasets, you might want to do this in larger intervals.
%

% Number of training examples
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
% Note: You should evaluate the training error on the first i training
%       examples (i.e., X(1:i, :) and y(1:i)).
%
%       For the validation error, you should instead evaluate on
%       the _entire_  validation set (Xval and yval).
%
% Note: If you are using your cost function (linearRegCostFunction)
%       to compute the training and  validation error, you should 
%       call the function with the lambda argument set to 0. 
%       Do note that you will still need to use lambda when running
%       the training to obtain the theta parameters.
%
%for i = 1:m
 % Xtrain = X(1:i,:);
  %ytrain = y(1:i);
  %theta = trainLinearReg(Xtrain, ytrain, lambda);

%  [Jtrain,grad_train]=linearRegCostFunction(Xtrain,ytrain,theta,0);
 % [Jval,grad_val]=linearRegCostFunction(Xval,yval,theta,0);
 % error_train(i) = Jtrain;
 % error_val(i) = Jval;
%end

%m_val = size(yval,1);
%for i = 1:m
  % Compute train/cross validation errors using training examples 
%  X_train = X(1:i, :);
 % y_train = y(1:i);
 % [theta] = trainLinearReg(X_train, y_train, lambda);
  
 % h_train = X_train * theta;   % h is the prediction values 
 % J_train = (h_train -y_train)' * (h_train -y_train);
 % error_train(i,1) = J_train/(2*i);

 % h_val = Xval * theta;   
 % J_val = (h_val -yval)' * (h_val -yval);
 % error_val(i,1) = J_val/(2*m_val);  
%end

for i = 1:m 
   Xi = X(1:i, :); 
   yi = y(1:i); 
  [theta] = trainLinearReg(Xi, yi, lambda); 
 % For train error, make sure you compute it on the training subset 
  [error_train(i), ~] = linearRegCostFunction(Xi, yi, theta, lambda); 
 % For validation error, compute it over the entire cross validation set 
  [error_val(i), ~] = linearRegCostFunction(Xval, yval, theta, lambda); 
end




% -------------------------------------------------------------

% =========================================================================

end
