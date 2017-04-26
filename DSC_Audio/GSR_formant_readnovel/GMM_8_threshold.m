function [GMM_models]=GMM_8_threshold(mylabelfile,fea_path,Thresholds)
%%% GMM_8_threshold() return 8 pairs of Gaussians,with 8 threshold 5:5:40
%     Input:
%         mylabelfile: a 50*3 matrix, with each row represents [subject part label]
%                     just like "203 1 3" 
%         fea_path: path of features ".mat" files
%     Output:
%         Ml,Mh are 8-columns matrix,each column is a mean of a Gaussian
%         Sl,Sh: every 8 columns is a covariance matrix of a Gaussian
%%% Example: GMM_8_threshold(train_label_3,'E:\AVECdata\Training_AudioFeatures\Training\MFCC_delta_training\')
    GMM_models=cell( length(Thresholds), 2 );
% fea_path='E:\AVECdata\Training_AudioFeatures\Training\MFCC_delta_training_pca\'
%          'E:\AVECdata\Development_AudioFeatures\Development\MFCC_delta_dev_pca\'
%    
    for i=1:length(Thresholds)     % MIT  Threshold=5:5:40
        [GMM_low,GMM_high]=...
            GMM_pairs(Thresholds(i),mylabelfile,fea_path);
        GMM_models{i,1}=GMM_low;
        GMM_models{i,2}=GMM_high;
        
    end

end