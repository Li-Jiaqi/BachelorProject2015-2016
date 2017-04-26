function [Ml,Sl,Mh,Sh]=GMM_8_threshold(mylabelfile,fea_path,Thresholds)
%%% GMM_8_threshold() return 8 pairs of Gaussians,with 8 threshold 5:5:40
%     Input:
%         mylabelfile: a 50*3 matrix, with a row represents [subject part label]
%                     just like "203 1 3" 
%         fea_path: path of features ".mat" files
%     Output:
%         Ml,Mh are 8-columns matrix,each column is a mean of a Gaussian
%         Sl,Sh: every 8 columns is a covariance matrix of a Gaussian
%%% 
%   'E:\AVECdata\Training_AudioFeatures\Training\formant_training_pca\'
    Ml=[];
    Mh=[];
    Sl=[];
    Sh=[];
% fea_path='\'
%          '\'
%    
    for i=1:length(Thresholds)     %Threshold=5:5:40
        [mu_low,sigma_low,mu_high,sigma_high]=...
            Gaussian_pairs(Thresholds(i),mylabelfile,fea_path);
        Ml=[Ml,mu_low]; % a column, a mean
        Mh=[Mh,mu_high];
        
%%        regularization    
         Sl=[Sl,sigma_low+0.2*eye(size(sigma_low))];   % with  regularization    
%          Sl=[Sl,sigma_low];                          % without regularization  
%%          regularization  
         Sh=[Sh,sigma_high+0.2*eye(size(sigma_high))];  % with  regularization    
%         Sh=[Sh,sigma_high];                           % without regularization  
    end

end