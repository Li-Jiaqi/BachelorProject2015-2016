clear all;
count=0;
for i=203:333
    for j=1:4
        % E:\AVECdata\Training_AudioFeatures\Training\formant_readnovel\fmt_mat_train\
        % E:\AVECdata\Development_AudioFeatures\Development\formant_readnovel\fmt_mat_dev\
        
        filename=['E:\AVECdata\Development_AudioFeatures\Development\formant_readnovel\fmt_mat_dev\\htk_' ...
            num2str(i) '_' num2str(j) '_cut_audio_readnovel_formant.mat'];
        
        if exist(filename,'file')~=0
            dataname=['htk_' num2str(i) '_' num2str(j) '_cut_audio_readnovel_formant'];
            count=count+1
            features=[];
            load(filename);
            
                 
            % dataname transpose
            eval(  ['[X1,X2,X3,X4]=getX_formant(' dataname ');']  );
            features = [corr_fea_extract(X1),corr_fea_extract(X2),corr_fea_extract(X3),corr_fea_extract(X4)];
           
            ansname=['htk_' num2str(i) '_' num2str(j) '_cut_audio_readnovel_fmt_corr'];
%%
            eval([ansname '=features;']);
            savename=[ansname '.mat'];
            eval(['save ',savename,' ',ansname,';']);
            
        else
            continue;
        end
        
    end    
end
