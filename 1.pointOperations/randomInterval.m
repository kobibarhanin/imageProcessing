function [vector] = randomInterval(len, minDist)
%RANDOMINTERVAL Summary of this function goes here
%   Detailed explanation goes here

condition = true;

while condition
    candidate = floor(256.*rand(len,1))';
    for i = 1:length(candidate)-1
        if candidate(i+1)-candidate(i)<minDist
            condition = false;
            break;
        end
    end
    
vector = sort(candidate);
end

