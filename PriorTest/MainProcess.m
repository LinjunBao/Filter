%step0 clear data
clear;
clc;

%step 1 read raw data
Sub1 = Read_Rawdata('1_2_nf',70,100,2000,20);
%Sub2 = Read_Rawdata('9',70,100,2000);

%step 2 deal with data
%Sum = Deal_With_Data(Sub1);

%plot data
[fetureSum,SNRsum] = Plot_Data(Sub1);