function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%
q = size(theta,1)
r = size(theta,2)

%J = 1 / m * (sum(-y .* log(sigmoid(X*theta)) - (1 .-y) .* (log(1-sigmoid(X * theta)))));
%grad = 1 / m * ( sum((sigmoid(X * theta) - y) .* X)) ;

%for i = 1:m
%    J = J + (-y(i)*log(sigmoid(theta'*X'(:,i)))-(1-y(i))*log(1-sigmoid(theta'*X'(:,i))))*(1/m);
%
%    h(i) = sigmoid(theta'*X'(:,i));
%    grad = grad + (h(i) - y(i))*X'(:,i);
%end

%grad = grad/m;

for i=1:m,
	g = sigmoid(theta' * X(i,:)');
	J = J + (-1 * y(i, :) * log(g)) - ((1 - y(i, :)) * log(1 - g));
	for j=1:q,
		grad(j) = grad(j) + (g - y(i, :)) * X(i, j);
	end;
end;

for i=1:q,
	grad(i) = grad(i)/m;
end;

J = J/m;

% =============================================================
%hx_vec = sigmoid(X * theta);

%J = sum(- y .* log(hx_vec) - (1 - y) .* log(ones(m,1) - hx_vec)) / m;

%grad = (X' * (hx_vec - y)) / m;

end
