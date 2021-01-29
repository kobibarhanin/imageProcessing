function [G] = gaussPyr(img,levels)
%GAUSSPYR builds the image's gaussian pyramid

G = cell(levels,1);
G{1} = img;

for i = 2:levels
    G{i} = downSample(G{i-1});
end

end

