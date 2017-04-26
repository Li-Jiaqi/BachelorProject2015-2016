function feas = corr_fea_extract( X)
%%% feas =corr_fea_extract( X ) extract features from 
%        covariance matrix C and correlation matrix R per block
%%%  Input: 
%       C: covariance matrix 
%       R: correlation matrix
%              both with dim=(nc x nd)* (nc x nd)
%%%  Output: 
%      feas: a row vector of two types features with dim=1 * ( (nc x nd)+2)
%       lambda: eigenspectrum of R (with num= nc * nd) 
%       logpower: log of total power
%       entropy: appromixmation of entropy
[ R,C ] = rc( X );

nc_nd = size(R,1);
feas = zeros(1,nc_nd+2);

lambda=eig(R);
logpower=log(trace(C));
entropy = log(det(C));
%   features
feas=[lambda',logpower,entropy];
end
