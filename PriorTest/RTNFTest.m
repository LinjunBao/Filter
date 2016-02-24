str = '1_2_t';
windowlength = 400 ;
sliplength = 400;
SampleFrequency = 2000;
emgdata = importdata([str,'.mat']);
emgdata = mFilterBandPass(emgdata,0,350,SampleFrequency);
[length,b]= size(emgdata);
emg = zeros(length,1);
N = (length-windowlength)/sliplength+1;
FilterFre = zeros(N,1);
i = 1;
[emg((1+sliplength*(i-1)):(windowlength+sliplength*(i-1))),nextFilterInitPara,thisFilterFre] = RealTimeNotchFilter(emgdata((1+sliplength*(i-1)):(windowlength+sliplength*(i-1))),0,SampleFrequency,450,1,0);
lastFilterFre=thisFilterFre;
FilterFre(i) = thisFilterFre;
FilterInitPara = nextFilterInitPara;
for i = 2:N
    %fre = frequencySearch(emgdata((1+sliplength*(i-1)):(windowlength+sliplength*(i-1))),SampleFrequency);
	[emg((1+sliplength*(i-1)):(windowlength+sliplength*(i-1))),nextFilterInitPara,thisFilterFre] = RealTimeNotchFilter(emgdata((1+sliplength*(i-1)):(windowlength+sliplength*(i-1))),FilterInitPara,SampleFrequency,450,0,lastFilterFre);
    lastFilterFre=thisFilterFre;
	FilterFre(i) = thisFilterFre;
	FilterInitPara = nextFilterInitPara;
end
save([str,'_nf.mat'],'emg');

