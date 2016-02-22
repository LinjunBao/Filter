function [ emg_feat_ar ] = emg_feat_ar( x,aror )
%一个窗(window)的肌电信号特征
% Burg算法
aror=6;
[~,cnum] = size(x);
arcoff = zeros(aror,cnum);
for i=1:cnum
    temp = arburg(x(:,i),aror);
    arcoff(:,i) = temp(2:end);
    %[~,arcoff(:,i)] = arfit(x(:,i),aror,aror);
end
arcoef = reshape(arcoff,aror*cnum,1);
emg_feat_ar = arcoef';
end