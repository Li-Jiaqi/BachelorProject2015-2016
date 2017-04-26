
clear all;
path='E:\AVECdata\Training_AudioFeatures\Training\MFCC_delta_training\';
% path='E:\AVECdata\Training_AudioFeatures\Training\MFCC_training_corr\';
% name format: "htk_203_1_cut_audio_mfcc_delta_corr.mat"
% name format: "htk_203_1_cut_audio_mfcc_corr.mat"
total_data=[];
count=0;
for i=203:333
   for j=1:4
       dataname=['htk_' num2str(i) '_' num2str(j) '_cut_audio_mfcc_delta_corr'];
%        dataname=['htk_' num2str(i) '_' num2str(j) '_cut_audio_mfcc_corr'];
       filename=[path dataname '.mat'];
       
       if exist(filename,'file')
           count=count+1
           load(filename);
           eval([ 'total_data = [total_data;' dataname '];'  ]);
           eval(['clear ' dataname]);
       else 
           continue;
       end
       
   end
end
total_data_MFCC = total_data;
save total_data_MFCC total_data_MFCC;

% [total_data_MFCC_norm, mean_train_MFCC, std_train_MFCC] = featureNormalize(total_data_MFCC);
% save mean_train_MFCC mean_train_MFCC;
% save std_train_MFCC std_train_MFCC;
% [U_MFCC,D_MFCC,mu_MFCC,sigma_MFCC] = MyPCA(total_data_MFCC);
% save U_MFCC U_MFCC;
% PCAscore=cumsum(D_MFCC)/sum(D_MFCC);

[Evalues, U_MFCC, mean_train_MFCC ,score]=PCA(total_data_MFCC');
save mean_train_MFCC mean_train_MFCC;
save U_MFCC U_MFCC