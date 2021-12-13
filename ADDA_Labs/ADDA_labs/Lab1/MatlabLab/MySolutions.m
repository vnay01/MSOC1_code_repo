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
  clf;
    % Set rectangular window
  
  win   = 'rect';
  % Generate and sample signal
  x     = sampling('signal','sine','fin',fin,'fs',fs,'ain',A1,'samples',len);
%   x = sampling('signal','sine_real','fin',fin,'fs',fs,'ain',A1,'samples',len);
  % Make FFT
  spec  = adcfft('d',x.data,'skip',1,'mean',means,'N',Nx,'w',win);

  % function to find the maximum peak of spec.
  [max_signal, max_index] = max(findpeaks(spec));
  fprintf('Signal Peak : %d \n',(max_signal));
  fprintf('Frequency Index : %d \n',max_index-1);
  % Plot
  
  figure(1); clf;
  plot(0:length(spec)-1,20*log10(abs(spec)),'r-')
  xlabel("Frequency : Hz");
  ylabel("Power Spectral Density : dB ");
  legend('Signal1; Window -rect ');
  
  % FFT with hann1 window
  figure;
  win = 'hann1';
  spec = adcfft('d',x.data,'skip',1,'mean',means,'N',Nx,'w',win);
  plot(0:length(spec)-1,20*log10(abs(spec)),'r-');
  xlabel("Frequency : Hz");
  ylabel("Power Spectral Density : dB ");
  legend('Signal1; Window -hann1 ');
 [max_signal, max_index] = max(spec);
  
  fprintf('Signal Peak : %d \n',(max_signal));
  fprintf('Frequency Index : %d \n',max_index-1);
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
   win ='hann1';
   fin = 9.97e12;
   fs= 81.92e12;
   Nx =8192;
   R = 10;
   
   x= sampling('signal','sine','fin',fin,'fs',fs,'ain',A1,'samples',len);
   q_noise =Arndn*randn(size(x.data)); 
%    q_noise_scaled = rescale(q_noise,(-A1/2^R),(A1/2^R));
   x = x.data + q_noise;
   
   
%    x.data    = x.data + q_noise; % Added white random noise to signal.
   
%    y = quantization('data',x,'R',R,'vref',1,'npow', npow);
   
   
   % FFT of quantized signal
   % FFT with averaging = 16 % default
  spec = adcfft('d',x, 'skip',1,'mean',16,'N',Nx,'w',win);
    
   figure(5);
   plot(0:length(spec)-1,20*log10(spec), 'k-')
   hold on
%   xlim([900 1200])
%   spec1 = adcfft('d',x,'skip',1,'mean',64,'N',Nx,'w',win);
%   nexttile
%   plot(0:length(spec1)-1,20*log10(spec1),'r-');
  title('Signal PSD with Quantization Noise')
  subtitle('Averaging : 16 ')
  xlabel('Frequency');
  ylabel('Power :dB');
%   fprintf("%.6f ",mean(spec))

%    % FFT with averaging = 64
%   spec = adcfft('d',x,'skip',1,'mean',64,'N',Nx,'w',win);
%   plot(0:length(spec)-1,20*log10(spec),'r-');
%   subtitle('Averaging : 64')
%   xlabel('Frequency');
%   ylabel('Power :dB');
%   fprintf("%.6f ",mean(spec))
 
  % FFT with averaging = 0 
%   % Only the last FFT of the signal is output
%   nexttile
%   means = 1;
%   spec = adcfft('d',x,'skip',1,'mean',means,'N',Nx,'w',win);
%   plot(0:length(spec)-1,20*log10(spec));
%   subtitle('Zero averaging')
%   xlabel('Frequency');
%   ylabel('Power :dB');
%   fprintf("%.6f ",mean(spec));

% % vnay01 : Issues with plot...!! No change observed when averaging is
% % changed...! 
% % Performance Parameters of ADC
% % figure(52);

% perf = adcperf('data',spec,'snr','sndr','sfdr','sdr','w',win,'plot',1);
perf = adcperf('data',spec,'snr','sndr','w',win);

