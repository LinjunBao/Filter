clear all;
clc;
tic;
Trail_Num =13;

for j=1:Trail_Num

        emgorigin = importdata([num2str(j),'.txt']);
        emgorigindata = emgorigin.data;
        [emgsamples,emgchannels] = size(emgorigindata);
        %emgchannels = emgchannels/8;
        emgchannels = emgchannels-1;
        emg=[];
        for i = 1:emgchannels
            emg(:,i) = [emgorigindata(10001:20000,1*(i-1)+2);emgorigindata(30001:40000,1*(i-1)+2);emgorigindata(50001:70000,1*(i-1)+2)];
        end
        save([num2str(j),'.mat'],'emg');
end
toc;