% =========================================================================

% disp("Let's get user input for quads:")

% READ IMAGE:
% img = imread('lighthouse.tif');

% GET USER INPUT QUADS:
% [pointsSet_grab, pointsSet_0, pointsSet_1] = getUserInputs(img);

% GET POINTSETS
img_reg = imread('lena.tif');
img_rev = imread('lena_rev.tif');
% [x_reg, y_reg] = getPointSet(3, img_reg);
% [x_rev, y_rev] = getPointSet(3, img_rev);

x_reg = [164 153 82];
y_reg = [132 177 32];

x_rev = [134 176 32];
y_rev = [90 104 173];

point_set_reg = [x_reg; y_reg];
point_set_rev = [x_rev; y_rev];

% res = mapQuad(img_reg, point_set_reg, point_set_rev, 1);
% res = mapImage(img_reg, point_set_reg, point_set_rev, 1);
% imshow(uint8(res))

M = getCordinatesVector(256);

res = inpolygon(M(1,:),M(2,:),x_reg(:),y_reg(:));
res = reshape(res,256,256)*200;
imshow(res);

