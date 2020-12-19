function [cleanIm] = cleanImageMean(im, maskRadius, maskSTD)
%CLEANIMAGEMEAN Summary of this function goes here
%   Detailed explanation goes here

% TODO - mask radius should be 2 values vec (x,y)
% TODO - byo gaus mask generator

% generate mask ...
gaus_mask = fspecial('gaussian',maskRadius*2+1,maskSTD);

% TODO - check this same issue
cleanIm = uint8(conv2(im, gaus_mask,'same'));

end

