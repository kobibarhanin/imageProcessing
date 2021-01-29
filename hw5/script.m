% ===================================
% Submitters
% ===================================
% - name: Kobi Bar-Hanin
%   id: 201581659
% - name: Tzvi Knol
%   id: 206073934

% ===================================
% Example
% ===================================

% im1 = 'butterfly_wings1.tif';
% im2 = 'butterfly_wings12.tif';

% im1 = 'BootsB.tif';
% im2 = 'BootsF.tif';

im1 = 'mateshaked_1s.tif';
im2 = 'mateshaked_2s.tif';

img1 = readImage(im1);
img2 = readImage(im2);

putImage(img1);
title(im1)

putImage(img2);
title(im2)

levels = 3;
rImg = multiImageFocus(img1,img2,levels);
putImage(rImg)
title('multi focused image')

disp 'Hi, we can see 3 images, one of the little girl blurred,'
disp 'one of the big dog blurred, and a multi image focus of the two.'
disp 'Note - streach the images recieved for a better view.'
pause

close all
clear


