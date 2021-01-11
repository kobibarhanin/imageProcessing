function [newImage] = addFrameToImage(baseImage, frame)
%ADDFRAMETOIMAGE concatenates a frame as 3rd dimension to a 2d image

newImage = cat(3, baseImage, frame);

end

