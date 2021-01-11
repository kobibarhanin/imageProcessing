function [T] = findProjectiveTransform(pointsSet1, pointsSet2)
%FINDPROJECTIVETRANSFORM calculates the projective trasformation between pointsSet1
% and pointsSet2

% generate X' vector:
X_t = pointsSet2(:);

% generate X matrix
X_source = pointsSet1(:);
X = [];
for i = 1:2:length(X_source)
    t = [X_source(i), X_source(i+1), 0, 0, 1, 0, -X_source(i) * X_t(i), -X_source(i+1) * X_t(i)];
    k = [0, 0, X_source(i), X_source(i+1), 0, 1, -X_source(i) * X_t(i+1), -X_source(i+1) * X_t(i+1)];
    X = [X t k];
end
X = reshape(X, 8, i+1)';

% calculate T values: 
A = pinv(X) * X_t;

% constract A:
%  -----------
% a b e
% c d f
% g h 1
%  -----------

T = [A(1) A(2) A(5); 
     A(3) A(4) A(6); 
     A(7) A(8)   1];

end


