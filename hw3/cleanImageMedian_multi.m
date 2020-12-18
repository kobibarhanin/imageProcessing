function [cleanIm] = cleanImageMedian_multi(imArray)
%CLEANIMAGEMEDIAN_MULTI Summary of this function goes here
%   Detailed explanation goes here

% cleanIm = imArray(:,:,1);
cleanIm = uint8(median(imArray,3));

end

