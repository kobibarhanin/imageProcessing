function cleanWatermelon = cleanWatermelon()
%cleanWatermelon clean Watermelon using the sharp method
wtrmln=readImage('watermelon');
putImage(wtrmln);
disp('Original image >>');
pause

cleanWatermelon=sharpen(wtrmln,[1,1],2,16);

end