% 
fprintf(newline)
fprintf(" Performance - SNR : %.3f",perf.snr);
fprintf(newline)
fprintf("Performance - SNDR : %.3f",perf.sndr);

end



% Exercise 6
if ex==6
    % Put YOUR OWN ORIGINAL solution here!
    fin = 9.97e12;
    win = 'hann1';
    
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


% Exercise 7  -- code to study kT/C noise 
if ex ==7
    cla;
  
    win = 'hann1';
    
    Cs = 0.01e-12:0.2e-12:10.0e-12 ;  % range of Cs 0.01 pf to 10.0 pf - steps : 0.2 pf

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
plot(Cs,snr_2,'LineWidth',4)
legend('8 bit','10 bit','12 bit','14 bit')
xlabel("Cs in F ")
ylabel("SNR : dB")
% Calculation of theoretical SNRs
% SNR_theoretical = 20 * log10(P_signal/P-q_noise) = 6.02*N + 1.76 dB
 
figure(71)
   q_bit = [8 10 12 14];
   for k = 1:1:length(q_bit)
       SNR_theo(k) = 6.02*q_bit(k) + 1.76;
       fprintf("%.4f \t",SNR_theo(k));
        hold on
    plot(q_bit(k),SNR_theo(k),'rd')
    
   
   end
   

end


% bar(Cs,snr_2,0.001,'g')
% end
% Pending : Plotting a straight line for calculated SNRs
end


%{
Block works... Plotting needs to be beautified!!
%}



% Exercise 8    -- Study effect of clock jitter.
if ex==8
    clf;
    % Put YOUR OWN ORIGINAL solution here!
    win = 'hann1';
    % come up with come algo for generating fin as prime numbers for better
    % simulation range!!
    sndr1 = [];
    sndr2 = [];
    sndr3 = [];
    snr_jit1 = [];
    snr_jit2 = [];
    snr_jit3 = [];
    
  primenums = primes(floor(Nx/2.1));
  fin =primenums(3:20:length(primenums))/Nx*fs;
    
    jit_gaus1 = 1e-12;
    jit_gaus2 = 5e-12;
    jit_gaus3 = 15e-12;     % jitter deviation : 1ps 5ps 15ps
        for k=1:length(fin)
    %sampling('signal','sine','fin',fin,'fs',fs,'ain',A1*0.97,'samples', len,'k2',sk2,'k3',sk3,'k4',sk4,'k5',sk5,'Cs',Cs,'Rs',Rs,'jit_gaus',jit_gaus);
    sampled_signal = sampling('signal','sine','fin',fin(k),'fs',fs,'ain',A1,'samples', len,'jit_gaus',jit_gaus1);
    signal_fft = adcfft('d',sampled_signal.data,'skip',1,'mean',16,'N',Nx,'win',win);
    signal_perf = adcperf('data',signal_fft,'snr','sndr','sfdr','sdr','w',win);
    sndr1(k)= signal_perf.sndr;
    snr_jit1(k) = -20*log(2*pi*fin(k)*jit_gaus1);
        end
                for k=1:length(fin)
    %sampling('signal','sine','fin',fin,'fs',fs,'ain',A1*0.97,'samples', len,'k2',sk2,'k3',sk3,'k4',sk4,'k5',sk5,'Cs',Cs,'Rs',Rs,'jit_gaus',jit_gaus);
    sampled_signal = sampling('signal','sine','fin',fin(k),'fs',fs,'ain',A1,'samples', len,'jit_gaus',jit_gaus2);
    signal_fft = adcfft('d',sampled_signal.data,'skip',1,'mean',16,'N',Nx,'win',win);
    signal_perf = adcperf('data',signal_fft,'snr','sndr','sfdr','sdr','w',win);
    sndr2(k)= signal_perf.sndr;
    snr_jit2(k) = -20*log(2*pi*fin(k)*jit_gaus2);
                end
    for k=1:length(fin)
    %sampling('signal','sine','fin',fin,'fs',fs,'ain',A1*0.97,'samples', len,'k2',sk2,'k3',sk3,'k4',sk4,'k5',sk5,'Cs',Cs,'Rs',Rs,'jit_gaus',jit_gaus);
    sampled_signal = sampling('signal','sine','fin',fin(k),'fs',fs,'ain',A1,'samples', len,'jit_gaus',jit_gaus3);
    signal_fft = adcfft('d',sampled_signal.data,'skip',1,'mean',16,'N',Nx,'win',win);
    signal_perf = adcperf('data',signal_fft,'snr','sndr','sfdr','sdr','w',win);
    sndr3(k)= signal_perf.sndr;
    snr_jit3(k) = -20*log(2*pi*fin(k)*jit_gaus3);
                end
    figure('Name','Ex_1.8','NumberTitle','off');
  plot(fin,sndr1,'k-')

    hold on
    plot(fin,sndr2,'r.-')
    plot(fin,sndr3,'gd-')
    legend( '1ps','5ps','15ps');
    xlabel('Frequency ');
    ylabel('SNR dB');
    % Theoretical SNR due to jitter
    % SNR = -20*log(2*pi*fin*jit_gaus)
    figure('Name','Theoretical SNR','NumberTitle','off');
    plot(fin,snr_jit1,'bd-')
    hold on
    plot(fin,snr_jit2,'r.-')
    plot(fin,snr_jit3,'k-')
    legend( '1ps','5ps','15ps');
    xlabel('Frequency ');
    ylabel('SNR dB');
    
   
