function [bimg] = binarize(img,T)
%BINARIZE Summary of this function goes here
%   Detailed explanation goes here

img(img>T) = 255;
img(img<=T) = 0;

bimg = img;

end

