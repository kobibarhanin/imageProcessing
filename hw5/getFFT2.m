function [F,showableF] = getFFT2(im)
%getFFT2 Return the Fourier Transform of the image after log and shift
%   input: im=image;
%   output:F=Fourier Transform of im
%           showableF=log F to avilalbe show
F=fft2(im);
showableF=log(1+abs(F));
showableF=uint8(fftshift(showableF));
F=fftshift(F);
end

