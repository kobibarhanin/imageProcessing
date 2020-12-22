function [gmask] = getGausianMask(maskRadius, maskSTD)
%GETGAUSIANMASK Calculates the gaussian mask in a given radius and std.

rows = maskRadius(1)*2+1;
cols = maskRadius(2)*2+1;
center = [ceil(rows/2),ceil(cols/2)];

[R,C] = ndgrid(1:rows, 1:cols);
gmask = gaussianFunc2d(R,C, maskSTD, center);
gmask = 1/(sum(sum(gmask)))  .* gmask;

end