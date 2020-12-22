function [cleanIm] = cleanImageMedian_multi(imArray)
%CLEANIMAGEMEDIAN_MULTI Cleans an image from a noised image set with
% median.

cleanIm = uint8(median(imArray,3));

end

