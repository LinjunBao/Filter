clear all;
clc;
tic;
% ����δ�ִ�����
trialnum = 10;
winemg = cell(1,trialnum);
% ��ʱ��
winlen = 300;
% ����ʱ��
steplen = 100;
class=11;
for j=1:class
    for i = 1:trialnum
        sumemg = importdata([num2str(i) '-' num2str(j) '.mat']);
        datalen = size(sumemg,1);
        % ÿ��trialÿ�������Ĵ�����
        winnum = round((datalen-winlen+steplen)/steplen);
        %�ָ�����
        winemg{i} = divide(sumemg,winlen,winnum,steplen);
        DataSave{i,j}=winemg{i};
    end
    %����
%     save(['postdata' '\win' num2str(j) '.mat'],'winemg');
end
save([ 'TD' '\' 'winemg.mat'],'DataSave');
toc;