function output = MySolutions(varargin);
%
% ETI220 - Integrated A/D and D/A Converters
%
% Solutions for assignment 1
%
% Created by N/N 2008-11-??
% Last updated by N/N 2008-12-??
%
% Example: (to run exercise 1)
% >> Ass1_Solutions('x',1)
%

% Parameter default values

ex      = 1 ;         % Run first exercise by default
x       = [];            % Empty signal vector
fin     = 9.97e6;        % Signal frequency
fs      = 81.92e6;       % Sampling frequency
Nx      = 8192;          % FFT length 2^13
Nx_2    = 2*Nx;          % Checks noise floor after increasing No. of FFT channels
means   = 16;            % Number of FFTs to average
len     = Nx*means;      % Total signal length
win     = 'rect';        % Desired windowing function
R       = 10;            % Converter resolution
tjit    = 0e-12;         % Std deviation for gaussian jitter to sampling moment
A1      = 1;             % ADC input signal amplitude
Anfl    = 1e-10;         % Noise floor a bit above MATLAB rounding noise
Vref    = 1;             % Reference voltage (single ended; range is from -Vref to Vref)
delta   = 2*Vref/(2^R);  % A quantization step
Arndn   = delta/sqrt(12);% Sets the quantization noise level corresponding
                         % to R bit rectangular quantization noise
npow    = 0              % aditive gaussian noise power
k2      = 0.000;         % Second order nonlinearity
k3      = 0.000;         % Third order nonlinearity
k4      = 0.000;         % Fourth order nonlinearity
k5      = 0.000;         % Fifth order nonlinearity


% Analyse input arguments
index = 1;
while index <= nargin
    switch (lower(varargin{index}))
    case {'exercise' 'ex' 'x' 'nr' 'ovn' 'number'}
        ex = varargin{index+1};
        index = index+2;
    otherwise
        index=index+1;
    end
end


% Exercise 1 - perform coherent sampling
% Find m, signal peak level ,no. of frequency bins of signal power .
% What is the cause of noise floor ?  -- Results from FFT of noise power
% being spread across each spectral line.

if ex==1
  % Set rectangular window
  win   = 'rect';
  % Generate and sample signal
  x     = sampling('signal','sine','fin',fin,'fs',fs,'ain',A1,'samples',len);
%  a     = sampling('signal','sine','fin',2e6, 'fs',20e6,'ain',A1,'samples',len);
  % Make FFT
  spec  = adcfft('d',x.data,'skip',1,'mean',means,'N',Nx,'w',win);

  % function to find the maximum peak of spec.
  [max_signal, max_index] = max(spec);
  % Plot
  
  figure(1); clf;
  plot(0:length(spec)-1,20*log10(abs(spec)),'k-')
  xlabel("Frequency : Hz");
  ylabel("Power ");
  legend('signal1; Window -rect ');
  
  fprintf('Signal Peak : %d \n',max_signal);

  fprintf('Frequency Index : %d \n',max_index);
end

% Exercise 2    -- Coherent Sampling with FFT and hann1 window.
if ex==2
  % Put YOUR OWN ORIGINAL solution here!
  % Set hann1 window
  win   = 'hann1';       
  % Generate and sample signal
  x     = sampling('signal','sine','fin',fin,'fs',fs,'ain',A1,'samples',len);
  % Make FFT
  spec  = adcfft('d',x.data,'skip',1,'mean','N',Nx,'w',win);
  
  % function to find the maximum peak of spec.
   [max_signal, max_index] = max(spec);
  % Plot
  figure(2); clf;
  plot(0:length(spec)-1,20*log10(abs(spec)),'r-')
  xlabel("Frequency : Mhz");
  ylabel("Power");
  legend("Signal2 ; Window : hann1");
  
  % outputs signal peak frequency.
  fprintf('Signal Peak : %d \n',max_signal);    % 
  fprintf('Frequency Index : %d \n',max_index);      % 998 : 999
  
end

% Exercise 3
if ex==3
    % Put YOUR OWN ORIGINAL solution here
    % Demonstration of observation time being a non-integer - non-coherent
    % sampling
    win = 'rect';       % window set to rectangular
    fin = 9.97e12;
    fs = 80.0e12;       % non-coherent sampling.
    Nx = 8192;
    x = sampling('signal','sine','fin',fin,'fs',fs,'ain',A1,'samples',len);     % len = 16 * 8192
    % FFT
    spec = adcfft('d',x.data,'skip',1,'mean',means,'N',Nx,'w',win);
    
   % function to find the maximum peak of spec.
   [max_signal, max_index] = max(spec);
   figure(3); clf;
   
   plot(0:length(spec)-1, 20*log10(abs(spec)),'r');
  xlabel("Frequency : Mhz");
  ylabel("Power");
  legend("Signal3 ; Window : rect");
  
  % outputs signal peak frequency.
  fprintf('Signal Peak : %d \n',max_signal);  
  fprintf('Frequency Index : %d \n',max_index); 
