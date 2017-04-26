function lpq_mhh_s2m%(filename,threshould,M) 
% filename: avi file that can be read by Matlab
% threshould: thr_diff in the following for the difference threshould
% between two grayscale frames, normally thr_diff=20 is OK for most video
% M: scales, normally M=5 is enough 
count = 0;
doNothing = 0;
fea_tr=[];
lab_tr=[];
%tic     
for j = 203:332
   for i = 1:4
        s1 = num2str(j);
        s2 = num2str(i);
        %filename = ['D:\Avec2013_Test&Train\AVEC2013\Training_AudioVisual\Training\' s1 '_' s2 '_cut_combined.mp4'];
        %filename = ['E:\\AVECdata\\Training_VideoFeatures1\\Training1\\' s1 '_' s2 '_cut_combined_geometric.csv'];
        %=========read LPQ file==========
        filename = ['E:\\AVECdata\\Training_VideoFeatures1\\Training1\\' s1 '_' s2 '_cut_combined_LPQ.csv'];
        %=========read Depression labels file==========
        filename2 = ['E:\\AVECdata\\Training_DepressionLabels\\' s1 '_' s2 '_Depression.csv'];
        fid= fopen(filename);
        if fid > 0
            count = count + 1
            tic
            fea=csvread(filename);
            lab=csvread(filename2);
            %lab=csvread('C:\brunel\matlab\avec2013\Training_DepressionLabels\203_1_Depression.csv')
            [nFrames no_fea]= size(fea);
            hist=5;
            MHH=zeros(no_fea,hist);
            MHH2=zeros(no_fea*hist);
            f_end=nFrames;
            f_start=1;
            threshould=0.05;
           frame_pre_gry=fea(1,:); %double(rgb2gray(frame_pre));
           thr_diff=threshould;                            
           frame_mark=zeros(no_fea,f_end-f_start,'int8');
           for iii=f_start+1: f_end
                 frame_crt_gry=fea(iii,:);%double(rgb2gray(frame_crt));
                 frame_diff=zeros(1,no_fea);
                 frame_diff_inx=find(abs(frame_crt_gry - frame_pre_gry) > thr_diff);
                 frame_diff(frame_diff_inx)=1; 
                 frame_mark(:,iii-f_start)=frame_diff;             
                 frame_pre_gry=frame_crt_gry;
                 clear frame_crt_gry;
           end;
           for ii=1:no_fea%row  
                fg=frame_mark(ii,:); 
                MHH(ii,:)=mhh_comp(fg,hist); 
           end;
           MHH2=reshape(MHH,no_fea*hist,1);
           fea_tr=[fea_tr; MHH2'];
           lab_tr=[lab_tr; lab];
           fname=['D:\AVEC code\videoLPQ_MHH\LPQ_' s1 '_' s2 '_mhh.mat'];
           save(fname, 'MHH','MHH2','lab');% mhh_file MHH;
           clear frame_mark MHH;
           toc
 %        end;
        else
            doNothing = doNothing +1;
        end;
   end;
end;
% fname_all=['D:\AVEC code\Test2\geoT_tr_mhh.mat'];
fname_all=['D:\AVEC code\videoLPQ_MHH\LPQ_mhh_tr.mat'];
save(fname_all, 'fea_tr','lab_tr');% mhh_file MHH;


  
