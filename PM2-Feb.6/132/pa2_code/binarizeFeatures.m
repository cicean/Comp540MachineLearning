function X_bin = binarizeFeatures(X)
% transform each x_{ij} as follows:
% where i ranges over the examples (rows), and j over the features (columns)
% if x_{ij} > 0 then replace it by 1 else by 0.

% You need to return the following variables correctly 
X_bin = zeros(size(X));


% ====================== YOUR CODE HERE ======================


X_bin = double(X > 0);



end