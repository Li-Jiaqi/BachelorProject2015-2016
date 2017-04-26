[S_t_formant,count] = scoreCompute('E:\AVECdata\Training_AudioFeatures\Training\formant_training_pca\',Ml,Sl,Mh,Sh);
[S_d_formant,count] = scoreCompute('E:\AVECdata\Development_AudioFeatures\Development\formant_dev_pca\',Ml,Sl,Mh,Sh);
save S_t_formant S_t_formant;
save S_d_formant S_d_formant;
load('DepressionLabels_training.mat')
load('DepressionLabels_dev.mat')
subplot(1,2,1);
plot(mean(S_t_formant,2),DepressionLabels_training,'ro');
subplot(1,2,2);
plot(mean(S_d_formant,2),DepressionLabels_dev,'bo');
