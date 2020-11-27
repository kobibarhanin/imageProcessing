function [x, y] = getPointSet(amount,img)
%GETPOINTSET Summary of this function goes here
%   Detailed explanation goes here

imshow(img)
hold on

[x, y] = ginput(amount);
x = uint8(x);
y = uint8(y);
end

