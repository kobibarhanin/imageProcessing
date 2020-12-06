function [V] = bilinearInterpolation(im, x, y)
%BILINEARINTERPOLATION returns the bilinear interpolated value of cordinate
%(x,y) in im

dx = x-floor(x);
dy = y-floor(y);
SE = im(ceil(x),ceil(y));
SW = im(ceil(x),floor(y));
NE = im(floor(x),ceil(y));
NW = im(floor(x),floor(y));
S = SE*dx + SW*(1-dx);
N = NE*dx + NW*(1-dx);
V = N*dy + S*(1-dy);

end

