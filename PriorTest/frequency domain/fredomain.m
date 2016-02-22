clear all;
clc;
tic;
fs = 1000;%采样频率，delsys需另外算
M = 5000;%数据长度
f = fs*(0:M-1)/M;

pin11=0;%定义初始值，频谱和功率谱
ps11=0;
pin21=0;
ps21=0;
pin31=0;
ps31=0;
pin41=0;
ps41=0;

emg1=importdata([ 'emg_imyo.mat']);%读取数据
emg2=importdata([ 'emg_mega.mat']);
emg3=importdata([ 'emg_biometrics.mat']);
emg4=importdata([ 'emg_delsys.mat']);

for i=1:5000:100000          %imyo
    time=emg1(i:i+5000-1);
    pin1=fft(time);
    pin1=pin1./max(pin1);
    ps1=pin1.^2;
    pin11=pin11+pin1;
    ps11=ps11+ps1;
end
pin1=pin11./20;
ps1=ps11./20;

for i=1:5000:100000       %mega
    time=emg2(i:i+5000-1);
    pin2=fft(time);
    pin2=pin2./max(pin2);
    ps2=pin2.^2;
    pin21=pin21+pin2;
    ps21=ps21+ps2;
end
pin2=pin21./20;
ps2=ps21./20;

for i=1:5000:100000         %biometrics
    time=emg3(i:i+5000-1);
    pin3=fft(time);
    pin3=pin3./max(pin3);
    ps3=pin3.^2;
    pin31=pin31+pin3;
    ps31=ps31+ps3;
end
pin3=pin31./20;
ps3=ps31./20;

for i=1:10000:200000         %delsys
    time=emg4(i:i+10000-1);
    pin4=fft(time);
    pin4=pin4./max(pin4);
    ps4=pin4.^2;
    pin41=pin41+pin4;
    ps41=ps41+ps4;
end
pin4=pin41./20;
ps4=ps41./20;

fsd = 2000;%采样频率，delsys需另外算
Md = 10000;%数据长度
fd = fsd*(0:Md-1)/Md;


figure(1);
subplot(411);
plot(f(1:M/2),2*abs(pin1(1:M/2))/M/(9*10^(-5)),'linewidth',2);
legend('SJT-iMYO');
set(gca,'fontsize',20);
subplot(412);
plot(f(2:M/2),2*abs(pin2(2:M/2))/M/(7*10^(-5)),'r','linewidth',2);
legend('Mega');
set(gca,'fontsize',20);
ylabel('Normalized Amplitude','FontSize',20);
subplot(413);
plot(f(2:M/2),2*abs(pin3(2:M/2))/M/(10*10^(-5)),'m','linewidth',2);
legend('Biometrics');
set(gca,'fontsize',20);
subplot(414);
plot(fd(2:Md/2),2*abs(pin4(2:Md/2))/Md/(6*10^(-5)),'m','linewidth',2);
legend('Delsys');
xlabel('Frequency(Hz)','FontSize',20);
set(gca,'fontsize',20);

figure(2);
subplot(411);
plot(f(1:M/2),2*abs(ps1(1:M/2))/M/(6*10^(-5)),'linewidth',2);
legend('SJT-iMYO');
set(gca,'fontsize',20);
subplot(412);
plot(f(2:M/2),2*abs(ps2(2:M/2))/M/(6*10^(-5)),'r','linewidth',2);
legend('Mega');
set(gca,'fontsize',20);
ylabel('Normalized PSD','FontSize',20);
subplot(413);
plot(f(1:M/2),2*abs(ps3(1:M/2))/M/(6*10^(-5)),'m','linewidth',2);
legend('Biometrics');
set(gca,'fontsize',20);
subplot(414);
plot(fd(2:Md/2),2*abs(ps4(2:Md/2))/Md/(3*10^(-5)),'m','linewidth',2);
legend('Delsys');
xlabel('Frequency(Hz)','FontSize',20);
set(gca,'fontsize',20);

toc;