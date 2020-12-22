function [sharpIm] = sharpen(im, maskRadius, maskSTD, lambda)
%SHARPEN Sharpens the image using a gaussian blur version of the image.

gmask = getGausianMask(maskRadius, maskSTD);

% generate the S(lambda) mask
delta = zeros(maskRadius*2+1);
delta(end/2 + 1/2) = 1;
S_lambda = delta + lambda*(delta-gmask);

sharpIm = uint8(conv2(im, S_lambda));

end

