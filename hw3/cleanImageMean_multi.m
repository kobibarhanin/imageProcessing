function [cleanIm] = cleanImageMean_multi(imArray)
%CLEANIMAGEMEDIAN_ Cleans an image from a noised image set with
% mean.

cleanIm = uint8(mean(imArray,3));

end

