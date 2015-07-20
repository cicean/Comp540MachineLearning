function [Xpoly] = extendFeatures(X, p)
    Xpoly = X(:,1);
    for i = 2:size(X,2)
        for j = 1:p
            Xpoly = [Xpoly,X(:,i).^j];
        end
    end
end