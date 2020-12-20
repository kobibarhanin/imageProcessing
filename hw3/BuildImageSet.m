function [imageSet] = BuildImageSet(im, setSize, noiseType, noiseFactor)
%BUILDIMAGESET Summary of this function goes here
%   Detailed explanation goes here

imageSet=im;

for i=1:setSize
    if noiseType == 1
        frame = addSPnoise(im, noiseFactor);
    elseif noiseType == 2
        frame = addGaussianNoise(im, noiseFactor);
    end
    
    imageSet = addFrameToImage(imageSet, frame);

end

