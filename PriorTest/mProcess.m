

subplot(2,1,1)
Fs= 2000;
T = 1/Fs;
EMGfilter1 =emg(:,1);
[samples,temp]=size(EMGfilter1);
N = samples;%length of signals
%N = 2000;%length of signals
NFFT = 2^nextpow2(N); % Next power of 2 from length of y
tic;

%test 对零输入的响应
% [m,n]= size(emg);
% EMGfilter1 = zeros(m,1);

EMGfilter1 = mFilter(EMGfilter1,70,2000);
toc;

EMGfft1 = fft(EMGfilter1,NFFT)/N;
f= Fs/2*linspace(0,1,NFFT/2+1);
% Plot single-sided amplitude spectrum.
plot(f,2*abs(EMGfft1(1:NFFT/2+1))) 
title('COMB Single-Sided Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')


subplot(2,1,2)
EMGfilter0 = emg(:,1);
%EMGfilter = filter(b,a,emg(:,1));
EMGfft0 = fft(EMGfilter0,NFFT)/N;
f= Fs/2*linspace(0,1,NFFT/2+1);
% Plot single-sided amplitude spectrum.
plot(f,2*abs(EMGfft0(1:NFFT/2+1))) 
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')

mplot


