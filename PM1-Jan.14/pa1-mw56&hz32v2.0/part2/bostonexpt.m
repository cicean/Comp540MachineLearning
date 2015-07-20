% Code for analyzing the boston housing data set using the techniques learned on
% the small data set. Please add comments to the code, so we can grade it
% with ease.

%% Initialization
clear ; close all; clc


%% ======================= Part 1: Loading and Normalizing data =======================
fprintf('Loading Data ...\n')
data = load('housing.data.txt');
X = data(:, 13); 
y = data(:, 14);
m = length(y); % number of training examples
% Normalize
fprintf('Normalizing Data ...\n')
[X, mu, sigma] = featureNormalize(X);  
% Add Ones
X = [ones(m, 1), X];     

% Plot Data
%plotData(X, y);

%fprintf('Program paused. Press enter to continue.\n');
pause;

%% =================== Part 2: Divide data in to Train Testing and validation===================
fprintf('Divide data to three fonder ...\n');

[trainVectors,valVectors,testVectors] = dividerand(m,Train,rateElse,rateElse);



X = [ones(m, 1), data(:,1)]; % Add a column of ones to X
theta = zeros(2, 1); % initialize fitting parameters

% Some gradient descent settings
iterations = 1500;
alpha = 0.01;

% compute and display initial cost
computeCost(X, y, theta)

% run gradient descent
theta = gradientDescent(X, y, theta, alpha, iterations);

% print theta to screen
fprintf('Theta found by gradient descent: ');
fprintf('%f %f \n', theta(1), theta(2));

% Plot the linear fit
hold on; % keep previous plot visible
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
hold off % don't overlay any more plots on this figure

% Predict values for lower status percentage of 5% and 50%
% remember to multiply prediction by 10000 because median value is in 10000s
price = [1, 5] *theta;; % change this
fprintf('For lower status percentage = 5, we predict a median home value of %f\n',...
    price*10000);
price = [1, 50] * theta;; % change this
fprintf('For lower status percentage = 50, we predict a median home value of %f\n',...
    price*10000);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ============= Part 4: Visualizing J(theta_0, theta_1) =============
fprintf('Visualizing J(theta_0, theta_1) ...\n')

% Grid over which we will calculate J
theta0_vals = linspace(-10,40, 100);
theta1_vals = linspace(-4, 4, 100);
% initialize J_vals to a matrix of 0's
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% Fill out J_vals
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];    
	  J_vals(i,j) = computeCost(X, y, t);
    end
end


% Because of the way meshgrids work in the surf command, we need to 
% transpose J_vals before calling surf, or else the axes will be flipped
J_vals = J_vals';
% Surface plot
figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');

% Contour plot
figure;
% Plot J_vals as 15 contours spaced logarithmically between 0.01 and 100
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))
xlabel('\theta_0'); ylabel('\theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
