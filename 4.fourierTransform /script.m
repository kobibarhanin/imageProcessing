disp '==============================='
disp 'Hi there,' ;
disp 'Images are cleaned and presented in an alphabetical order.';
disp 'Each function provides the original image and';
disp 'mid-process images in case those are needed,' ;
disp 'alongside explanations and conclusions.';
disp '==============================='
disp 'Press space to continue';
pause

disp '==============================='
disp 'baby.tif'
disp '---------'
disp 'Cleaning S&P noise with mapQuading to allign and multi-median:' ;
im = cleanBaby(0);
disp 'Cleaned >>';
putImage(im);
pause

disp '==============================='
disp 'Cleaning S&P noise with median mask:';
im = cleanBaby(1);
disp 'Cleaned >>';
putImage(im);
disp 'Press space to continue';
pause

disp '==============================='
disp 'Conclusion - median mask gives the better result.';
disp 'Press space to continue';
close all

disp '==============================='
disp 'bears.tif'
disp '---------'
disp 'Enhancing the image contrast:';
im = cleanBears();
disp 'Cleaned >>';
putImage(im);
disp '==============================='
disp 'Press space to continue';
pause
close all

disp '==============================='
disp 'cups.tif'
disp '---------'
disp 'Clean by fixing a patch at frequency domain:';
im=cleanCups();
disp 'Cleaned >>';
putImage(im);
disp '==============================='
disp 'Press space to continue';
pause
close all
  
disp '==============================='
disp 'house.tif'
disp '---------'
disp 'Clean in frequency domain:';
im=cleanHouse();
disp 'Cleaned >>';
putImage(im);
disp '==============================='
disp 'Press space to continue';
pause
close all

disp '==============================='
disp 'unbrella.tif'
disp '---------'
disp 'Clean with shift mask in frequency domain:';
im=cleanUmbrella();
disp 'Cleaned >>';
putImage(im);
disp '==============================='
disp 'Press space to continue';
pause
close all

disp '==============================='
disp 'USAflag.tif'
disp '---------'
disp 'The image been cleard with motion blur mask';
im=cleanUSflag();
disp 'Cleaned >>';
putImage(im);
disp '==============================='
disp 'Press space to continue' ;
pause
close all

disp '==============================='
disp 'watermelon.tif'
disp '---------'
disp 'The image has been sharpened';
im=cleanWatermelon();
disp 'Cleaned >>';
putImage(im);
disp '==============================='
disp 'Press space to continue';
pause
close all

disp '==============================='
disp 'windmill.tif'
disp '---------'
disp 'Clean in frequency domain:';
im=cleanWindmill();
disp 'Cleaned >>';
putImage(im);
disp '==============================='
disp 'Press space to continue';
pause
close all

disp 'The end';
clear
clc