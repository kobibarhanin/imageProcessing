function [newImg] = multiImageFocus(img1,img2,levels)
%MULTIIMAGEFOCUS Summary of this function goes here
%   Detailed explanation goes here

% Builds a Laplacian pyramid for img1 and img2

lPyr1 = laplacPyr(img1,levels);
lPyr2 = laplacPyr(img2,levels);

% For each entry in the newPyramid level, the chosen value will be from 
% the pyramid whose entry represents a "sharper (more focused) pixel. 
% Thus for all pyramid levels except the last, the maximum value is always chosen

newPyr = cell(levels,1);
for i = 1:levels-1
    newPyr{i} = max(lPyr1{i},lPyr2{i});
end

% For the last level of the pyramid (the low pass level) the pixel 
% chosen is that which is in a "sharper" region

low_pass1 = lPyr1{levels};
low_pass2 = lPyr2{levels};

local1 = localImageContrast(low_pass1, 3);
local2 = localImageContrast(low_pass2, 3);

local1sharper = local1 > local2;
local2sharper = ~local1sharper;

res = zeros(size(low_pass1,1),size(low_pass1,2));
res(local1sharper) = low_pass1(local1sharper);
res(local2sharper) = low_pass2(local2sharper);
newPyr{levels} = res;

% newPyr{levels} = res + low_pass1(local1sharper) + low_pass2(local2sharper);

newImg = collapseLapPyr(newPyr);
end

