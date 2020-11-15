function [imgNbit,Qvals] = optimalQuantization(img8bit,N)

img8bit = img8bit + 1;
h = histImage(img8bit);    
bestZ = [];
bestQ = [];
Zlen = power(2,N)-1;

best_error = inf;
error = 0;

% loop over optimization process - take best Z&Q vector set - this is 
% to ensure no local minimum is selected
for i = 1:5
    
    if i > 1 && error < best_error
        best_error = error;
        bestZ = Zs;
        bestQ = Qs;
    end

    % initialize Q ans Z vectors -
    %   Z values are random values from (0,256) added by {0,256}
    %   Q are avarage values to Z's - mid distance.
    Zs = [];
    Qs = [];    
    Zs(end+1) = 0;
    Zs = [Zs ,floor(256.*rand(Zlen,1))'];
    Zs(end+1) = 256;
    Zs = sort(Zs);
    Qs = mean([Zs(1:end-1);Zs(2:end)]);

    % MAIN LOOP:
    % set exit condition variables:
    %   this loop will exit after 1oo iterations or after 3 iterations with the
    %   same error value. minimum 3 iterations.
    ctr = 1;
    error = 0;
    errors = [inf inf inf];
    errors_avg = mean(errors);

    while ctr < 100

        % check for exit condition
        if errors_avg <= error || isequal(repmat([error],3,1)', errors(end-2:end))
            break
        end


        % calculate q values = mass of center between Z's:
        Zs1 = Zs(1:end-1);
        Zs2 = Zs(2:end);
        for i = 1:length(Zs)-1

             sector = h([Zs1(i)+1:Zs2(i)]);

             interval = [1:length(sector)];

             if sum(sector) == 0
                Qs(i) = Zs1(i);
             else
                Qs(i) = floor(sum(interval.*sector)/sum(sector)) + Zs1(i);

             end
        end


        % calculate z values = avarage over adjacent Q's:
        for i = 2:length(Zs)-2
             Zs(i) = floor((Qs(i-1) + Qs(i))/2);
        end


        % calculate error:
        error = 0;
        for i = 1:length(Zs)-1
            sector = h([Zs1(i)+1:Zs2(i)]);
            interval = [1:length(sector)];
            error = error + floor(sum(power(interval + Zs1(i) - Qs(i), 2) .* sector));
        end
        errors(ctr) = error;
        errors_avg = mean(errors);

        ctr = ctr + 1;
    end

end

% assign best Z values
Zs = bestZ;
Qs = bestQ;

% build image mapping:
%   this will create a mapping vector with the size of the image using the 
%   calculated Zbins in order to map the image values to quantized values.
map = [];
for i = 1:length(Zs)-1
    vec = ones(1, Zs(i+1) - Zs(i)) * i;
    map = [map, vec];
end

imgNbit = uint8(map(img8bit));
Qvals = uint8(Qs);
end

