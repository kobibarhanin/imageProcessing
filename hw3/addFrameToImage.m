function [newImage] = addFrameToImage(baseImage, frame)
%ADDFRAMETOIMAGE Summary of this function goes here
%   Detailed explanation goes here
newImage = cat(3, baseImage, frame);

end

