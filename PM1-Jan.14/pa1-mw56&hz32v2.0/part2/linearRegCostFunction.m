function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

prediction = X*theta;
square_error = (1/(2*m)) * sum((prediction - y).^2);
regularization = (lambda/(2*m)) * sum(theta(2:end,:).^2);

J = square_error + regularization;

grad(1) = (X(:,1)'*(prediction-y))/m;
grad(2:end) = ((X(:,2:end)'*(prediction-y))./m)+((lambda/m).*theta(2:end, :));

% Alternative solution for regularized gradient by other students
% grad = X'* ((X*theta)-y) + [ 0; lambda* theta(2:end) ]; 
% grad = grad/m;





 



% =========================================================================

grad = grad(:);

end