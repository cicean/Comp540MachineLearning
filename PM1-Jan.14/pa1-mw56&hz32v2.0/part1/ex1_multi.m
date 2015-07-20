%% Machine Learning Online Class
%  Exercise 1: Linear regression with multiple variables
% modified by Devika Subramanian
%
%  Instructions
%  ------------
% 
%  This file contains code that helps you get started on the
%  linear regression exercise. 
%
%  You will need to complete the following functions in this 
%  exericse:
%
%     gradientDescentMulti.m
%     computeCostMulti.m
%     featureNormalize.m
%     normalEqn.m
%
%  For this part of the exercise, you will need to change some
%  parts of the code below for various experiments (e.g., changing
%  learning rates).
%

%% Initialization

%% ================ Part 1: Feature Normalization ================

%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

%% Load Data

data = load('housing.data.txt');
X = data(:,1:13);
y = data(:,14);
m = length(y);

% Print out some data points
fprintf('First 10 examples from the dataset: \n');
fprintf(' x = [%.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f], y = %.2f \n', [X(1:10,:) y(1:10,:)]');

fprintf('Program paused. Press enter to continue.\n');
pause;

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];


%% ================ Part 2: Gradient Descent ================

% ====================== YOUR CODE HERE ======================
% Instructions: We have provided you with the following starter
%               code that runs gradient descent with a particular
%               learning rate (alpha). 
%
%               Your task is to first make sure that your functions - 
%               computeCost and gradientDescent already work with 
%               this starter code and support multiple variables.
%
%               After that, try running gradient descent with 
%               different values of alpha and see which one gives
%               you the best result.
%
%               Finally, you should complete the code at the end
%               to predict the price of a 1650 sq-ft, 3 br house.
%
% Hint: By using the 'hold on' command, you can plot multiple
%       graphs on the same figure.
%
% Hint: At prediction, make sure you do the same feature normalization.
%

fprintf('Running gradient descent ...\n');

% Choose some alpha value
%alpha = 0.01;
%alpha2 = 0.03;
%alpha3 = 0.1;
alpha4 = 0.3
num_iters = 500;
num_iters2 = 200;
num_iters3 = 100;
num_iters4 = 20;





% Init Theta and Run Gradient Descent 
theta = zeros(size(X,2), 1);
%[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);
%[theta, J_history2] = gradientDescentMulti(X, y, theta, alpha2, num_iters2);
%[theta, J_history3] = gradientDescentMulti(X, y, theta, alpha3, num_iters3);
[theta, J_history4] = gradientDescentMulti(X, y, theta, alpha4, num_iters4);

% Plot the convergence graph
figure;
%plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
%plot(1:numel(J_history2), J_history2, '-k', 'LineWidth', 2);
%plot(1:numel(J_history3), J_history3, '-g', 'LineWidth', 2);
plot(1:numel(J_history4), J_history4, '-r', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');

% Estimate the median home value of the "average" census tract
% ====================== YOUR CODE HERE ======================
% Recall that the first column of X is all-ones. Thus, it does
% not need to be normalized.
price = theta(1) + theta(2)*((1650-2000.6809)/794.70235) + theta(3)*((3-3.1702)/0.76098); % change this
%ins = [1650, 3]
%price = [1, (ins .- mu)./sigma] * theta;
%price =  (theta(1) + theta(2)* (1650 - mu) / sigma + theta(3)* (3 - mu) / sigma);

% ============================================================

fprintf(['Predicted median home price for the average census tract ' ...
         '(using gradient descent):\n $%f\n'], price);

fprintf('Program paused. Press enter to continue.\n');
%pause;

%% ================ Part 3: Normal Equations ================

fprintf('Solving with normal equations...\n');

% ====================== YOUR CODE HERE ======================
% Instructions: The following code computes the closed form 
%               solution for linear regression using the normal
%               equations. You should complete the code in 
%               normalEqn.m
%
%               After doing so, you should complete this code 
%               to predict the median value of a home.

%% Load Data
data = load('housing.data.txt');
X = data(:, 1:13);
y = data(:, 14);
m = length(y);


% Add intercept term to X
X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
theta = normalEqn(X, y);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');


% Estimate the median value of a home in an  average census tract
% ====================== YOUR CODE HERE ======================

 
price = (theta(1) + theta(2)*1650 + theta(3)*3); % change this


% ============================================================

fprintf(['Predicted median home price for the average census tract ' ...
         '(using normal equations):\n $%f\n'], price);
     

