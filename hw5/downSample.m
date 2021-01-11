function [DS] = downSample(I)
%DOWNSAMPLE Summary of this function goes here
%   Detailed explanation goes here

% gaussian coefficiants
g = [0.05 0.25 0.4 0.25 0.05];

% construct the filter
low_pass_filter = g' * g;

% convolve
blurredIm = uint8(conv2(I, low_pass_filter,'same'));

% generate sample map (1 in 4)
sample = sampleMap(size(I,1),size(I,2));

% apply sampling 
DS=blurredIm(sample);
DS=reshape(DS,round(size(I,1)/2),round(size(I,2)/2));

end

