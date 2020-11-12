function [imgNbit,Qvals] = optimalQuantization(img8bit,N)

img8bit = img8bit + 1;

% CALCULATE PROPERTIES:
h = histImage(img8bit);
% h = imhist(img8bit);

bin_size = 256/power(2,N);


% INITIALIZE QUANTIFIERS:
% Zs = [0 : bin_size : 256];
% Qs = mean([Zs(1:end-1);Zs(2:end)]);

Zlen = power(2,N)-1;
best_error = inf;
bestZ = [];
bestQ = [];
error = 0;
    Zs = [];
    Qs = [];
for i = 1:10
    
%     error

    if i > 1 && error < best_error
        best_error = error;
        bestZ = Zs;
        bestQ = Qs;
    end
    
    Zs = [];
    Qs = [];
    Zs(end+1) = 0;
    Zs = [Zs ,floor(256.*rand(Zlen,1))'] ;
    Zs(end+1) = 256;
    Zs = sort(Zs);
    Qs = mean([Zs(1:end-1);Zs(2:end)]);

    

ctr = 1;
error = 0;
errors = [inf inf inf];
errors_avg = mean(errors);

while ctr < 100

    % CHECK FOR EXIT CONDITION
    if errors_avg <= error || isequal(repmat([error],3,1)', errors(end-2:end))
        break
    end

    
    % CALCULATE Q VALUES = MASS OF CENTER BETWEEN Z's:
    Zs1 = Zs(1:end-1);
    Zs2 = Zs(2:end);
    for i = 1:length(Zs)-1
         
         sector = h([Zs1(i)+1:Zs2(i)]);
         
         interval = [1:length(sector)];
         
         if sum(sector) == 0
%             Qs(i) = (Zs1(i)+Zs2(i))/2;
            Qs(i) = Zs1(i);
         else
%              TODO - maybe change the way this works???
            Qs(i) = floor(sum(interval.*sector)/sum(sector)) + Zs1(i);
            
         end
    end
    
    
    % CALCULATE Z VALUES = AVARAGE OVER ADJUSENT Q's:
    for i = 2:length(Zs)-2
         Zs(i) = floor((Qs(i-1) + Qs(i))/2);
    end
    
    
    % CALCULATE ERROR:
    error = 0;
    for i = 1:length(Zs)-1

        sector = h([Zs1(i)+1:Zs2(i)]);
        interval = [1:length(sector)];
        error = error + floor(sum(power(interval + Zs1(i) - Qs(i), 2) .* sector));
        
    end
    
    errors(ctr) = error;
    errors_avg = mean(errors);

%     bar(h)
%     for i = 1:length(Qs)
%          xline(Qs(i))
%     end

    ctr = ctr + 1;
end


end

Zs = bestZ;
Qs = bestQ;

% best_error

%     bar(h)
%     for i = 1:length(Qs)
%          xline(Qs(i))
%     end

% TODO - maybe loyd-max is ok and the problem is here: ...

% BUILD IMAGE MAPPING:
map = [];
for i = 1:length(Zs)-1
    vec = ones(1, Zs(i+1) - Zs(i)) * i;
    map = [map, vec];
end

imgNbit = uint8(map(img8bit));
Qvals = uint8(Qs);
end

