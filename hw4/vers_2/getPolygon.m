function [x,y, p] = getPolygon(color)
%GETPOLYGON gets input for polygon from user

[x, y] = ginput(4);

x = uint8(x);
y = uint8(y);

xp = x;
yp = y;

xp(end+1)=xp(1);
yp(end+1)=yp(1);

p = plot(xp,yp, "-", 'LineWidth',3, 'Color', color);
hold on

end

