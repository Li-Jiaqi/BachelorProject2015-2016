function X_centration=normalize_f(X)
%%% function X_centration=normalize_g(X) normalizes 
%%%   each column of X to zero mean.
%     X : matrix of channel-delay signals in a block, 
%          dim= ns * (nc x nd) with:
%             nc: number of channels e.g. 3 for formant, 16 for MFCC
%             nd: nunber of time-delay
%             ns: number of samples per block
    X_mean=mean(X);
    X_centration = bsxfun(@minus,X,X_mean);
    
end