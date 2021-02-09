function [newImg] = multiImageFocus(img1,img2,levels)
%MULTIIMAGEFOCUS construct the focused image by local mean contrast
% on laplacian pyramids

% Builds a Laplacian pyramid for img1 and img2

lPyr1 = laplacPyr(img1,levels);
lPyr2 = laplacPyr(img2,levels);

% For each entry in the newPyramid level, the chosen value will be from 
% the pyramid whose entry represents a "sharper (more focused) pixel. 
% Thus for all pyramid levels except the last, the maximum value is always chosen

newPyr = cell(levels,1);
for i = levels:-1:2
    newPyr{i} = max(lPyr1{i},lPyr2{i});
end

% For the last level of the pyramid (the low pass level) the pixel 
% chosen is that which is in a "sharper" region

low_pass1 = lPyr1{1};
low_pass2 = lPyr2{1};

local1 = localImageContrast(low_pass1, 5);
local2 = localImageContrast(low_pass2, 5);

local1sharper = local1 > local2;
local2sharper = ~local1sharper;

res = zeros(size(low_pass1,1),size(low_pass1,2));
res(local1sharper) = low_pass1(local1sharper);
res(local2sharper) = low_pass2(local2sharper);

newPyr{1} = res;

newImg = collapseLapPyr(newPyr);

end