end

% Exercise 9  -- Effect of clock jitter
if ex==9  
    cla;
    % Put YOUR OWN ORIGINAL solution here!
    win = 'hann1';
    fs = 250e6;
    fin = (3127/8192).*fs;     % required to avoid spectral leakage due to windowing.
    sndr_jit =[];
    sndr_jit_2 =[];
    jit_gaus = 1e-15:1e-12:20e-12;
  
    for   k = 1:1:length(jit_gaus)
         sampled_signal =  sampling('signal','sine','fin',fin,'fs',fs,'ain',A1,'samples', len,'jit_gaus',jit_gaus(k));
         sampled_signal2 =  sampling('signal','sine','fin',100e6,'fs',fs,'ain',A1,'samples', len,'jit_gaus',jit_gaus(k));
         signal_fft    = adcfft('d',sampled_signal.data,'skip',1,'mean',means,'N',Nx,'w',win);
         signal_perf   = adcperf('data',signal_fft,'sndr','w',win);
         sndr_jit(k) = signal_perf.sndr;
         signal_fft_2    = adcfft('d',sampled_signal2.data,'skip',1,'mean',means,'N',Nx,'w',win);
         signal_perf_2   = adcperf('data',signal_fft_2,'sndr','w',win);
         sndr_jit_2(k) = signal_perf_2.sndr;
    end
    figure('Name','Ex1.9','NumberTitle','off');
     plot(jit_gaus,sndr_jit,'r.-')
     hold on
    plot(jit_gaus,sndr_jit_2,'k.-')
    xlabel("jitter deviation");
    ylabel("SNDR");
    legend('Coherent Sampling','Non-Coherent');
end

% A study in quantization %
% Exercise 10       -- quantization noise modelling as a rectangular PSD
if ex==10
    % Put YOUR OWN ORIGINAL solution here!
    cla;
    R = 8;
    Vref    = 1;             % Reference voltage (single ended; range is from -Vref to Vref)
    delta   = 2*Vref/(2^R);  % A quantization step
    Arndn   = delta/sqrt(12);
    
    
    
    win = 'hann1';
    sampled_signal = sampling('signal','sine','fin',fin,'fs',fs,'ain',A1,'samples', len);
    added_noise = Arndn *randn(size(sampled_signal.data));       % adding gaussian noise with same amp. of 8 bit Quantized Noise.
    noised_signal = sampled_signal.data + added_noise;
    fprintf("%.4f",Arndn);
    fprintf(newline);
    signal_fft = adcfft('d',noised_signal,'skip',1,'mean',means,'N',Nx,'w',win);
    signal_perf   = adcperf('data',signal_fft,'sndr','w',win);  

    % plot starts here
    tiledlayout(2,1)
    figure('Name','Effect of averaging on Random Noise','NumberTitle','off')
    nexttile
    plot(0:length(signal_fft)-1,20*log10(abs(signal_fft)),'r-')
    xlabel("Frequency");
    ylabel("PSD : Signal");
    legend('No. of Averages : 16');
    fprintf(newline);
    fprintf("Calculated SNDR : %.4f",signal_perf.sndr);
    
    %effect of averaging
    means = 1;
    signal_fft2 = adcfft('d',noised_signal,'skip',1,'mean',means,'N',Nx,'w',win);
    signal_perf2   = adcperf('data',signal_fft2,'sndr','w',win); 
    fprintf("Mean change to %d",means);
    fprintf(newline);

    nexttile
    plot(0:length(signal_fft2)-1,20*log10(abs(signal_fft2)),'g-')
    xlabel("Frequency");
    ylabel("PSD : Signal");
    legend('No. of Averages : 1');
    fprintf(newline);
    fprintf("Calculated SNDR : %.4f",signal_perf2.sndr);
    fprintf(newline);
    