end


% Exercise 4
if ex==4
    % Demonstration of observation tiem being a non-integer
    % multiple of input frequency
    win = 'hann1';       % window set to rectangular
    fin = 9.97e12;
    fs = 80.0e12;
    Nx = 8192;
    x = sampling('signal','sine','fin',fin,'fs',fs,'ain',A1,'samples',len);     % len = 16 * 8192
    % FFT
    spec = adcfft('d',x.data,'skip',1,'mean',means,'N',Nx,'w',win);
    
    
    
    tiledlayout(2,1);
    nexttile
    figure(4);
    plot(0:length(spec)-1, 20*log10(abs(spec)),'r')
    title('Non-coherent Sampling with hann1')
    legend('hann1')
    xlabel('Frequency ');
    
    % using hann2 windowing
    nexttile
    win ='hann2';
    spec = adcfft('d',x.data, 'skip',1,'mean',means,'N',Nx,'w',win);
    plot(0:length(spec)-1, 20*log10(abs(spec)),'k-')
    title('Non-coherent Sampling with hann2')
    legend('hann2')

end

% Exercise 5  -- Introduction of quantization noise.

if ex==5
  % Put YOUR OWN ORIGINAL solution here!
   win ='rect';
   fin = 9.97e12;
   fs= 81.92e12;
   Nx =8192;
    
   x= sampling('signal','sine','fin',fin,'fs',fs,'ain',A1,'samples',len);
   q_noise = Arndn * randn(size(x.data));
   x    = x.data + q_noise;
   
   y = quantization('data',x,'R',R,'vref',1,'npow', npow);
   
   
   % FFT of quantized signal
   % FFT with averaging = 16 % default
  spec = adcfft('d',y, 'skip',1,'mean',means,'N',Nx,'w',win);
    
  tiledlayout(3,1);
 
  nexttile
  figure(5);
  xlim([0 1200]);
  plot(0:length(spec)-1,20*log10(spec), 'k-');
  xlim([900 1200])
  title('Signal PSD with Quantization Noise')
  subtitle('Averaging : 16 - Default')
  xlabel('Frequency');
  ylabel('Power :dB');
  fprintf("%.6f ",mean(spec));

   % FFT with averaging = 64
  nexttile
  spec = adcfft('d',y,'skip',1,'mean',means*4,'N',Nx,'w',win);
  plot(0:length(spec)-1,20*log10(spec),'r-');
  xlim([900 1200])
  subtitle('Averaging : 64')
  xlabel('Frequency');
  ylabel('Power :dB');
  fprintf("%.6f ",mean(spec));
 
  % FFT with averaging = 0 
  % The last FFT of the signal is output
  nexttile
  means = 0;
  spec = adcfft('d',y,'skip',1,'mean',means,'N',Nx,'w',win);
  plot(0:length(spec)-1,20*log10(spec));
  xlim([900 1200])
  subtitle('Zero averaging')
  xlabel('Frequency');
  ylabel('Power :dB');
  fprintf("%.6f ",mean(spec));

% vnay01 : Issues with plot...!! No change observed when averaging is
% changed...! 
% Performance Parameters of ADC
figure(52);
hold on
% perf = adcperf('data',spec,'snr','sndr','sfdr','sdr','w',win,'plot',1);
perf = adcperf('data',spec,'snr','w',win,'plot',1);
hold off
fprintf(newline)
fprintf(" Performance - SNR : %.3f",perf.snr);
end



% Exercise 6
if ex==6
    % Put YOUR OWN ORIGINAL solution here!
    fin = 9.97e12;
 x = sampling('signal','sine','fin',fin,'fs',fs,'ain',A1,'samples', len,'k3',0.01);
 spec = adcfft('d',x.data,'skip',1,'mean',means,'N',Nx,'w',win);
 % change input frequency to 39.19 MHz
 % should result in folding of the 3rd harmonic into the range of 0 to fs/2
 fin = 39.19e12;
 x = sampling('signal','sine','fin',fin,'fs',fs,'ain',A1,'samples', len,'k3',0.01);
 spec2 = adcfft('d',x.data,'skip',1,'mean',means,'N',Nx,'w',win);
 figure(6);
 tiledlayout(2,1)
 % Plot PSD wrt Frequency
 nexttile

 plot(0:length(spec)-1, 20*log10(spec),'r-')
 legend('fin = 9.97 MHz')
 xlabel('Frequency');
 ylabel('PSD');
 nexttile
 plot(0:length(spec2)-1,20*log10(spec2),'k')
 legend('fin = 39.19 MHz')
 xlabel('Frequency');
 ylabel('PSD');

