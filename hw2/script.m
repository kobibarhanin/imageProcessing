% =========================================================================

% disp("Let's get user input for quads:")

% READ IMAGE:
% img = imread('lighthouse.tif');

% GET USER INPUT QUADS:
% [pointsSet_grab, pointsSet_0, pointsSet_1] = getUserInputs(img);

% GET POINTSETS
img_reg = imread('lena.tif');
img_rev = imread('lena_rev.tif');
% [x_src, y_src] = getPointSet(4, img_reg);
% [x_dst, y_dst] = getPointSet(4, img_reg);
% point_set_src=double([x_src'; y_src']);
% point_set_dst=double([x_dst'; y_dst']);

x_src=[119 182 184 100];
y_src=[118 118 193 194];
x_dst=[10 60 67 10];
y_dst=[8 8 61 72];
point_set_src=[x_src; y_src];
point_set_dst=[x_dst; y_dst];

res = mapQuad(img_reg, point_set_src, point_set_dst, 1);

imshow(uint8(res));
hold on

% plot(point_set_src(1,:),point_set_src(2,:), "-", 'LineWidth',3, 'Color', 'red')
% plot(point_set_dst(1,:),point_set_dst(2,:), "-", 'LineWidth',3, 'Color', 'blue')

