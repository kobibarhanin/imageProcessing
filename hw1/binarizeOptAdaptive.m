function [bimg] = binarizeOptAdaptive(im, winsize)
%BINARIZEOPTADAPTIVE This function utilized sliding window technique and
% calculates the optimal binazation per window to filter locality
% considerations.

% allocate the output image
bimg = im;

% determine the symetric window sizw
winInterval = floor(winsize/2);

for rowImg = 1 : size(im,1)
    for colImg = 1 : size(im,2)

        values = [];
        rowB = 1;
        for rowWin = -winInterval : winInterval
            row = rowImg + rowWin;
            colB = 1;
            for colWin = -winInterval : winInterval
                col = colImg + colWin;
                % attempt to get valid sliding window value
                % if succeeds - append value to values vector 
                try
                    values(end+1) = im(row,col);
                catch
                end
                colB = colB + 1;
            end
            rowB = rowB + 1;
        end
        % get optimal binarize value for values vector
        [~, T] = binarizeOpt(values);

        % assign correct value to output matrix 
        bimg(rowImg, colImg) = (im(rowImg, colImg) > T) * 255;

    end
end
    
end

