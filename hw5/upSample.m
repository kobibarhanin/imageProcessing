function [US] = upSample(I)
%upSample Summary of this function goes here
%   Detailed explanation goes here

[f, ~] = getFFT2(I);

xPad=size(I,1)/2;
yPad=size(I,2)/2;

pf = padarray(f,[xPad,yPad],'both');
pf=ifft2(ifftshift(pf));

pfi = abs(pf);
US = 4*pfi;

end

