function h =  histImage(img)
%HISTIMAGE This function returns the histogram for the image.

h = sum(img(:) == (1:256));

end