end

% Exercise 11
if ex==11
    % Put YOUR OWN ORIGINAL solution here!
    cla;
    R = 8;
    Vref    = 1;             % Reference voltage (single ended; range is from -Vref to Vref)
    delta   = 2*Vref/(2^R);  % A quantization step
    Arndn   = delta/sqrt(12);
    
 
    
    win = 'hann1';
    sampled_signal = sampling('signal','sine','fin',fin,'fs',fs,'ain',A1,'samples', len);
    quantized_signal = quantization('data',sampled_signal.data,'R',R,'vref',1,'npow', npow);
    fprintf("%.4f",Arndn);
    fprintf(newline);
    signal_fft = adcfft('d',quantized_signal,'skip',1,'mean',means,'N',Nx,'w',win);
    signal_perf   = adcperf('data',signal_fft,'sndr','w',win);  
    fprintf("%d",means);
    fprintf(newline);
    % plot starts here
    tiledlayout(2,1)
    figure('Name','Exercise 11','NumberTitle','off')
    nexttile
    plot(0:length(signal_fft)-1,20*log10(abs(signal_fft)),'r-')
    hold on
    xlabel("Frequency");
    ylabel("PSD : Signal");
    legend('No. Of Average : 16');
    fprintf(newline);
    fprintf("Calculated SNDR : %.4f",signal_perf.sndr);
    fprintf(newline);

    % studying the effect of averaging
    R = 8;
    Vref    = 1;             % Reference voltage (single ended; range is from -Vref to Vref)
    delta   = 2*Vref/(2^R);  % A quantization step
    Arndn   = delta/sqrt(12);
    means = 1
    win = 'hann1';
    sampled_signal2 = sampling('signal','sine','fin',fin,'fs',fs,'ain',A1,'samples', len);
    quantized_signal2 = quantization('data',sampled_signal2.data,'R',R,'vref',1,'npow', npow);
    fprintf("%.4f",Arndn);
    fprintf(newline);
    signal_fft2 = adcfft('d',quantized_signal2,'skip',1,'mean',means,'N',Nx,'w',win);
    signal_perf2   = adcperf('data',signal_fft2,'sndr','w',win);  
    fprintf("%d",means);
    fprintf(newline);
    % plot starts here
%     figure('Name','Exercise 11','NumberTitle','off')
    nexttile
    plot(0:length(signal_fft2)-1,20*log10(abs(signal_fft2)),'k-')
    xlabel("Frequency");
    ylabel("PSD : Signal");
    legend('No. Of Average : 1');
    fprintf(newline);
    fprintf("Calculated SNDR : %.4f",signal_perf2.sndr);
    fprintf(newline);
   %{ 
    means = 64;
    signal_fft = adcfft('d',quantized_signal,'skip',1,'mean',means,'N',Nx,'w',win);
    signal_perf   = adcperf('data',signal_fft,'sndr','w',win); 
    fprintf("%d",means);
    fprintf(newline);

    figure('Name','Effect of averaging = 64','NumberTitle','off')
    plot(0:length(signal_fft)-1,20*log10(abs(signal_fft)),'b-')
    xlabel("Frequency");
    ylabel("PSD : Signal");
    fprintf(newline);
    fprintf("Calculated SNDR : %.4f",signal_perf.sndr);
    fprintf(newline);
    %}
