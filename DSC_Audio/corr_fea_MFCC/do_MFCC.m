clear all;
% i=241;
% j=2;
i=223;
j=2;
 filename=['E:\AVECdata\Training_AudioFeatures\Training\mfcc32_mat_train\htk_' ...
            num2str(i) '_' num2str(j) '_cut_audio_mfcc.mat'];
dataname=['htk_' num2str(i) '_' num2str(j) '_cut_audio_mfcc'];
load(filename);
% eval(['temp=' dataname '(:,17:32);']);
eval(['temp=' dataname '(:,1:16);']);
[nbblock]=get_blocks(temp,6000,3000);
[X1,X2,X3,X4]=getX_MFCC(temp,round(nbblock/2));

[R1,C1] = rc(X1);
[R2,C2] = rc(X2);
[R3,C3] = rc(X3);
[R4,C4] = rc(X3);

figure;
imagesc(R1);
% title('R1-delta-MFCC');
title('R1-MFCC');
colorbar;
colormap(jet);
saveas(gcf,[num2str(i) '_' num2str(j) '_MFCC_R1'],'bmp');
% saveas(gcf,[num2str(i) '_' num2str(j) '_delta_MFCC_R1'],'bmp');

figure;
imagesc(R2);
% title('R2-delta-MFCC');
title('R2-MFCC');
colorbar;
colormap(jet);
saveas(gcf,[num2str(i) '_' num2str(j) '_MFCC_R2'],'bmp');
% saveas(gcf,[num2str(i) '_' num2str(j) '_delta_MFCC_R2'],'bmp');

figure;
imagesc(R3);
% title('R3-delta-MFCC');
title('R3-MFCC');
colorbar;
colormap(jet);
saveas(gcf,[num2str(i) '_' num2str(j) '_MFCC_R3'],'bmp');
% saveas(gcf,[num2str(i) '_' num2str(j) '_delta_MFCC_R3'],'bmp');

figure;
imagesc(R4);
% title('R4-delta-MFCC');
title('R4-MFCC');
colorbar;
colormap(jet);
saveas(gcf,[num2str(i) '_' num2str(j) '_MFCC_R4'],'bmp');
% saveas(gcf,[num2str(i) '_' num2str(j) '_delta_MFCC_R4'],'bmp');