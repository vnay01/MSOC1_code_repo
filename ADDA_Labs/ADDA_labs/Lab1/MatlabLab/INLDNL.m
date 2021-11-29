% INLDNL(filename, R, strobe)
%
% This is a program to evaluate an ADC output from a ramp input
% The ratio of the number of samples taken and the number of q-levels
% determines the resolution of the INL/DNL plots. The resolution is 
% qlevels/samples LSBs. Offest and gain correction are performed.
%
% filename :    the full path and name of your data file
% R :           the resolution of the ADC
% strobe :      the number of samples per quantization level
%
% EXAMPLE:
% a=INLDNL('samples.dat',8,10);
%
% Created by Martin Anderson, LTH, (c)2004, and Pietro Andreani, LTH, (c)2009
% For educational and private use only.
% Last edit by PAN 20091228


function output = INLDNL(filename, R, strobe);


data = load(filename);
Vin = data(:,2);

qlevels = 2^R;
samples = qlevels * strobe;

Vin=Vin(1:samples);

% We correct for a possible initial offset endpoint gain error
Vindata = round(((-Vin(1)+Vin)/(Vin(samples)-Vin(1)))*(qlevels-1));

% No correction, Vref= +-0.5V
%Vindata = round((0.5+Vin)*(qlevels-1));



% -- Calculate DNLs

k=0; 
for j = 0 : qlevels-1
    count=0;
    while ((k < samples) && Vindata(k+1)==j)
        k=k+1;
        count=count+1;
    end
    DNL(j+1) = (count-strobe)/strobe;
end

       
% Calculate the INL from the DNLs
INL(1:length(DNL))=0;
for k=1:length(DNL)
    for j=1:k
        INL(k)=INL(k)+DNL(j);
    end
end

% Do some plotting
ah = axes;

%th = title('INL / DNL with gain error');
%xh = xlabel('Normalized input level');
yh = ylabel('INL / DNL [LSBs]');

th = title('INL / DNL');
xh = xlabel('Code');
yh = ylabel('INL / DNL [LSBs]');

set(ah, 'FontSize', 16);
set(th, 'FontSize', 16);
set(xh, 'FontSize', 16);
set(yh, 'FontSize', 16);
axis([0.0,length(DNL),-2,2]);

hold on;
%grid;

x=0:length(DNL)-1;

hold on;
plot(x,DNL,'k-')
plot(x,INL,'b-')

output=1;