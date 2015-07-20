% PA2 -- Logistic regression and spam filtering
% Devika Subramanian

%  Instructions
%  ------------
% 
%  This file contains code that helps you get started on the logistic
%  regression on spam classification. You will need to complete the following functions 
%  in this exericse:
%
%     stdFeatures.m
%     logTransformFeatures.m
%     binarizeFeatures.m
%     select_lambda_crossval.m
%     
%
%  
%

%% Initialization
clear ; close all; clc

%% Load Data
%% For a description of the spam data, read spam.data.txt

data = load('spamData.mat');
Xtrain = data.Xtrain; ytrain = data.ytrain;
Xtest = data.Xtest; ytest = data.ytest;

%% ==================== Part 1: Preprocessing data ====================
%  We start the exercise by first preprocessing the data
Xtrain_std = stdFeatures(Xtrain);
Xtrain_logt = logTransformFeatures(Xtrain);
Xtrain_bin = binarizeFeatures(Xtrain);

Xtest_std = stdFeatures(Xtest);
Xtest_logt = logTransformFeatures(Xtest);
Xtest_bin = binarizeFeatures(Xtest);

%% ==================== Part 2: Find good lambda by cross validation ====================

% assemble X and y
% CHANGE ASSIGNMENT of fX and fXtest to WORK WITH OTHER REPRESENTATIONS
% (log transformed and standardized)

fX = Xtrain_logt;
fXtest = Xtest_logt;

X = [ones(length(fX),1) fX];
y = ytrain;

% YOU CAN PLAY WITH FINER STEP SIZES AND LARGER RANGES TOO
lambda_low = 0; lambda_step = 0.5; lambda_high = 5;
best_lambda = selectLambdaCrossval(X,y,lambda_low,lambda_high,lambda_step);

%% ==================== Part 3: Train final model and compute accuracies ====================
initial_theta = zeros(size(X,2),1);
options = optimset('GradObj', 'on', 'MaxIter', 400);
[theta, ~, exit_flag] = fminunc(@(t)(costFunctionReg(t, X, y, best_lambda)), initial_theta, options);


% Compute accuracy on train and test set

ptrain = predict(theta, X);
fprintf('Train Accuracy with lambda =  %f: %f\n', best_lambda,mean(double(ptrain == y)) * 100);

testX = [ones(length(fXtest),1) fXtest];
ptest = predict(theta, testX);
fprintf('Test Accuracy with lambda =  %f: %f\n', best_lambda, mean(double(ptest == ytest)) * 100);