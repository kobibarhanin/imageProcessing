function [cleanIm] = cleanImageMedian(im, maskRadius)
%CLEANIMAGEMEDIAN Summary of this function goes here
%   Detailed explanation goes here

% TODO - mask radius should be 2 values vec (x,y)
cleanIm = im;

for row=1+maskRadius:size(im,1)-maskRadius
    for col=1+maskRadius:size(im,2)-maskRadius        
        cleanIm(row,col) = median(im(row-maskRadius:row+maskRadius,col-maskRadius:col+maskRadius),'all');        
    end
end

end

