function [G] = gaussPyr(img,levels)
%GAUSSPYR Summary of this function goes here
%   Detailed explanation goes here

G = cell(levels,1);
dsIm = img;
for i = 1:levels
    dsIm = downSample(dsIm);
    G{i} = dsIm;
end

end

