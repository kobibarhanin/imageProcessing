function cleanCups = cleanCups()
%cleanCups clean the cups image

cups=readImage('cups');
putImage(cups);
disp('Original image >>');
pause

[cupFFT,cupShow]=getFFT2(cups);
putImage(cupShow);
imagesc(cupShow);
colormap('gray');

disp 'In the Frequency domain we can see a darkened square'
disp 'around the center, we should enhance the image in the darkened area.'
disp 'Press space to continue'
pause

disp 'Construct the darkened area with factor of 1.8 >>'
dark_area=ones(256,256);
% 1.8 was accomplished with trial and error
dark_area(109:149,109:149)=1.8;
putImage(dark_area);
imagesc(dark_area);
colormap('gray');
pause

cupFFT=cupFFT.*dark_area;
disp 'The fixed frequency domain >>'
cupFFTshow=log(1+abs(cupFFT));
putImage(cupFFTshow);
imagesc(cupFFTshow);
colormap('gray');
pause

cupFFT=ifftshift(cupFFT);
cleanCups=ifft2(cupFFT);
cleanCups=uint8(cleanCups);

end

