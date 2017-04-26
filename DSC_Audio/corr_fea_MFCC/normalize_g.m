function X_norm = normalize_g(X)
%%% function X_norm=normalize_g(X) normalizes 
%%%   each column of X to zero mean, unit variance
%     X : matrix of channel-delay signals in a block, 
%          dim= ns * (nc x nd) with:
%             nc: number of channels e.g. 3 for formant, 16 for MFCC
%             nd: nunber of time-delay
%             ns: number of samples per block
    X_mean = mean(X);
    X_std = std(X);
    X_norm = bsxfun(@minus,X,X_mean);
    X_norm = bsxfun(@rdivide, X_norm , X_std); 
end