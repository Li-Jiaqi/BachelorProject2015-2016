%%%%% Adaptation for all file
%   read from pca directory
function adaptation_noweighted(pathname,Ml,Sl,Mh,Sh)
    load('dev_label_3.mat')
    load('Thresholds.mat')
    load('train_label_3.mat')

% addpath('E:\AVECdata\Development_AudioFeatures\Development\formant_dev_pca\');
% addpath('E:\AVECdata\Training_AudioFeatures\Training\formant_training_pca\');
    addpath(pathname);
    for i=1:50
        subj=train_label_3(i,1);
        part=train_label_3(i,2);
        label=train_label_3(i,3);

        dataname=['htk_' num2str(subj) '_' num2str(part) '_cut_audio_formant_corr_pca'];
        filename=[dataname '.mat'];
%         load([path ,filename]);
        load(filename);
        eval(['features=' dataname ';']);
        [Ml,Sl,Mh,Sh] = SubjectAdaptation(features,label,Ml,Sl,Mh,Sh,Thresholds);
           
        eval(['clear ' dataname]);
    end
    
    
    end