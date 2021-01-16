function [img] = collapseLapPyr(L)
%COLLAPSELAPPYR Summary of this function goes here
%   Detailed explanation goes here

levels = size(L,1);
img = L{levels};

for i = levels-1:-1:1
    img = upSample(img)+L{i};
end

end

