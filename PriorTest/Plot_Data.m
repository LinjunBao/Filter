function [fetureSum,SNRsum]=Plot_Data(varargin)
Varargin_length = length(varargin);
datalength = varargin{1}.datalength;
fulllength = datalength;
Fs = varargin{1}.SampleRate;
N=datalength;
NFFT = 2^nextpow2(N);
%f= Fs/2*linspace(0,1,NFFT/2+1);
f= Fs/4*linspace(0,1,NFFT/4+1);
t = 30*linspace(0,1,fulllength);
colorstring = 'kcmyrgbwkcmyrgbwk';

figure(1);
for i=1:Varargin_length
    subplot(Varargin_length*2,1,i)
    plot(t,varargin{i}.fullrawdata,colorstring(i),'linewidth',2);
    legend(['Raw ',num2str(varargin{i}.StimuFrequency),'Hz ',num2str(varargin{i}.StimuPluse),'us']);
    set(gca,'fontsize',20);
end
ylabel('EMG Signals(V)','FontSize',20);
for i=1:Varargin_length
    subplot(Varargin_length*2,1,i+Varargin_length)
    plot(t,varargin{i}.Filteredfullrawdata,colorstring(i),'linewidth',2);
    legend(['Filtered ',num2str(varargin{i}.StimuFrequency),'Hz ',num2str(varargin{i}.StimuPluse),'us']);
    set(gca,'fontsize',20);
end
xlabel('Time(s)','FontSize',20);

figure(2);
for i=1:Varargin_length
    subplot(Varargin_length*2,1,i)
    plot(f,2*abs(varargin{i}.fftfullrawdata(1:NFFT/4+1)),colorstring(i),'linewidth',2);
    legend(['Raw Signal FFT ',num2str(varargin{i}.StimuFrequency),'Hz ',num2str(varargin{i}.StimuPluse),'us']);
    set(gca,'fontsize',20);
end
ylabel('Amplitude','FontSize',20);
for i=1:Varargin_length
    subplot(Varargin_length*2,1,i+Varargin_length)
    plot(f,2*abs(varargin{i}.fftFilteredfullrawdata(1:NFFT/4+1)),colorstring(i),'linewidth',2);
    legend(['Filtered Signal FFT ',num2str(varargin{i}.StimuFrequency),'Hz ',num2str(varargin{i}.StimuPluse),'us']);
    set(gca,'fontsize',20);
end
xlabel('Frequency(Hz)','FontSize',20);

figure(3);
for i=1:Varargin_length
    subplot(Varargin_length*2,1,i)
    plot(f,varargin{i}.psdfullrawdata(1:NFFT/4+1),colorstring(i),'linewidth',2);
    legend(['Raw Signal ',num2str(varargin{i}.StimuFrequency),'Hz ',num2str(varargin{i}.StimuPluse),'us']);
    set(gca,'fontsize',20)
end
ylabel('Normalized PSD','FontSize',20);
for i=1:Varargin_length
    subplot(Varargin_length*2,1,i+Varargin_length)
    plot(f,varargin{i}.psdFilteredfullrawdata(1:NFFT/4+1),colorstring(i),'linewidth',2);
    legend(['Filtered Signal ',num2str(varargin{i}.StimuFrequency),'Hz ',num2str(varargin{i}.StimuPluse),'us']);
    set(gca,'fontsize',20);
end
xlabel('Frequency(Hz)','FontSize',20);

SNRsum = zeros(Varargin_length,2);
for i=1:Varargin_length
    SNRsum(i,1)=varargin{i}.SNRBefore;
    SNRsum(i,2)=varargin{i}.SNRAfter;
end

[winsum,feturedim] = size(varargin{i}.Feture_TD_AR_Before);
fetureSum = zeros(winsum,feturedim,Varargin_length*2);
for i=1:Varargin_length
    fetureSum(:,:,2*i-1) = varargin{i}.Feture_TD_AR_Before;
    fetureSum(:,:,2*i) = varargin{i}.Feture_TD_AR_After;
end


figure(4);
ylabel('EMG MAV(mV)','FontSize',20);
xlabel('Time(s)','FontSize',20);
t=20*linspace(0,1,winsum);
plot(t,fetureSum(:,1,2)*1e3,colorstring(1),'linewidth',2);
ylabel('EMG MAV(mV)','FontSize',20);
xlabel('Time(s)','FontSize',20);
set(gca,'fontsize',20);


% for i =1:9
%     figure(i+4);
%     ylabel('EMG MAV(mV)','FontSize',20);
%     xlabel('Time(s)','FontSize',20);
%     t=20*linspace(0,1,winsum);
%     plot(t,fetureSum(:,i+1,2)*1e3,colorstring(1),'linewidth',2);
%     ylabel('EMG MAV(mV)','FontSize',20);
%     xlabel('Time(s)','FontSize',20);
%     set(gca,'fontsize',20);
% end
