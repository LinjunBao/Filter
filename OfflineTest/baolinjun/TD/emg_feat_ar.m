function [ emg_feat_ar ] = emg_feat_ar( x,aror )
%һ����(window)�ļ����ź�����
% Burg�㷨
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