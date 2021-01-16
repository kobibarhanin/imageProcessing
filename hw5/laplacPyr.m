function [L] = laplacPyr(img,levels)
%laplacPyr Summary of this function goes here
%   Detailed explanation goes here

gPyr = gaussPyr(img,levels);

L = cell(levels,1);
L{levels} = gPyr{levels};

for i = levels:-1:2
    L{i-1} = gPyr{i-1} - upSample(gPyr{i});
end

end

