function [imageSet] = BuildImageSet(im, setSize, noiseType, noiseFactor)
%BUILDIMAGESET Builds a layered image as a set of base image and noised
% layers.

imageSet=im;

for i=1:setSize
    if noiseType == 1
        frame = addSPnoise(im, noiseFactor);
    elseif noiseType == 2
        frame = addGaussianNoise(im, noiseFactor);
    end
    
    imageSet = addFrameToImage(imageSet, frame);

end

