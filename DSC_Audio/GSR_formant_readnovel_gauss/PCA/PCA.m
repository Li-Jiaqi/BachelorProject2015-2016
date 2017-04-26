function [Evalues, Evectors, x_mean_inrow ,score]=PCA(x)
% PCA using Single Value Decomposition
% Obtaining mean vector, eigenvectorsand eigenvalues
%
% [Evalues, Evectors, x_mean]=PCA(x);
%
% inputs,
%   X : M x N matrix with M the trainingvector length and N the number
%              of training data sets
%%%%%%%%%%%%  每一列是一个样本 %%%%%%%%%%%%
% outputs,
%   Evalues : The eigen values of the data
%   Evector : The eigen vectors of the data(in column)
%   x_mean : The mean training vector
%
%
    n=size(x,2);
    % Calculate the mean 
    x_mean=sum(x,2)/n;  

    % Substract the mean
    x2=(x-repmat(x_mean,1,n))/ sqrt(n-1);  %% normalization

    % Do the SVD    奇异值分解
    %[U2,S2] = svds(x2,s); 
    %%% s = svds(A,k) computes the k largest singular values and associated singular vectors of matrix A.
    [U2,S2] = svd(x2,0);
    %%% [U,S,V] = svd(X,0) produces the "economy size" decomposition. If X is m-by-n with m > n, 
    %%% then svd computes only the first n columns of U and S is n-by-n.

    Evalues=diag(S2).^2;
    Evectors=bsxfun(@times,U2,sign(U2(1,:)));
    x_mean_inrow = x_mean';
    score=cumsum(Evalues)./sum(Evalues);
end