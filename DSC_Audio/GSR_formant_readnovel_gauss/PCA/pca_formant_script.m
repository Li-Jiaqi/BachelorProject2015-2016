%   read from original directory
clear all;

pathname='E:\AVECdata\Training_AudioFeatures\Training\formant_training\';
totaldata_t_formant_pca=[];

% pathname='E:\AVECdata\Development_AudioFeatures\Development\formant_dev\';
% totaldata_d_formant_pca=[];

% name format: "htk_203_1_cut_audio_mfcc_delta_corr.mat"
 load('mean_train_formant.mat')
load('U_formant.mat')
count=0;
for i=203:333
   for j=1:4

       dataname=['htk_' num2str(i) '_' num2str(j) '_cut_audio_formant_corr'];
       filename=[dataname '.mat'];
       
       if exist([pathname filename],'file')
           fea=[];
           count=count+1
           load([pathname filename]);
           
           dataname2=['htk_' num2str(i) '_' num2str(j) '_cut_audio_formant_corr_pca'];
           filename2=[dataname2 '.mat'];
           eval( [ dataname2 , '=pcaWith(' ,dataname ',mean_train_formant,U_formant,5 );' ] );
           
           eval( ['totaldata_t_formant_pca=[totaldata_t_formant_pca;' dataname2 '];'] );
%            eval( ['totaldata_d_formant_pca=[totaldata_d_formant_pca;' dataname2 '];'])
           
           eval( ['save ' filename2 ' ' dataname2]);
       else 
           continue;
       end
       
   end
end

save totaldata_t_formant_pca totaldata_t_formant_pca;
% save totaldata_d_formant_pca totaldata_d_formant_pca;