function    cleanIm = cleanImageMedian (im, maskRadius)
%cleanImageMedian Denoises image using median filtering.
%Input:      im - a grayscale image array in the range [0..255].
%                 maskRadius – a 1x2 vector [numRows,numCols]. Defines neighborhood size
%                 to be 2*maskRadius + 1. Thus neighborhood at x is(x-maskRadius) : (x+maskRadius). 
%Output:   cleanIm - grayscale image in the range [0..255] same size as im.
s=size(im);
x=maskRadius(1);
y=maskRadius(2);
cleanIm=im;
for i=x+1: s(1)-x
    for j=y+1:s(2)-y
        cleanIm(i,j)=median(median((im(i-x:i+x,j-y:j+y))));
    end
end
end

