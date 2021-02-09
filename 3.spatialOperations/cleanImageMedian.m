function [cleanIm] = cleanImageMedian(im, maskRadius)
%CLEANIMAGEMEDIAN Cleans an image by taking the median value of the mask.

rows_mask = maskRadius(1);
cols_mask = maskRadius(2);

cleanIm = im;

for row=1+rows_mask:size(im,1)-rows_mask
    for col=1+cols_mask:size(im,2)-cols_mask      
        cleanIm(row,col) = median(im(row-rows_mask:row+rows_mask,col-cols_mask:col+cols_mask),'all');        
    end
end

end

