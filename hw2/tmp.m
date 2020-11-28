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

% generate X matrix
X_source = point_set_rev(:);
% X_source = point_set_reg(:);
X = [];
for i = 1:2:length(X_source)
    t = [X_source(i), X_source(i+1), 0, 0, 1, 0];
    k = [0, 0, X_source(i), X_source(i+1), 0, 1];
    X = [X t k];
end
X = reshape(X, 6, 6)';

% generate X' matrix - the regular point_set:
X_t = point_set_reg(:);
% X_t = point_set_rev(:);

% calculate A values: 
A = pinv(X) * X_t;

% constract A:
%  -----------
% a b e
% c d f
% 0 0 1
%  -----------

% A = [A' 0 0 1];
A = [A(1) A(2) A(5) A(3) A(4) A(6) 0 0 1];
A = reshape(A,3,3)';

% generate original from revised:
% A*[x_rev(1) y_rev(1) 1]'
% floor(A*[[x_rev(1) y_rev(1) 1]' [x_rev(2) y_rev(2) 1]'])

% get a standard cordinates vector
% 1 1, 1 2, 1 3, .. N N
M = [];
for i = 1:256 
    M = [M; [1:256; ones(256,1)'*i]];
end


% add ones row [V ones(256,1)]
% this will be your X
X_s = [reshape(M,2,256*256); ones(256*256,1)'];

% calc X' by multyplying with A
% floor/round cordinates (NN)
X_t = abs(round(A*X_s));
X_t(3,:) = [];
X_s(3,:) = [];

% get actual pixel values mapping
res = ones(256,256);
for i = 1:length(X_t)
    
    t = X_s(:,i);
    k = X_t(:,i)';
    
%      FIX THIS SHIT!
    if k(1) > 256 || k(1) == 0 || k(2) == 0 || k(2) > 256
        continue
    end
    
    res(t(1),t(2)) = img_reg(k(1),k(2));
    
end

% display
imshow(uint8(res))


% ===================================================


% disp([x y]);
% meshgrid(x,y);
% inpolygon([50],[50],x,y);
% inpolygon([1],[1],x,y);



