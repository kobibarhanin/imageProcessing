function [rval] = gaussianFunc2d(x, y, sigma, mask_center)
%GAUSSIANFUNC2D Calculates the gaussian value of a cordiante with respect
% to another cordinate (mask_center)

exponent = ((x-mask_center(1)).^2 + (y-mask_center(2)).^2)./(2*sigma);
rval = (exp(-exponent));

end

