function [fmt] = formant(sig,Nt,fs,Nlpc)
    if nargin<4
        Nlpc = round(fs/1000)+2; end;
    ls=length(sig);                                   % ���ݳ���
    Nwin = 441;  % ֡��
    wyz = floor(ls/Nwin);
    for m=1:wyz
        lpcsig = sig((Nwin*(m-1)+1):min([(Nwin*m) ls]));% ȡ��һ֡�ź�
        if sum(abs(lpcsig(:)))==0
            continue;
        end
        if ~isempty(lpcsig),
            a = lpc(lpcsig,Nlpc);                   % ����LPCϵ��
            const=fs/(2*pi);                          % ����  
            rts=roots(a);                             % ���
            k=1;                                      % ��ʼ��
            yf = [];
            bandw=[];
            for i=1:length(a)-1                     
                re=real(rts(i));                      % ȡ��֮ʵ��
                im=imag(rts(i));                      % ȡ��֮�鲿
                formn=const*atan2(im,re);             % ���㹲���Ƶ��
                bw=-2*const*log(abs(rts(i)));         % �������

                if formn>150 & bw <700 & formn<fs/2   % �����������ܳɹ����ʹ���
                yf(k)=formn;
                bandw(k)=bw;
                k=k+1;
                end
            end

            [y, ind]=sort(yf);                        % ����
            bw=bandw(ind);
            F = [0 0 0];                        % ��ʼ��
            F(1:min(3,length(y))) = y(1:min(3,length(y))); % ����������
            F = F(:);                                 % �������
            fmt(:,m)=F/(fs/2);                        % ��һ��Ƶ��  
        end
    end
    fmt=fmt';
end 