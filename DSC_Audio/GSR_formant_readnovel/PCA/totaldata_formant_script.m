
clear all;
path='E:\AVECdata\Training_AudioFeatures\Training\formant_readnovel\formant_corr\';
% name format: "htk_203_1_cut_audio_readnovel_fmt_corr.mat"
total_data=[];
count=0;
for i=203:333
   for j=1:4
       dataname=['htk_' num2str(i) '_' num2str(j) '_cut_audio_readnovel_fmt_corr'];
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

total_data_formant = total_data;
save total_data_formant total_data_formant;

[Evalues, U_formant, mean_train_formant ,score]=PCA(total_data_formant');
save mean_train_formant mean_train_formant;
save U_formant U_formant