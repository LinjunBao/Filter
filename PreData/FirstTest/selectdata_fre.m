str = '2';
emgorigin = importdata([str,'.mat']);
emg = emgorigin;
emg1=[emg(16001:26000,1)];

str = '3';
emgorigin = importdata([str,'.mat']);
emg = emgorigin;
emg2=[emg(16001:26000,1)];


str = '4';
emgorigin = importdata([str,'.mat']);
emg = emgorigin;
emg3=[emg(16001:26000,1)];

str = '5';
emgorigin = importdata([str,'.mat']);
emg = emgorigin;
emg4=[emg(16001:26000,1)];


emg=[emg1;emg2;emg3;emg4];
save(['1_2.mat'],'emg');