end
% Exercise 12  -- 
if ex==12
    % Put YOUR OWN ORIGINAL solution here!
    % generate a ramp singnal [-1V to 1V] - using unit function
     R = 3;
    
    % generation of a ramp signal
    t = (1/fs)*(0:len-1);
    k = 2/((len-1)*1/fs);
    ramp_sig = t*k - 1;
    quantized_signal = quantization('data',ramp_sig,'R',R,'vref',1); 
    
   
    
    figure('name', 'Ex 12a','NumberTitle','off');
    hold on;
    plot(t, ramp_sig,'b');
    plot(t, quantized_signal,'k');
    xlabel('time (s)');
    ylabel(' Amplitude: V');
    legend('ramp','quantized signal');
    
    % Quantization error with a sinusoidal input
    means = 2;
    len = Nx*means;
    t = 1/fs*(0:(len-1));
  
    sin_signal = sampling('signal','sine','fin',fin,'fs',fs,'ain',A1,'samples',len);
    quantized_sine_signal = quantization('data',sin_signal.data,'R',R,'vref',1); 
    signal_fft = adcfft('d',quantized_sine_signal,'skip',1,'mean','N',Nx,'w',win);
    
    
    figure('name', 'Ex 12b','NumberTitle','off');
    hold on;
    plot(t,sin_signal.data,'r')
    plot(t, quantized_sine_signal,'g')
    legend('Sample', 'quantized signal')
    xlim([0 0.2*1e-6])
    ylabel('Amplitude: V');
    xlabel('time: s');
% FFT of ramp signal produces a lot of harmonics ....due to the fact that a
% ramp signal is composed of a multiple harmonics of a sine wave.
% needs mathematical proof for my own understanding

    %}
   
end

% Exercise 13   -- Proof whether Quantization is a random process?
if ex==13
    % Put YOUR OWN ORIGINAL solution here!
end

% Exercise 14
if ex==14
    % Put YOUR OWN ORIGINAL solution here!
    R = 8;
    Vref    = 1;             % Reference voltage (single ended; range is from -Vref to Vref)
    delta   = 2*Vref/(2^(R+1));  % A quantization step
    Arndn   = delta/sqrt(12);
    
    sampled_signal = sampling('signal','sine','fin',fin,'fs',fs,'ain',0.95,'samples',len);
    noise_gauss = Arndn * randn(size(sampled_signal.data));
    sampled_signal.data = sampled_signal.data + noise_gauss;
    % quantization
    quantized_signal = quantization('data',sampled_signal.data,'R',R,'vref',1,'npow',npow);
    %run fft
    signal_fft = adcfft('d',quantized_signal,'skip',1,'mean','N',Nx,'w',win);   
    signal_perf = adcperf('data',signal_fft,'snr','sndr','sfdr','sdr','w',win)
    figure('name', ' Ex 14 - dither');
    plot(0:length(signal_fft)-1,20*log10(abs(signal_fft)),'k-')
    xlabel("Frequency");
    ylabel("PSD");
    
    x = sampling('signal','sine','fin',fin,'fs',fs,'ain',0.95,'samples',len);
    y = quantization('data',x.data,'R',R,'vref',1);
    spec = adcfft('d',y,'skip',1,'mean','N',Nx,'w',win);   
    perf2 = adcperf('data',spec,'snr','sndr','sfdr','sdr','w',win)
    figure('name', 'Ex 14 - No dither');
    plot(0:length(spec)-1,20*log10(abs(spec)),'r-')
    xlabel("Frequency");
    ylabel("PSD");
    
    
end

