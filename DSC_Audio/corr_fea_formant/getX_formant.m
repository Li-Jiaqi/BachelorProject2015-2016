function [X1,X2,X3,X4]=getX_formant(frames)
    i=1+3000;
    nd = 4;
    nc = 3;
    
    X11=[];
    j=1;
    for k=0:29
        mblock=frames(i-k*j:end-j*k, :);
        X11=[X11,mblock];
    end
    X1=[];
    for channel=1:nc
        X1=[X1,X11(:,channel:nc:end)];
    end
    
    X22=[];
    j=2;
    for k=0:29
        mblock=frames(i-j*k:end-j*k,:);
        X22=[X22,mblock];
    end
    X2=[];
    for channel=1:nc
        X2=[X2,X22(:,channel:nc:end)];
    end
    
    X33=[];
    j=4;
    for k=0:29
        mblock=frames(i-j*k:end-j*k,:);
        X33=[X33,mblock];
    end
    X3=[];
    for channel=1:nc
        X3=[X3,X33(:,channel:nc:end)];
    end
    
    X44=[];
    j=8;
    for k=0:29
         mblock=frames(i-j*k:end-j*k,:);
        X44=[X44,mblock];
    end
    X4=[];
    for channel=1:nc
        X4=[X4,X44(:,channel:nc:end)];
    end
    
end