function oData=mFilter(iData,iFrequency,SampleFrequency)
%1 20~450 Filter
bandpasshigh =450;%!!!attention for plot
bandpasslow = 20;
filterData = iData;
% hd = design(fdesign.bandpass('N,F3dB1,F3dB2',6,bandpasslow,bandpasshigh,SampleFrequency),'kaiserwin');
% filterData = filter(hd,filterData);


% d = (fdesign.lowpass('Fp,Fst,Ap,Ast',(bandpasshigh-50)/SampleFrequency,bandpasshigh/SampleFrequency,1,20));
% hd= design(d,'cheby1');
[z,p,k] = cheby2(6,20,[2*bandpasslow/SampleFrequency 2*bandpasshigh/SampleFrequency]);
[B,A]=zp2tf(z,p,k) ;
% [B,A] = cheby2(6,20,2*bandpasshigh/SampleFrequency,'low');
filterData = filtfilt(B,A,filterData);
%filterData = filter(B,A,filterData);

%2 comb filter
% combOrder = floor(SampleFrequency/iFrequency);
% d = fdesign.comb('notch','L,BW,GBW,Nsh',combOrder,10,-10,4,SampleFrequency);
% Hd=design(d);
% filterData = filter(Hd,filterData);

notchFrequency = 0;
 i=0;
while notchFrequency<2*pi*bandpasshigh/SampleFrequency;
    i= i+1;
    w= 2*pi*iFrequency*i/SampleFrequency;
    notchFrequency = w;
    BW = iFrequency*0.2;
%     dw = 2*pi*BW/SampleFrequency;
%     r= 1-dw/(2*sqrt(1+sqrt(2)));
    
    dw = 2*BW*pi/SampleFrequency;
    r= 1-dw/2;
    A = [1 -2*r*cos(w) r*r];
%     B=[1 -2*cos(w) 1]*1/4*(1+r*2-2*r*cos(w))/(cos(w/2)*cos(w/2));
    B=[1 -2*cos(w) 1];
    filterData = filtfilt(B,A,filterData);
end 

%  while notchFrequency<2*bandpasshigh/SampleFrequency;
%     i= i+1;
%     w= 2*iFrequency*i/SampleFrequency;
%     notchFrequency = w;
%     Q = 20;
%     BW = w/Q;
%     [B,A] = iirnotch(w,BW);
%     filterData = filtfilt(B,A,filterData);
%   end  

%2 or bandstop filter
% bandstopFrequency = 0;
% i=0;
% cut = 6;
% %coefficient = 1.2;
% 
% while bandstopFrequency<bandpasshigh
%     i=i+1;
%     bandstopFrequency = i* iFrequency;
%     hd = design(fdesign.bandstop('N,F3dB1,F3dB2',6,bandstopFrequency-cut,bandstopFrequency+cut,SampleFrequency));
%     filterData = filter(hd,filterData);
% 
% end 

%? blocking 
%filterData = stageblock(filterData,3,20,5);

%output
oData = filterData;