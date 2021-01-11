function windmill = cleanWindmill()
%cleanWindmill this function clean windmill Image

wind=readImage('windmill');
putImage(wind);
disp('Original image >>');
pause

[WM,WMshow]=getFFT2(wind);
putImage(WMshow);
imagesc(WMshow);
colormap('gray');
disp 'The Frequency image'
disp 'You can see the two tiny white dots near the center >>'
pause

WM=setMeanToPixel(WM,125,101);
WM(133,157)=WM(125,101);
WMshow=setMeanToPixel(WMshow,125,101);
WMshow(133,157)=WMshow(125,101);
putImage(WMshow);
imagesc(WMshow);
colormap('gray');
disp 'The dots cleared >>'
pause
WM=ifftshift(WM);
windmill=round(rescale(real(ifft2(WM))).*255);
end

function im = setMeanToPixel(im,a,b)
im(a,b)=mean([im(a-1,b-1),im(a-1,b),im(a-1,b+1),im(a,b-1),im(a,b+1),im(a+1,b-1),im(a+1,b),im(a+1,b+1)]);
end
