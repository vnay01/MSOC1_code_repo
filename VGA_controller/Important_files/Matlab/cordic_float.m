function [ SumAngle, Hypo ] = cordic_float( x, y, Nloop )
% Number of values in lookup table
Nlookup = 40;
% Initialize lookup table
AngTable = zeros(1,20);
for ii = 1 : Nlookup
    AngTable(ii) = atand(2^(-(ii-1)));
end

% Accumulate the angle
SumAngle = 0;
% Number of loops
if Nloop < 8
    Nloop = 8;
end
for ii = 1 : Nloop
    if y >= 0
       xnew = x + (y / 2^(ii-1));
       ynew = y - (x / 2^(ii-1));
       SumAngle = SumAngle + AngTable(ii);
    end
    if y < 0
       xnew = x - (y / 2^(ii-1));
       ynew = y + (x / 2^(ii-1));
       SumAngle = SumAngle - AngTable(ii); 
    end
    x = xnew;
    y = ynew;
end

% Scale by Gain
Hypo = x * 0.6072;
end
