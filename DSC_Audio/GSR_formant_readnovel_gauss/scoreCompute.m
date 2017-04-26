function [S,count] = scoreCompute(pathname,Ml,Sl,Mh,Sh)
% 'E:\AVECdata\Training_AudioFeatures\Training\formant_training_pca\'
%  'E:\AVECdata\Development_AudioFeatures\Development\formant_dev_pca\'
    S=[];
    count=0;
    for i=203:333
       for j=1:4

           dataname=['htk_' num2str(i) '_' num2str(j) '_cut_audio_readnovel_fmt_corr_pca'];
           filename=[dataname '.mat'];

           if exist([pathname filename],'file')
               count=count+1;
               load([pathname filename]);
               eval( [ 'score' , '= LMLR(' ,dataname ',Ml,Sl,Mh,Sh );' ] );
               S=[S;score];
           else 
               continue;
           end

       end
    end

end

