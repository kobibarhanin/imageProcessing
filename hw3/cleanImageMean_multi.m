function [cleanIm] = cleanImageMean_multi(imArray)
%CLEANIMAGEMEDIAN_MULTI Summary of this function goes here
%   Detailed explanation goes here

% cleanIm = imArray(:,:,1);
cleanIm = uint8(mean(imArray,3));

end

