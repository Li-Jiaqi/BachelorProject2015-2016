%     warmUpExercise.m
%     plotData.m
%     gradientDescent.m
%     computeCost.m
%     gradientDescentMulti.m
%     computeCostMulti.m
%     featureNormalize.m
%     normalEqn.m
%% Initialization
clear ; close all; clc

%% ======================= Part 2: Plotting =======================
fprintf('Plotting Data ...\n')
load('DepressionLabels_dev.mat')
load('DepressionLabels_training.mat')
load('S_d_MFCC.mat')
load('S_t_MFCC.mat')
X = [mean(S_t_MFCC,2)];
y = DepressionLabels_training;
X_dev = [mean(S_d_MFCC,2)];
y_dev = DepressionLabels_dev;

m = length(y); % number of training examples

% Plot Data
% Note: You have to complete the code in plotData.m
plotData(X, y);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% =================== Part 3: Gradient descent ===================
fprintf('Running Gradient Descent ...\n')

X = [ones(m, 1), X]; % Add a column of ones to x
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
yp =[ones(size(X_dev,1),1) X_dev ] * theta;
error = yp - y_dev;
MAE=mean( abs(error) )
RMSE = sqrt( mean(error.^2) )
% Predict values for population sizes of 35,000 and 70,000

fprintf('Program paused. Press enter to continue.\n');
pause;
