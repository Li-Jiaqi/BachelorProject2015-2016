% For a given image I, compute its Gabor transform at 3 scales and 8 orientations.
%
% gout = GaborFeature(I, GaborFilter)
%
% I: Input image.
% GaborFilter: Input Gabor filter in complex form.
% gout: Gabor transform of input image at 3 scales and 8 orientations.

function gout = GaborFeature(I,GaborFilter)

 %I = imresize(I, [64, 64], 'bilinear');
%I =I.*ellipMask();

if isa(I, 'double') ~=1
    I = double(I);
end
scalenum = 5;
oriennum = 8;
gout=zeros(size(I, 1), size(I, 2) , scalenum*oriennum);
HEIGHT=108;
WIDTH=120;

width=(GaborFilter{3}-1)/2;

%I = [fliplr(flipud(I(1:width,1:width))) flipud(I(1:width,:)) fliplr(flipud(I(1:width,end-width+1:end)))
%    fliplr(I(:,1:width)) I fliplr(I(:,end-width+1:end))
%    fliplr(flipud(I(end-width+1:end,1:width))) flipud(I(end-width+1:end,:)) fliplr(flipud(I(end-width+1:end,end-width+1:end)))];

%imshow(uint8(I));

fI = fft2(I, HEIGHT+GaborFilter{3}-1, WIDTH+GaborFilter{3}-1);
temp1 = zeros(size(I, 1), size(I, 2));
temp2= zeros(size(I, 1), size(I, 2));
fEvenGaborFilter = GaborFilter{1};
fOddGaborFilter = GaborFilter{2};
% mag=zeros(17);

%figure
count = 0;
for scale=0:scalenum-1;%scale=0,1,2
    for orientation=0:oriennum-1 %orientation=0,1,2,3,4,5,6,7
        count = count+1;
        temp1=ifft2(fI .* fEvenGaborFilter(:, :, count));
        temp2=ifft2(fI .* fOddGaborFilter(:, :, count));
        gout(:, :, count) =sqrt(temp1(width+1:end-width,width+1:end-width).^2+temp2(width+1:end-width,width+1:end-width).^2);
        
        %subplot(scalenum, oriennum, count);
        %imshow((gout(:, :, count)-min(min(gout(:, :, count))))/(max(max(gout(:, :, count)))-min(min(gout(:, :, count)))));

        %           subplot(3,8,count);
        %          imshow(abs(fftshift(fft2(GaborFilter(:,:,count)))));
        %         mag = mag+abs(fftshift(fft2(GaborFilter(:,:,count))));


    end
end
% figure;imshow(mag);
% gout = abs(gout);

% tic;
% count = 0;
% for scale=0:scalenum-1;%scale=0,1,2
%     for orientation=0:oriennum-1 %orientation=0,1,2,3,4,5,6,7
%         count = count+1;
% %         Ie(:, :, count) = conv2(I, evenGaborFilter(:, :, count));
% %         Io(:, :, count) = conv2(I, oddGaborFilter(:, :, count));
%         Ie(:, :, count) =ifft2(fft2(I) .* fft2(evenGaborFilter(:, :, count), size(I, 1), size(I, 2)));
%         Io(:, :, count) =ifft2(fft2(I) .* fft2(oddGaborFilter(:, :, count), size(I, 1), size(I, 2)));
%         Ie(:, :, count) = sqrt(Ie(:, :, count).^2 + Io(:, :, count).^2);
%         figure(2);
%         subplot(scalenum, oriennum, count);imshow(Ie(:, :, count), [])
%         title('Magnitude');
%     end
% end
% t2 =toc

