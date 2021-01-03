
% Demos:
% 1. IP07_FourierTransformPart3_16_12_2020, 01:30:00
% 2. IP10_FreqProcessingPart1_28_12_2020, 00:37:50


% windmill 
% ===========

% load tampered image
% -----------
im = imread('windmill.tif');
disp("The original image ->")
imshow(im);
pause

% apply fixes
% -----------

% problematic furie coeffs at location:
% 125, 101
% 133, 157


% to furie
fftim = fft2(im);
ffs = fftshift(fftim);
ffl = uint8(log(abs(ffs)+1));
putImage(ffl);
imagesc([-64,63],[-64,63],ffl);
pause

ffs(125,101) = 0;
ffs(133,157) = 0;
iffs = ifft2(fftshift(ffs));
putImage(iffs);



% show fixed
% -----------

% explain
% -----------
