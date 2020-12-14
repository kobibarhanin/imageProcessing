function [noisyIm] = addGaussianNoise(im,s)
%ADDGAUSSIANNOISE Summary of this function goes here
%   Detailed explanation goes here

randg_mat = s * randn(size(im))+1;
noisyIm = uint8(double(im) .* randg_mat);

end

