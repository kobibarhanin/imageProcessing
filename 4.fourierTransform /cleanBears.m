function cleanBearsImage = cleanBears()
%cleanBears clean the bears image using scaling

bears=readImage('bears');
putImage(bears);
disp('Original image >>');
pause

% normalize to minimal value
cleanBearsImage=bears-min(bears(:));

% calculate current contrast
contarst = max(bears(:)) - min(bears(:));

% apply new contrast to image
cleanBearsImage=round(cleanBearsImage.*(255/contarst));

end

