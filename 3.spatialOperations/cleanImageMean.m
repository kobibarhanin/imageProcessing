function [cleanIm] = cleanImageMean(im, maskRadius, maskSTD)
%CLEANIMAGEMEAN Cleans an image by averaging on a weighted mask with a gauss
% distribuition

gaus_mask = getGausianMask(maskRadius, maskSTD);

cleanIm = uint8(conv2(im, gaus_mask,'same'));

end