% Exercise 15
if ex==15
    % Put YOUR OWN ORIGINAL solution here!
        R = 8;
    Vref    = 1;             % Reference voltage (single ended; range is from -Vref to Vref)
    delta   = 2*Vref/(2^(R+1));  % A quantization step
    Arndn   = delta/sqrt(12);
    
    sampled_signal = sampling('signal','sine','fin',fin,'fs',fs,'ain',1.01,'samples',len);
    noise_gauss = Arndn * randn(size(sampled_signal.data));
    sampled_signal.data = sampled_signal.data + noise_gauss;
    quantized_signal = quantization('data',sampled_signal.data,'R',R,'vref',1,'npow',npow);
    
    %fft
    signal_fft = adcfft('d',quantized_signal,'skip',1,'mean','N',Nx,'w',win);   
    signal_perf = adcperf('data',signal_fft,'snr','sndr','sfdr','sdr','w',win)
    figure('name', ' Ex 14 - dither with clipping');
    plot(0:length(signal_fft)-1,20*log10(abs(signal_fft)),'k-')
    xlabel("Frequency");
    ylabel("PSD");
    
end


% Exercise 16
if ex==16
    % Put YOUR OWN ORIGINAL solution here!
    % add gaussian noise source
    figure(16)
    tiledlayout(4,4)
    nexttile
    
    R = 10;
    win = 'hann1';
    sampled_signal = sampling('signal','sine','fin',fin,'fs',fs,'ain',A1,'samples',len);
    
    noise_gaus = Arndn*randn(size(sampled_signal.data)); % noise amp. corresponding to 10 bit Q
   % add a noise source , the power of which will be swept in range 0 to 6
   % Q_power
 
    sampled_signal = sampled_signal.data + noise_gaus;
    
    for i = 0:1:6
    ref_gaus = i.*noise_gaus;
    sampled_signal = sampled_signal + ref_gaus;
    
    % takes FFT of noised signal.
    signal_fft = adcfft('d',sampled_signal,'skip',1,'mean',means,'N',Nx,'w',win);
    noise_power = adcfft('d',noise_gaus,'skip',1,'mean',means,'N',Nx,'w',win);
    signal_perf = adcperf('data',signal_fft,'sndr','w',win);
    
    plot(0:length(signal_fft)-1,20*log10(signal_fft),'k.-')
    nexttile
  
    xlabel("Frequency");
    ylabel("PSD :Signal");
    fprintf("SNDR = %.4f \t",signal_perf.sndr);

    end
    nexttile
    plot(ref_gaus,signal_perf.sndr,'r.-')
    
    % add noise source for sweeping - 0 to 6 times gaussian noise power

    
    figure(16)
    tiledlayout(2,2)
    nexttile
    plot(0:length(noise_power)-1, 20*log10(noise_power))
    ylim([-120 0]);     % scales y -axis for better visualization
    xlabel("Frequency");
    ylabel("Noise : PSD");
    hold on
    nexttile
%     plot(,20*log10(signal_fft));
    xlabel("Frequency");
    ylabel("PSD :Signal");
    

    
end

% Exercise 17
if ex==17
    % Put YOUR OWN ORIGINAL solution here!
    ADCdemo('x',1);
end
 
% Exercise 18
if ex==18
    % Put YOUR OWN ORIGINAL solution here!
end

if ex==19
    clf;
    t = linspace(0,10,1000);

    
    x1 = sin(2*t);
% fprintf("%d \t",length(t));

plot(t,x1);
% sampling
end

if ex == 54
 % Exercise 15
    % Put YOUR OWN ORIGINAL solution here!
    win = 'hann1';
    sndr =[];
    
    %smaple the signal
    x = sampling('signal','sine','fin',fin,'fs',fs,'ain',1,'samples',len);
    %create noise corresponding to 10 bit quantization error 
    noise = randn(size(x.data))*0.56382*1e-3;
    %signal and noise
    x.data = x.data+noise;
    %create 0 to 6 times noise
    gaus_added = linspace(0,6,300);
    
    for i = 1:length(gaus_added)
        y = quantization('data',(x.data+ gaus_added(i)*noise),'R',R,'vref',1);
        spec = adcfft('d',y,'skip',1,'mean','N',Nx,'w',win);
        perf1 = adcperf('data',spec,'snr','sndr','sfdr','sdr','w',win);
        sndr(i) = perf1.snr;
      
    end
    
    figure('name', 'SNDR vs added gaussian noise');
    plot(gaus_added, sndr);
    ylabel('dB');
    xlabel('gaussian noise');
      fprintf("%.4f\t",sndr);
end


