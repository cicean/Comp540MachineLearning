function X_bin = binarizeFeatures(X)
% transform each x_{ij} as follows:
% where i ranges over the examples (rows), and j over the features (columns)
% if x_{ij} > 0 then replace it by 1 else by 0.

% You need to return the following variables correctly 
X_bin = zeros(size(X));


% ====================== YOUR CODE HERE ======================
n = size(X, 2);

 for i = 1:n, 
     for j = 1:n
        if X_bin(i, j) > 0;
           X_bin(i, j) = 1;
         else X_bin(i, j) = 0;
        end
     end
end

end