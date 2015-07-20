% Code for analyzing the boston housing data set using the techniques learned on
% the small data set. Please add comments to the code, so we can grade it
% with ease.
clear; close all; clc;

%load data and normalize
data = load('housing.data.txt');
X = data(:,1:13);
y = data(:,14);
m = length(y);
[X, mu, sigma] = featureNormalize(X);  % Normalize
X = [ones(m, 1), X];     % Add Ones

%divide data into 3 parts: training, validation and test
%first we will decide a best seperation of all the data
%lambda = 0;
%errorTest = zeros(9, 1);
rate = 80;
%for rate = 1:99
    rateTrain = rate / 100;
    rateElse = (1 - rateTrain) / 2;
    [trainInd,valInd,testInd] = dividerand(m,rateTrain,rateElse,rateElse);
    Xtrain = [];
    ytrain = [];
    for i = 1:length(trainInd)
        Xtrain = [Xtrain;X(trainInd(i),:)];
        ytrain = [ytrain;y(trainInd(i))];
    end
    
    Xval = [];
    yval = [];
    for i = 1:length(valInd)
        Xval = [Xval;X(valInd(i),:)];
        yval = [yval;y(valInd(i))];
    end
    
    Xtest = [];
    ytest = [];
    for i = 1:length(testInd)
        Xtest = [Xtest;X(testInd(i),:)];
        ytest = [ytest;y(testInd(i))];
    end
    %theta = zeros(1, size(Xtrain, 2));
    %[theta] = trainLinearReg(Xtrain, ytrain, lambda);
    %errorTest(rate) = sum((Xtrain*theta-ytrain).^2)/(2*length(trainInd));
    %fprintf('%f %f\n', rateTrain, errorTest);
%end
%errorTest

%train theta with original data
[lambda_vec, error_train, error_val] =  validationCurve(Xtrain, ytrain, Xval, yval);
curveForLambda(lambda_vec, error_train, error_val);
calcTestError(Xtrain, ytrain, Xtest, ytest, 0);
calcTestError(Xtrain, ytrain, Xtest, ytest, 10);
pause;

%train theta with 
Xtrain_p = extendFeatures(Xtrain, 2);
[Xtrain_p(:,2:size(Xtrain_p,2)), mu, sigma] = featureNormalize(Xtrain_p(:,2:size(Xtrain_p,2)));
Xval_p = extendFeatures(Xval, 2);
[Xval_p(:,2:size(Xval_p,2)), mu, sigma] = featureNormalize(Xval_p(:,2:size(Xval_p,2)));
Xtest_p = extendFeatures(Xtest, 2);
[Xtest_p(:,2:size(Xtest_p,2)), mu, sigma] = featureNormalize(Xtest_p(:,2:size(Xtest_p,2)));
[lambda_vec, error_train, error_val] =  validationCurve(Xtrain_p, ytrain, Xval_p, yval);
curveForLambda(lambda_vec, error_train, error_val);
calcTestError(Xtrain_p, ytrain, Xtest_p, ytest, 30);
pause;

%train theta with 
Xtrain_p = extendFeatures(Xtrain, 3);
[Xtrain_p(:,2:size(Xtrain_p,2)), mu, sigma] = featureNormalize(Xtrain_p(:,2:size(Xtrain_p,2)));
Xval_p = extendFeatures(Xval, 3);
[Xval_p(:,2:size(Xval_p,2)), mu, sigma] = featureNormalize(Xval_p(:,2:size(Xval_p,2)));
Xtest_p = extendFeatures(Xtest, 3);
[Xtest_p(:,2:size(Xtest_p,2)), mu, sigma] = featureNormalize(Xtest_p(:,2:size(Xtest_p,2)));
[lambda_vec, error_train, error_val] =  validationCurve(Xtrain_p, ytrain, Xval_p, yval);
curveForLambda(lambda_vec, error_train, error_val);
calcTestError(Xtrain_p, ytrain, Xtest_p, ytest, 30);
pause;
