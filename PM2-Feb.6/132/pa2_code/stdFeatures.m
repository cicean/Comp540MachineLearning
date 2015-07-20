function X_std = stdFeatures(X)
% standardize the columns of X so that they
% all have mean of 0 and unit variance

% You need to return the following variable correctly 
X_std = zeros(size(X));


% ====================== YOUR CODE HERE ======================

for i = 1:size(X,2)
    val_std = std(X(:,i));
    val_mean = mean(X(:,i));
    X_std(:,i) = (X(:,i)-val_mean)/val_std;
end

end