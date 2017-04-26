load('DepressionLabels_dev.mat')
load('DepressionLabels_training.mat')
load('S_d_formant.mat')
load('S_t_formant.mat')

% [yp, error,MAE,RMSE]=pls_calculate(mean(S_t_formant,2),DepressionLabels_training,mean(S_d_formant,2),DepressionLabels_dev)
% [yp, error,MAE,RMSE]=pls_calculate(S_t_formant,DepressionLabels_training,S_d_formant,DepressionLabels_dev)


% [yp, error,MAE,RMSE]=pls_calculate(mean(S_t_formant_10,2),DepressionLabels_training,mean(S_d_formant_10,2),DepressionLabels_dev)
[yp, error,MAE,RMSE]=pls_calculate(S_t_formant_10,DepressionLabels_training,S_d_formant_10,DepressionLabels_dev)