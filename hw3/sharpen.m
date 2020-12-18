function [sharpIm] = sharpen(im, maskRadius, maskSTD, lambda)
%SHARPEN Summary of this function goes here
%   Detailed explanation goes here


gmask = getGausianMask(maskRadius, maskSTD);

% generate the S(lambda) mask
delta = zeros(maskRadius*2+1);
delta(end/2 + 1/2) = 1;
S_lambda = delta + lambda*(delta-gmask);

sharpIm = uint8(conv2(im, S_lambda));

end

