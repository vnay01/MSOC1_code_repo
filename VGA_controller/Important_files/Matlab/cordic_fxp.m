function [ SumAngle Hypo ] = cordic_fxp( x, y, Nloop )
% Number of values in lookup table
%x = 200;
%y = 100;
%Nloop = 8;

Nlookup = 40;
p = 24;
q = 12;

F = fimath;
F.MaxProductWordLength = p;
F.MaxSumWordLength = q;
F.ProductMode = 'SpecifyPrecision';
F.ProductWordLength = p;
F.ProductFractionLength = q;
F.SumMode = 'SpecifyPrecision';
F.SumWordLength = p;
F.SumFractionLength = q;

% Initialize lookup table
AngTable = fi(zeros(1,20),0,p,q,F);
for ii = 1 : Nlookup
    AngTable(ii) = atand(2^(-(ii-1)));
end

% Accumulate the angle
SumAngle = fi(0,0,p,q,F);
xnew = fi(0,1,p,q,F);
ynew = fi(0,1,p,q,F);
x = fi(x,1,p,q,F);
y = fi(y,1,p,q,F);
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
Hypo = x * fi(0.6072,0,p,q,F);
%SumAngle
end
