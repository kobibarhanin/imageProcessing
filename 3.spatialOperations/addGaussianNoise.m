function [noisyIm] = addGaussianNoise(im,s)
%ADDGAUSSIANNOISE Adds gaussian noise to the image.

randg_mat = s * randn(size(im)) + 1;
noisyIm = uint8(double(im) .* randg_mat);

end

