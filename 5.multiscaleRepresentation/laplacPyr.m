function [L] = laplacPyr(img,levels)
%laplacPyr construct the image's laplace pyramid 
% from the gaussian pyramid

gPyr = gaussPyr(img,levels);

L = cell(levels,1);
L{levels} = gPyr{levels};

for i = levels:-1:2
    L{i-1} = gPyr{i-1} - upSample(gPyr{i});
end

end

