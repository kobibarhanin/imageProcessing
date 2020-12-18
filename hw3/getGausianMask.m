function [gmask] = getGausianMask(maskRadius, maskSTD)
%GETGAUSIANMASK Summary of this function goes here
%   Detailed explanation goes here

gmask = fspecial('gaussian',maskRadius*2+1,maskSTD);

end

