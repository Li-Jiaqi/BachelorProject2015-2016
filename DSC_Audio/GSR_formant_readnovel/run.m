load('train_label_3.mat')
[GMM_models]=GMM_8_threshold(train_label_3,'E:\AVECdata\formant_readnovel\formant_train_corr_pca\',[5:5:35]);
[S_t_formant,count] = scoreCompute('E:\AVECdata\formant_readnovel\formant_train_corr_pca\',GMM_models);
[S_d_formant,count] = scoreCompute('E:\AVECdata\formant_readnovel\formant_dev_corr_pca\',GMM_models);
save S_t_formant S_t_formant
save S_d_formant S_d_formant
load('DepressionLabels_dev.mat')
load('DepressionLabels_training.mat')
plot(mean(S_t_formant,2),DepressionLabels_training,'ro',mean(S_d_formant,2),DepressionLabels_dev,'b+');
legend('training: o','dev: +','Location','northwest')
