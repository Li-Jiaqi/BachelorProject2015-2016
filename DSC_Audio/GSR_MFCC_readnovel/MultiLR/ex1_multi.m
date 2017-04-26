
%% Machine Learning Online Class
%  Exercise 1: Linear regression with multiple variables
%     warmUpExercise.m
%     plotData.m
%     gradientDescent.m
%     computeCost.m
%     gradientDescentMulti.m
%     computeCostMulti.m
%     featureNormalize.m
%     normalEqn.m
%% ================ Part 1: Feature Normalization ================

%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

%% Load Data
load('DepressionLabels_dev.mat')
load('DepressionLabels_training.mat')

load('S_d_MFCC.mat')
load('S_t_MFCC.mat')
X = [mean(S_t_MFCC,2) mean(S_t_MFCC,2).^2];
y = DepressionLabels_training;
X_dev = [mean(S_d_MFCC,2) mean(S_d_MFCC,2).^2];
y_dev = DepressionLabels_dev;

% load('S_d_MFCC_10.mat')
% load('S_t_MFCC_10.mat')
% X = [mean(S_t_MFCC_10,2) mean(S_t_MFCC_10,2).^2];
% y = DepressionLabels_training;
% X_dev = [mean(S_d_MFCC_10,2) mean(S_d_MFCC_10,2).^2];
% y_dev = DepressionLabels_dev;

m = length(y);

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
alpha = 0.03;
num_iters = 400;

% Init Theta and Run Gradient Descent 
theta = zeros(3,1);
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');


%%
% Recall that the first column of X is all-ones. Thus, it does
% not need to be normalized.
fprintf('Error messure with MLR:\n');
X_dev_norm=bsxfun(@minus,X_dev,mu);
X_dev_norm=bsxfun(@rdivide,X_dev_norm,sigma);
yp =[ones(size(X_dev,1),1) X_dev_norm ] * theta;
yp( find(yp<0) )=0;
yp=round(yp);
error = yp - y_dev;
MAE=mean( abs(error) )
RMSE = sqrt( mean(error.^2) )
% ============================================================
%%  

plot(X(:,2),y,'ro');
hold on 
ylabel('BDI score'); % Set the y?axis label
xlabel('test statisitcs'); % Set the x?axis label
pause
plot(X_dev(:,1),y_dev,'b*');
fprintf('Press enter to see the 2nd order regression curve:\n');
pause
t= [ min( [X(:,2);X_dev(:,1)] ) :0.01: max( [X(:,2);X_dev(:,1)]) ];
yt=theta(1) + theta(2)*t + theta(3)*t.^2;
plot(t,yt);
