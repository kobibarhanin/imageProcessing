function [PSNRval] = calcPSNR (noisyIm,im)
%CALCPSNR Summary of this function goes here
%   Detailed explanation goes here

MSE = sum(sum((im-noisyIm).^2))/(size(im,1) * size(im,2));

PSNRval = 20 * log10(256) - 10 * log10(MSE);


end

