load('train_label_3.mat')
[Ml,Sl,Mh,Sh]=GMM_8_threshold(train_label_3,'E:\AVECdata\formant_readnovel\formant_train_corr_pca\',[5:5:40]);
[S_t_formant,count] = scoreCompute('E:\AVECdata\formant_readnovel\formant_train_corr_pca\',Ml,Sl,Mh,Sh);
[S_d_formant,count] = scoreCompute('E:\AVECdata\formant_readnovel\formant_dev_corr_pca\',Ml,Sl,Mh,Sh);
save S_t_formant S_t_formant
save S_d_formant S_d_formant
load('DepressionLabels_dev.mat')
load('DepressionLabels_training.mat')
plot(mean(S_t_formant,2),DepressionLabels_training,'ro',mean(S_d_formant,2),DepressionLabels_dev,'b+');
legend('training: o','dev: +','Location','northwest')

% [Ml,Sl,Mh,Sh]=GMM_8_threshold(train_label_3,'E:\AVECdata\Training_AudioFeatures\Training\formant_training_pca\',[10:10:40]);
% [S_t_formant_10,count] = scoreCompute('E:\AVECdata\Training_AudioFeatures\Training\formant_training_pca\',Ml,Sl,Mh,Sh);
% [S_d_formant_10,count] = scoreCompute('E:\AVECdata\Development_AudioFeatures\Development\formant_dev_pca\',Ml,Sl,Mh,Sh);
% save S_t_formant_10 S_t_formant_10
% save S_d_formant_10 S_d_formant_10
% load('DepressionLabels_dev.mat')
% load('DepressionLabels_training.mat')
% plot(mean(S_t_formant_10,2),DepressionLabels_training,'ro',mean(S_d_formant_10,2),DepressionLabels_dev,'b+');
% legend('training: o','dev: +','Location','northwest')

