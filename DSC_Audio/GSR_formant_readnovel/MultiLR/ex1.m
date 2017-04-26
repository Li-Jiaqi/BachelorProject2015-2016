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
load('S_d_formant.mat')
load('S_t_formant.mat')
X = [mean(S_t_formant,2)];
y = DepressionLabels_training;
X_dev = [mean(S_d_formant,2)];
y_dev = DepressionLabels_dev;

% load('DepressionLabels_dev.mat')
% load('DepressionLabels_training.mat')
% load('S_d_formant_10.mat')
% load('S_t_formant_10.mat')
% X = [mean(S_t_formant_10,2)];
% y = DepressionLabels_training;
% X_dev = [mean(S_d_formant_10,2)];
% y_dev = DepressionLabels_dev;

m = length(y); % number of training examples
%% =================== Part 3: Gradient descent ===================
fprintf('Running Gradient Descent ...\n')

X = [ones(m, 1), X]; % Add a column of ones to x
theta = zeros(2, 1); % initialize fitting parameters

% Some gradient descent settings
iterations = 1500;
alpha = 0.01;

% compute and display initial cost
computeCost(X, y, theta);

% run gradient descent
theta = gradientDescent(X, y, theta, alpha, iterations);

% print theta to screen
fprintf('Theta found by gradient descent: ');
fprintf('%f %f \n', theta(1), theta(2));

fprintf('plot training data: \n');
plot(X(:,2),y,'ro');
hold on 
ylabel('BDI score'); % Set the y?axis label
xlabel('test statisitcs'); % Set the x?axis label
pause
fprintf('plot training data: \n');
plot(X_dev(:,1),y_dev,'b*');
fprintf('Press enter to see the 2nd order regression curve:\n');
pause
hold on
t= [ min( [X(:,2);X_dev(:,1)] ) :0.01: max( [X(:,2);X_dev(:,1)]) ];
yt=theta(1) + theta(2)*t;
plot(t,yt);

legend('Training data', 'Linear regression','Location','northwest')
hold off % don't overlay any more plots on this figure
yp =[ones(size(X_dev,1),1) X_dev ] * theta;
yp( find(yp<0) )=0;
yp=round(yp);
error = yp - y_dev;
MAE=mean( abs(error) )
RMSE = sqrt( mean(error.^2) )
