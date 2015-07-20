function X_logt = logTransformFeatures(X)
% transform each x_{ij} in X to be log(x_{ij}+0.1)
% where i ranges over the examples (rows), and j over the features (columns)

% You need to return the following variable correctly 
X_logt = zeros(size(X));

% ====================== YOUR CODE HERE ======================

%X_logt = 
n = size(X, 2);

for i = 1:n
    X_logt(:, i) = log(1 + (X_logt(:, i)));
end


end