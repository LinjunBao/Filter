function [ emg_feat_tdar ] = mFeture(data,winlen,steplen)
datalen = size(data);
winnum = round((datalen-winlen+steplen)/steplen);
%channel = 1;
x =zeros(winlen,winnum);
for i =1:winnum
    x(:,i) = data((i-1)*steplen+1:(i-1)*steplen+winlen);
end


delta=0.000004;
MAV_x = zeros(winnum,1);
ZC_x = zeros(winnum,1);
SSC_x =zeros(winnum,1);
WL_x = zeros(winnum,1);

for i = 1:winnum
    MAV_x(i) = mean(abs(x(:,i)));
    ZC_x(i) = 0;
    SSC_x(i) = 0;
    WL_x(i) = 0;
    for j = 1:length(x(:,i))-1
        if ((x(j,i) > 0 && x(j+1,i) < 0) || (x(j,i) < 0 && x(j+1,i) > 0)) && (abs(x(j,i)-x(j+1,i)) >= delta)
            ZC_x(i) = ZC_x(i)+1;
        end
        WL_x(i) = WL_x(i) + abs(x(j+1,i)-x(j,i));
    end

    for k = 2:length(x(:,i))-1
        if ((x(k,i) > x(k-1,i) && x(k,i) > x(k+1,i)) || (x(k,i) < x(k-1,i) && x(k,i) < x(k+1,i))) && (abs(x(k,i)-x(k-1,i)) >= delta || abs(x(k,i)-x(k+1,i)) >= delta)
            SSC_x(i) = SSC_x(i)+1;
        end
    end
end
feature_tds = [MAV_x ZC_x SSC_x WL_x];

%一个窗(window)的肌电信号特征
% Burg算法
aror=6;
arcoff = zeros(aror,winnum);
for i=1:winnum
    temp = arburg(x(:,i),aror);
    arcoff(:,i) = temp(2:end);
    %[~,arcoff(:,i)] = arfit(x(:,i),aror,aror);
end
%arcoef = reshape(arcoff,aror*winnum,1);
feature_ar = arcoff';
emg_feat_tdar=[feature_tds feature_ar];