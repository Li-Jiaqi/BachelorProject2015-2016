function mhh=mhh_comp(f,m)

% f is the binary sequence
% m is the maximum hist 
len=length(f);
%bar(f);
count=0;
mhh=zeros(m,1);
index=0;
for i=1:len
%    i
    tmp=f(i);
    if tmp==1
        index=1;
        count=count+1;
    else
        if index==1
            if count<m+1
                mhh(count)=mhh(count)+1;
            else
                mhh(m)=mhh(m)+1;
            end;
            count=0;index=0;
        else
            count=0;
        end;
    end;
    if (i==len)&(count>0)
        if count<m+1
            mhh(count)=mhh(count)+1;
        else
            mhh(m)=mhh(m)+1;
        end; 
    end;    
end;
        
        