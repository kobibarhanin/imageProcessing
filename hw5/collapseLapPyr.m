function [img] = collapseLapPyr(L)
%COLLAPSELAPPYR collapse th elaplace pyramid to 
% construct original image

levels = size(L,1);
img = L{levels};

for i = levels-1:-1:1
    img = upSample(img)+L{i};
end

end

