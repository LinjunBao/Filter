function SNR = mSNR(data,datalength)
SNR1 = 0;
SNR2 =0;
length = datalength;
for i = 1:length/2
    SNR1 = SNR1+data(i)*data(i);
    SNR2 = SNR2+data(i+length/2)*data(i+length/2);
end
SNR = 20*log10(SNR1/SNR2);
    