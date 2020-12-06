
% ========================================================
% GET USER INPUT - lena
% ========================================================
img = imread('lena.tif');
movieFileName = 'lena.avi';

pointsSet_0=[16    51    57    20   16;
             223   211   238   240  223];
plot(pointsSet_0(1,:),pointsSet_0(2,:), "-", 'LineWidth',3, 'Color', 'y')

pointsSet_grab=[113   178   184    99   113;
                117   116   183   191   117];
plot(pointsSet_grab(1,:),pointsSet_grab(2,:), "-", 'LineWidth',3, 'Color', 'c')

pointsSet_1=[13   58   59   13  13;
             17   15   55   63   17];
plot(pointsSet_1(1,:),pointsSet_1(2,:), "-", 'LineWidth',3, 'Color', 'm')

% ========================================================
% GET USER INPUT - lighthouse
% ========================================================
% img = imread('lighthouse.tif');
% movieFileName = 'lighthouse.avi';
% pointsSet_0=[11    41    56    17   11;
%              223   204   228   245  223];
% plot(pointsSet_0(1,:),pointsSet_0(2,:), "-", 'LineWidth',3, 'Color', 'y')
% 
% pointsSet_grab=[6   64   78    9    6;
%                 21   20   78   75    21];
% plot(pointsSet_grab(1,:),pointsSet_grab(2,:), "-", 'LineWidth',3, 'Color', 'c')
% 
% pointsSet_1=[190   211   203   154  190;
%              57    61   114   100    57];
% plot(pointsSet_1(1,:),pointsSet_1(2,:), "-", 'LineWidth',3, 'Color', 'm')

numFrames = 10;
transformType = 1;
createMagicMovie (movieFileName, numFrames, img, transformType, pointsSet_grab, pointsSet_0, pointsSet_1)
% createMagicMovie (movieFileName, numFrames, img, transformType)


