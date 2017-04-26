%   read from original directory
clear all;
%  pathname='E:\AVECdata\Training_AudioFeatures\Training\MFCC_delta_training\';
pathname='E:\AVECdata\Development_AudioFeatures\Development\MFCC_delta_dev\';
% name format: "htk_203_1_cut_audio_mfcc_delta_corr.mat"
load('mean_train_MFCC.mat')
% load('std_train_MFCC.mat')
load('U_MFCC.mat')
count=0;
for i=203:333
   for j=1:4

       dataname=['htk_' num2str(i) '_' num2str(j) '_cut_audio_mfcc_delta_corr'];
       filename=[dataname '.mat'];
       
       if exist([pathname filename],'file')
           fea=[];
           count=count+1
           load([pathname filename]);
           
           dataname2=['htk_' num2str(i) '_' num2str(j) '_cut_audio_mfcc_delta_pca'];
           filename2=[dataname2 '.mat'];
           % eval( [ dataname2 , '=pcaWith(' ,dataname ',mean_train_MFCC, std_train_MFCC,U_MFCC,6 );' ] );
           eval( [ dataname2 , '=pcaWith(' ,dataname ',mean_train_MFCC ,U_MFCC,6 );' ] );
           eval( ['save ' filename2 ' ' dataname2]);
       else 
           continue;
       end
       
   end
end