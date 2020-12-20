function [rval] = gaussianFunc2d(x, y, sigma, center)
%GAUSSIANFUNC2D Summary of this function goes here
%   Detailed explanation goes here

xc = center(1);
yc = center(2);

exponent = ((x-xc).^2 + (y-yc).^2)./(2*sigma);
rval = (exp(-exponent));

end

