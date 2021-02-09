% ========================================================
% GET USER INPUT - lena
% ========================================================
% img = imread('lena.tif');
% movieFileName = 'lena.avi';
% pointsSet_grab=[113 178 184 99 113; 117 116 183 191 117];
% pointsSet_0=[16 51 57 20 16; 223 211 238 240 223];         
% pointsSet_1=[13 58 59 13 13; 17 15 55 63 17];
 
% ========================================================
% GET USER INPUT - lighthouse
% ========================================================
% img = imread('lighthouse.tif');
% movieFileName = 'lighthouse.avi';
% pointsSet_grab=[6 64 78 9 6; 21 20 78 75 21];
% pointsSet_0=[11 41 56 17 11; 223 204 228 245 223];
% pointsSet_1=[190 211 203 154 190; 57 61 114 100 57];

% ========================================================
% GET USER INPUT - einstein
% ========================================================
% img = imread('movieImage.tif');
% movieFileName = 'movieImage.avi';
% pointsSet_grab=[98 156 166 98 98; 55 54 149 156 55];
% pointsSet_0=[11 41 56 17 11; 223 204 228 245 223];
% pointsSet_1=[98 166 156 98 98; 156 149 54 55 156];


numFrames = 200;
transformType = 2;
% createMagicMovie (movieFileName, numFrames, img, transformType, pointsSet_grab, pointsSet_0, pointsSet_1)
movieFileName = 'myMovie.avi';
createMagicMovie (movieFileName, numFrames, img, transformType)


