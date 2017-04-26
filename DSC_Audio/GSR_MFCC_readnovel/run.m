load('train_label_3.mat')
[Ml,Sl,Mh,Sh]=GMM_8_threshold(train_label_3,'E:\AVECdata\MFCC_readnovel\read_deltamfcc_corr_tra_pca\',[5:5:40]);
[S_t_MFCC,count] = scoreCompute('E:\AVECdata\MFCC_readnovel\read_deltamfcc_corr_tra_pca\',Ml,Sl,Mh,Sh);
[S_d_MFCC,count] = scoreCompute('E:\AVECdata\MFCC_readnovel\read_deltamfcc_corr_dev_pca\',Ml,Sl,Mh,Sh);
save S_t_MFCC S_t_MFCC
save S_d_MFCC S_d_MFCC
load('DepressionLabels_dev.mat')
load('DepressionLabels_training.mat')
plot(mean(S_t_MFCC,2),DepressionLabels_training,'ro',mean(S_d_MFCC,2),DepressionLabels_dev,'b+');
legend('training: o','dev: +','Location','northwest')


