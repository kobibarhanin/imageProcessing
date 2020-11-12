% =========================================================================

disp("a. Let's compare uniform to optimal quantization:")

% READ IMAGE:
img = imread('lighthouse.tif');

% QUZNTIZATION PARAMETER:
N = 4;

% % UNIFORM QUANTIZATION:
[img_uq, qvals_uq] = uniformQuantization(img, N);
uq_img = qvals_uq(img_uq);
putImage(uq_img);
disp("This image uses uniform quantization with N=4")
disp("(press enter to continue)")
pause

% OPTIMAL QUANTIZATION:
[img_oq, qvals_oq] = optimalQuantization(img, N);
oq_img = qvals_oq(img_oq);
putImage(oq_img);
disp("This image uses optimal quantization with N=4")
disp("Note the contou errors in the lighthouse")
disp("(press enter to continue)")
pause

close all

% =========================================================================

disp("b. Let's compare simple to optimal binarization:")

% READ IMAGE:
img = imread('barbarasmall.tif');

% SIMPLE BINERIZATION:
[bimg] = binarize(img, 128);
putImage(bimg);
disp("This image uses simple binarization with T=128")
disp("(press enter to continue)")
pause

% OPTIMAL BINERIZATION:
[bimg, T] = binarizeOpt(img);
putImage(bimg);
disp("This image uses optimal binarization with T = " + T)
disp("(press enter to continue)")
pause
close all

% =========================================================================

disp("c. Let's compare optimal to adaptive optimal binarization:")

% READ IMAGE:
img = imread('cups.tif');

% OPTIMAL BINERIZATION:
[bimg, T] = binarizeOpt(img);
putImage(bimg);
disp("This image uses optimal binarization with T = " + T)
disp("(press enter to continue)")
pause


% OPTIMAL ADAPTIVE BINERIZATION:
winsize = 7;
[bimg] = binarizeOptAdaptive(img, winsize);
putImage(bimg);
disp("This image uses adaptive optimal binarization with window size = " + winsize)
disp("(press enter to continue)")
pause
close all

% =========================================================================


% % READ IMAGE:
% img = imread('lighthouse.tif');
% 
%  
% % QUZNTIZATION PARAMETER:
% N = 1;
% 
% 
% % UNIFORM QUANTIZATION:
% [img_uq, qvals_uq] = uniformQuantization(img, N);
% uq_img = qvals_uq(img_uq);
% imshow(uq_img);
% pause
% 
% 
% % OPTIMAL QUANTIZATION:
% [img_oq, qvals_oq] = optimalQuantization(img, N);
% oq_img = qvals_oq(img_oq);
% imshow(oq_img);
% pause
% 
% 
% % SIMPLE BINERIZATION:
% [bimg] = binarize(img, 120);
% imshow(bimg);
% pause
% 
% 
% % OPTIMAL BINERIZATION:
% [bimg, T] = binarizeOpt(img);
% disp("T = " + T)
% imshow(bimg);
% pause


% OPTIMAL ADAPTIVE BINERIZATION:
% [bimg] = binarizeOptAdaptive(img, 3);
% imshow(bimg);
