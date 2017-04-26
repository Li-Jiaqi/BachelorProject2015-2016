clear all;
count = 0;
for j = 203:333
    for i = 1:4
        s1 = num2str(j);
        s2 = num2str(i);
        %   'E:\AVECdata\Training_Audio_readnovel\'
        %   'E:\AVECdata\Development_Audio_readnovel\'
%         filename = ['E:\AVECdata\Training_Audio_readnovel\' s1 '_' s2 '_cut_audio_readnovel.mp4'];
        filename = ['E:\AVECdata\Development_Audio_readnovel\' s1 '_' s2 '_cut_audio_readnovel.mp4'];
        fid = fopen(filename);
        if fid>0
             count = count +1
             fea = audioread(filename);
             [fmt] = formant(fea,2000,44100);
             ansname=['htk_' s1 '_' s2 '_cut_audio_readnovel_formant'];
             eval([ansname '=fmt;']);
             savename=[ansname '.mat'];
             eval(['save ',savename,' ',ansname,';']);
        end
        
        
        
    end
end