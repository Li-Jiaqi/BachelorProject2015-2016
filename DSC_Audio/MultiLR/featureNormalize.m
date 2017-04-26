function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the 
%               standard deviation of each feature and divide
%               each feature by it's standard deviation, storing
%               the standard deviation in sigma. 
%
%               Note that X is a matrix where each column is a 
%               feature and each row is an example. You need 
%               to perform the normalization separately for 
%               each feature. 
%
% Hint: You might find the 'mean' and 'std' functions useful.
%       
mu=mean(X_norm);
sigma=std(X_norm);
%==========考虑标准差为0的情况====%
% for j=1:size(sigma,1)
%     if sigma(j)==0
%         sigma(j)=X_norm(1,j);
%     end
% end
%==========feature scaling ====%
X_norm=bsxfun(@minus,X_norm,mu);
X_norm=bsxfun(@rdivide,X_norm,sigma);

% X_norm=X_norm.-repmat(mu,size(X_norm(:,i)) );
% X_norm=X_norm./repmat(sigma,size(X_norm(:,i)) );

% ============================================================

end
