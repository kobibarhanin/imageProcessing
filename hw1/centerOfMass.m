function [centerOfMassIndex] = centerOfMass(vector)
%CENTEROFMASS Auxiliary function to calculate a vector center of mass.

interval = [1:length(vector)];
centerOfMassIndex = floor(sum(interval.*vector)/sum(vector));

end

