str = '2';
emgorigin = importdata([str,'.mat']);
emg = emgorigin;
emg1=[emg(14501:24500,1)];

str = '3';
emgorigin = importdata([str,'.mat']);
emg = emgorigin;
emg2=[emg(16001:26000,1)];


str = '4';
emgorigin = importdata([str,'.mat']);
emg = emgorigin;
emg3=[emg(14501:24500,1)];

str = '5';
emgorigin = importdata([str,'.mat']);
emg = emgorigin;
emg4=[emg(16501:26500,1)];

% SampleFrequency = 2000;
% emg1 = mFilterBandPass(emg1,0,SampleFrequency);
% emg2 = mFilterBandPass(emg2,0,SampleFrequency);
% emg3 = mFilterBandPass(emg3,0,SampleFrequency);
% emg4 = mFilterBandPass(emg4,0,SampleFrequency);
emg=[emg1;emg2;emg3;emg4];
save(['1_2_t.mat'],'emg');