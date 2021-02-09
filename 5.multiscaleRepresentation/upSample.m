function [US] = upSample(I)
%upSample up samples the image by optimal interpolation

f = fftshift(fft2(I));

% pad in freq domain
xPad=size(I,1)/2;
yPad=size(I,2)/2;
pf = padarray(f,[xPad,yPad],'both');
pf=ifft2(ifftshift(pf));

% remove any remaining complex values
pfi = abs(pf);

% return image to initial avarage
US = 4*pfi;

end

