function [] = calcTestError(X, y, Xtest, ytest, lambda)
[theta] = trainLinearReg(X, y, lambda);
error_test = 0;
mtest = size(Xtest,1);
error_test = sum((Xtest*theta-ytest).^2)/(2*mtest);
fprintf('test error:%f\n', error_test);
end