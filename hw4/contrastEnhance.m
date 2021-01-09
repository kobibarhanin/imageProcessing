function [nim,a,b] = contrastEnhance(im,range)
%CONTRASTENHANCE This function maps an image to new range of grayvalues. It can be used to enhance contrast.

    newRange = double(range(2) - range (1));
    
    imgMin = double(min(im(:)));
    imgMax = double(max(im(:)));
    
    a = newRange / (imgMax - imgMin);
    b = -1 * (newRange * imgMin) / (imgMax - imgMin);
    
    [dimA,dimB] = size(im);    
     nim = uint8(reshape(a .* uint16(im(:)) + b, [dimA,dimB]));

end

    