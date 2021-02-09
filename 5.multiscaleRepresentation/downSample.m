function [DS] = downSample(I)
%DOWNSAMPLE downsamples an image by gaussian bluring and
% removing ever other pixel

% gaussian coefficiants
g = [0.05 0.25 0.4 0.25 0.05];

% construct the filter
low_pass_filter = g' * g;

% convolve
blurredIm = conv2(I, low_pass_filter,'same');
 
% reduct pixels
DS = blurredIm(1:2:end,1:2:end); 
DS = reshape(DS,size(I,1)/2,size(I,2)/2);

end

