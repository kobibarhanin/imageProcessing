function [x,y] = getPolygon(color)
%GETPOLYGON Summary of this function goes here
%   Detailed explanation goes here

% imshow(img)
hold on
[x, y] = ginput(4);

x = uint8(x);
y = uint8(y);
xp = x;
yp = y;
xp(end+1)=xp(1);
yp(end+1)=yp(1);
hold on
plot(xp,yp, "-", 'LineWidth',3, 'Color', color)
hold on

end

