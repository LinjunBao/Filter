str = '1_2';
windowlength = 300 ;
sliplength = 100;
SampleFrequency = 2000;
emgdata = importdata([str,'.mat']);
[length,b]= size(emgdata);
emg = zeros(length,1);
N = (length-windowlength)/sliplength+1;
FilterFre = zeros(N,1);
for i = 1:N
    fre = frequencySearch(emgdata((1+sliplength*(i-1)):(windowlength+sliplength*(i-1))),SampleFrequency);
	emgdata((1+sliplength*(i-1)):(windowlength+sliplength*(i-1))) = mFilter(emgdata((1+sliplength*(i-1)):(windowlength+sliplength*(i-1))),fre,SampleFrequency);
    FilterFre(i) = fre;
end 

