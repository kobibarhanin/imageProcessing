im = imread('house.tif');
fftim = fft2(im);
ffs = fftshift(fftim);
ffl = uint8(log(abs(ffs)+1));



% show fourier transform image
putImage(ffl);
imagesc([-64,63],[-64,63],ffl);
pause