function [G] = gaussPyr(img,levels)
%GAUSSPYR Summary of this function goes here
%   Detailed explanation goes here

G = cell(levels,1);
G{1} = img;

for i = 2:levels
    G{i} = downSample(G{i-1});
end

end