end

% Exercise 7  -- code to study noise 
if ex ==7
    cla;
  
  
    Cs = 0.01e-12:0.2e-12:10.0e-12 ;  % range of Cs 0.01 pf to 10.0 pf - steps : 0.2 pf
%     g = length(Cs);
%     fprintf("%d",g);
%     fprintf(newline)
%     fprintf("%.2f \t",Cs)
sampled_signal  = [1: length(Cs)];    
signal_fft      = [1: length(Cs)];
signal_perf     = [1: length(Cs)];

% colorstring = 'kbgry';
for q_step = [8 10 12 14]
    for  k = 1:1:length(Cs) 
    
        sampled_signal=sampling('signal','sine','fin',fin,'fs',fs,'ain',A1,'samples', len,'k3',0.01,'Cs',Cs(k));
        % Add Quantization!!
        signal_quant = quantization('data',sampled_signal.data,'R',q_step,'vref',1,'npow', npow);
        signal_fft = adcfft('d',signal_quant,'skip',1,'mean',means,'N',Nx,'w',win);
        signal_perf = adcperf('data',signal_fft,'snr','w',win);
        snr_2(k) = signal_perf.snr;
%{
    Block below for testing correctness of length
    uncomment for testing
        
        fprintf(newline)
        fprintf("%.4f",Cs(k));
        fprintf(newline)
        fprintf("%.4f\t",snr_2);
        fprintf(newline)
  %}     
    % plot SNR values 
  
    end
figure(7);
hold on
% colorstring = ['k' 'b' 'g' 'r'];
% lab_bit = [8 10 12 14];
plot(Cs,snr_2,'LineWidth',4);
%{ 
Add markers at Cs = 0.01 to 10.0 for each R bit quantizer
xt = [Cs];
yt = [snr_2];
text(xt,yt,'')
%}
legend('8 bit','10 bit','12 bit','14 bit')
xlabel("Cs in F ")
ylabel("SNR : db")

end

% bar(Cs,snr_2,0.001,'g')
% end
% Pending : Plotting a straight line for calculated SNRs
end
toc

%{
Block works... Plotting needs to be beautified!!
%}



% Exercise 8    -- Study effect of clock jitter.
if ex==8
    % Put YOUR OWN ORIGINAL solution here!
    %fin = [9.97e6 10.09e6 1021e6 ];
    fin    = [9.97e6 10.09e6 10.13e6 11.17e6 ];
%     fs = [];
    for j = 1:1:2 
    fs = fin(j).*(8192/(fin(j).*100));
    end
    
    Cs = 0.01e-12;
 %sampling('signal','sine','fin',fin,'fs',fs,'ain',A1*0.97,'samples', len,'k2',sk2,'k3',sk3,'k4',sk4,'k5',sk5,'Cs',Cs,'Rs',Rs,'jit_gaus',jit_gaus);
  for k =1:1:4 
  sampled_signal =  sampling('signal','sine','fin',fin(k),'fs',fs,'ain',A1,'samples', len,'Cs',Cs);
  signal_fft    = adcfft('d',sampled_signal.data,'skip',1,'mean',means,'N',Nx,'w',win);
  signal_perf   = adcperf('data',signal_fft,'snr','sndr','w',win);
  snr_signal(k)    = signal_perf.snr;
  sndr_signal(k)    = signal_perf.sndr;
  end
  % plot starts here
  figure(8);
  tiledlayout(2,1)
  nexttile
  plot(0:length(signal_fft)-1,20*log10(abs(signal_fft)))

  nexttile
  plot(fin,snr_signal,'k.-','LineWidth',2)
  hold on
  plot(fin,sndr_signal,'rd')
 
  hold off
  fprintf(newline);
fprintf("%.10f \t %.10f",snr_signal, sndr_signal);
end

% Exercise 9
if ex==9
    % Put YOUR OWN ORIGINAL solution here!
end

% Exercise 10
if ex==10
    % Put YOUR OWN ORIGINAL solution here!
end

% Exercise 11
if ex==11
    % Put YOUR OWN ORIGINAL solution here!
end

% Exercise 12
if ex==12
    % Put YOUR OWN ORIGINAL solution here!
end

% Exercise 13
if ex==13
    % Put YOUR OWN ORIGINAL solution here!
end

% Exercise 14
if ex==14
    % Put YOUR OWN ORIGINAL solution here!
end

% Exercise 15
if ex==15
    % Put YOUR OWN ORIGINAL solution here!
end

% Exercise 16
if ex==16
    % Put YOUR OWN ORIGINAL solution here!
end

% Exercise 17
if ex==17
    % Put YOUR OWN ORIGINAL solution here!
end
 
% Exercise 18
if ex==18
    % Put YOUR OWN ORIGINAL solution here!
end
