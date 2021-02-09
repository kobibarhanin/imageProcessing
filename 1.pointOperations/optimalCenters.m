function [Qs] = optimalCenters(vector, start, half, fin, depth ,N)
%OPTIMALCENTERS This function calculates recursively the centers of mass of 
% a vector's intervals. The amount of intervals is defined by the N param
% which is the max depth for the recursion.

    Qs = [];

    if depth == N
        return
    end

    % calculate the center of masses for each half a given vector, add the
    % result to the returned array.
    half_l = centerOfMass(vector(start:half)) + start;
    half_r = centerOfMass(vector(half:end)) + half;
    Qs(end+1) = half_l;
    Qs(end+1) = half_r;
    
    % recursion step - calculate center of mass for both halves. accumulate
    % the results in the returned array.
    Qs = [Qs optimalCenters(vector, start, half_l, half, depth+1, N)];
    Qs = [Qs optimalCenters(vector, half, half_r, fin, depth+1, N)];
    
    
end

