function cleanUmbrella = cleanUmbrella()
%cleanUmbrella clean the umbrella image

umbrella=readImage('umbrella');
putImage(umbrella);
disp('Original image >>');
disp('We can clearly see the shift to left of the umbrella and chairs.');
pause

% We will convolve with shift mask
% for convenience we will move to frequency domain
umbFFT=fft2(umbrella);

% construct the shift mask - we calculated the shift to be 1->80, and 1->5
mask = zeros(5,80);
mask(1,1) = 0.5;
mask(5,80) = 0.5;
fft_mask=fft2(mask,256,256);

% convolve in frequency domain
fft_clean=(abs(fft_mask)>0.00001).*umbFFT./fft_mask;
fft_clean(isnan(fft_clean))=0;

% back to image domain
cleanUmbrella=uint8(ifft2(fft_clean));

end

