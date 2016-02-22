figure(3);
subplot(2,1,1)
[samples,temp]=size(EMGfilter1);
plot(EMGfilter0(1:samples,1),'DisplayName','EMGfilter0(1:61000,1)','YDataSource','EMGfilter0(1:61000,1)');
subplot(2,1,2)
plot(EMGfilter1(1:samples,1),'DisplayName','EMGfilter1(1:61000,1)','YDataSource','EMGfilter1(1:61000,1)');
