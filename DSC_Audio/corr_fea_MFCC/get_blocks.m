function [nbblock]=get_blocks(Sigs,lenWindow,lenShift)
% function [SigsInBlock,nbblock]=get_blocks(Sigs,lenWindow,lenShift)
%%%   [SigsInBlock,nbblocks]=get_blocks(Sigs,lenWindow,lenShift) 
%        from original signal matrix Sigs
%%%    Input:
%          Sigs: matrix of signals (dim= ns * nc)
%                   ns: number of sample points
%                   nc: num of channels
%          lenWindow: length of window (in sampl points)
%          lenShift: length of shift(in sampl points)
%%%    Ouput:
%           SigsInBlocks: signals in block(window,frame)
%                    dim = (lenWindow * nbframes) * nc
%           nbblock: num of block(window,frame)
    padding=false; window=false; direction='cols';
    nc=size(Sigs,2);
    SigsInBlock=[];
    for c=1:nc
        [frames, indexes]= vec2frames(Sigs(:,c),lenWindow,lenShift, direction, window, padding );
        nbblock=size(frames,2);
        s=frames(:); 
        SigsInBlock=[SigsInBlock,s];
    end

end