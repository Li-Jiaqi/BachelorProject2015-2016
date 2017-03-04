function GaborFilter = myGaborFilter(temnum)


HEIGHT=108;
WIDTH=120;

scalenum=5;
oriennum=8;

%widthString=num2str(2*temnum+1);

[X,Y] = meshgrid(-temnum:temnum);
frequency=sqrt(2);
sigma=2*pi;
xSigma=sigma;
ySigma=sigma;
kmax=pi/2;
postconstant=exp(-(xSigma*ySigma)/2);

width=2*temnum+1;
evenGaborFilter=zeros(width,width,scalenum*oriennum);
oddGaborFilter=zeros(width,width,scalenum*oriennum);
count=0;
for scale=0:scalenum-1;%scale=0,1,2
    for orientation=0:oriennum-1 %orientation=0,1,2,3,4,5,6,7      
        count=count+1;
        phi=(pi*orientation)/oriennum;
        kv=kmax/(frequency^(scale));
        preConstant_Kuv=kv^2;     
        expart=exp(-preConstant_Kuv*((X.^2)/(xSigma^2)+(Y.^2)/(ySigma^2))/2)*(preConstant_Kuv/(xSigma*ySigma));
        evenGaborFilter(:,:,count)=expart.*(cos(kv*(X*cos(phi)+Y*sin(phi))));
        evenGaborFilter(:,:,count)=evenGaborFilter(:,:,count)-mean2(evenGaborFilter(:,:,count));
        oddGaborFilter(:,:,count)=expart.*(sin(kv*(X*cos(phi)+Y*sin(phi))));    
        fEvenGaborFilter(:,:,count)=fft2(evenGaborFilter(:,:,count), HEIGHT+width-1, WIDTH+width-1);
        fOddGaborFilter(:,:,count)=fft2(oddGaborFilter(:,:,count), HEIGHT+width-1, WIDTH+width-1);
%         pMagnitude=sqrt(evenGaborFilter(:,:,count).*evenGaborFilter(:,:,count)+oddGaborFilter(:,:,count).*oddGaborFilter(:,:,count));
%         result1(:,:,count)=evenGaborFilter(:,:,count);
%         result2(:,:,count)=oddGaborFilter(:,:,count);
%         pPhase=atan2(oddGaborFilter(:,:,count),
%         evenGaborFilter(:,:,count));
    end
end

% GaborFilter =complex(evenGaborFilter,oddGaborFilter);
GaborFilter = {fEvenGaborFilter,fOddGaborFilter,width}; 

% save gabor result1 result2;
% file = ['C:\3DFaceDB\FRGC2.0(Original)\Gabor\Gabor',widthString,'.mat'];
% save(file,'GaborFilter');
% save gaborfilter evenGaborFilter oddGaborFilter;