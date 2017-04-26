%%  version 1
% function [X1,X2,X3,X4]=getX_MFCC(Sigs,num)
%     n=3000*(num-1)+1;
%     nc=16;
%     nd=4;
% 
%     X1=[];
%     k=1;
%     for i=0:9
%         mblock=Sigs(n-k*i:n+5999-k*i,:);  % mblock is a delay matrix
%         X1=[X1,mblock];
%     end
% 
%     X2=[];
%     k=2;
%     for i=0:9
%         mblock=Sigs(n-k*i:n+5999-k*i,:);
%         X2=[X2,mblock];
%     end
%     X3=[];
%     k=4;
%     for i=0:9
%         mblock=Sigs(n-k*i:n+5999-k*i,:);
%         X3=[X3,mblock];
%     end
%     X4=[];
%     k=8;
%     for i=0:9
%         mblock=Sigs(n-k*i:n+5999-k*i,:);
%         X4=[X4,mblock];
%     end
% end

%% version 2
function [X1,X2,X3,X4]=getX_MFCC(Sigs,num)
    n=3000*(num-1)+1;
    nc=16;
    nd=4;

    X11=[];
    k=1;
    for i=0:9
        mblock=Sigs(n-k*i:n+5999-k*i,:);  % mblock is a delay matrix
        X11=[X11,mblock];
    end
    X1=[];
    for channel=1:nc
        X1=[X1,X11(:,channel:nc:end)];
    end
    
    
    X22=[];
    k=2;
    for i=0:9
        mblock=Sigs(n-k*i:n+5999-k*i,:);
        X22=[X22,mblock];
    end
    %%%
    X2=[];
    for channel=1:nc
        X2=[X2,X22(:,channel:nc:end)];
    end
    %%%
    
    
    X33=[];
    k=4;
    for i=0:9
        mblock=Sigs(n-k*i:n+5999-k*i,:);
        X33=[X33,mblock];
    end
    X3=[];
    for channel=1:nc
        X3=[X3,X33(:,channel:nc:end)];
    end

    
    X44=[];
    k=8;
    for i=0:9
        mblock=Sigs(n-k*i:n+5999-k*i,:);
        X44=[X44,mblock];
    end
    X4=[];
    for channel=1:nc
        X4=[X4,X44(:,channel:nc:end)];
    end
end