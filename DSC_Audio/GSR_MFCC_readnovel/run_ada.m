load('train_label_3.mat')
[Ml,Sl,Mh,Sh]=GMM_8_threshold(train_label_3,'E:\AVECdata\Training_AudioFeatures\Training\MFCC_delta_training_pca\',[5:5:40]);
load('Thresholds.mat');
adaptation_noweighted('E:\AVECdata\Training_AudioFeatures\Training\MFCC_delta_training_pca\',Ml,Sl,Mh,Sh);
[S_t_MFCC,count] = scoreCompute('E:\AVECdata\Training_AudioFeatures\Training\MFCC_delta_training_pca\',Ml,Sl,Mh,Sh);
[S_d_MFCC,count] = scoreCompute('E:\AVECdata\Development_AudioFeatures\Development\MFCC_delta_dev_pca\',Ml,Sl,Mh,Sh);
save S_t_MFCC S_t_MFCC
save S_d_MFCC S_d_MFCC
load('DepressionLabels_dev.mat')
load('DepressionLabels_training.mat')
plot(mean(S_t_MFCC,2),DepressionLabels_training,'ro',mean(S_d_MFCC,2),DepressionLabels_dev,'b+');
legend('training: o','dev: +','Location','northwest')