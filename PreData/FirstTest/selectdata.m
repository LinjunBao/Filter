for
str = '3';
emgorigin = importdata([str,'.mat']);
emg = emgorigin;
emg=[emg(16001:30500,1);emg(30501:45000,1)];
save([str,'_1.mat'],'emg');