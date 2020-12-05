% ========================================================
% READ IMAGE:
% img = imread('stroller.tif');
% img = imread('lighthouse.tif');
img = imread('stroller.tif');
% img2 = imread('stroller_rev.tif');
% img2 = img2(:,:,1);

% img = imread('lena.tif');
% img2 = imread('lena_rev.tif');


% ========================================================
% GET USER INPUT QUADS:
% [pointsSet_grab, pointsSet_0, pointsSet_1] = getUserInputs(img);

% ========================================================
% GET POINTSETS DYNAMICALLY
% [x_src, y_src] = getPointSet(4, img);
% [x_dst, y_dst] = getPointSet(4, img);
% point_set_src=double([x_src'; y_src']);
% point_set_dst=double([x_dst'; y_dst']);
% ========================================================
% % LENA
% img = imread('lena.tif');
% point_set_src=[    119   182   184   100
%    118   118   193   194];
% point_set_dst=[    10    60    67    10
%      8     8    61    72];
% ========================================================
% % STROLLER
% img = imread('stroller.tif');
% point_set_src=[   105   215   219   109   105;
%     22    18   130   136  22];
% point_set_dst=[   186   236   242   181   186;
%    192   190   247   245   192];
% ========================================================
% LIGHTHOUSE
img = imread('lighthouse.tif');
point_set_src=[   8    50    58     8  8;
    21    19    76    78 21];
point_set_dst=[      189   219   225   188 189;
    39    40    83    98 39];
% ========================================================


% res = mapQuad2(img, point_set_src, point_set_dst,1);
% imshow(uint8(res));
% hold on 
% plot(point_set_src(1,:),point_set_src(2,:), "-", 'LineWidth',3, 'Color', 'red')
% plot(point_set_dst(1,:),point_set_dst(2,:), "-", 'LineWidth',3, 'Color', 'blue')

% ========================================================
createMagicMovie(img);
