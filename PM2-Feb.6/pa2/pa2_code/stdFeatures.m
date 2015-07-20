function X_std = stdFeatures(X)
% standardize the columns of X so that they
% all have mean of 0 and unit variance

% You need to return the following variable correctly 
X_std = zeros(size(X));



% ====================== YOUR CODE HERE ======================

%mu = zeros(1, size(X, 2));
%sigma = zeros(1, size(X,2));

%m = size(X, 1);
n = size(X, 2);

 muz = mean(X);
sigma = std(X);

for i = 1:n
    X_std(:, i) = (X_std(:, 1)-muz(i))/sigma(i);
end

fprintf('%f\n', X(1:10, :));
fprintf('\n');
fprintf('%f\n', X_std(1:10, :));

end