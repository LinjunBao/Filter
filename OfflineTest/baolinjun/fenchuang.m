clear all;
clc;
tic;
% 导入未分窗数据
trialnum = 10;
winemg = cell(1,trialnum);
% 窗时间
winlen = 300;
% 步进时间
steplen = 100;
class=11;
for j=1:class
    for i = 1:trialnum
        sumemg = importdata([num2str(i) '-' num2str(j) '.mat']);
        datalen = size(sumemg,1);
        % 每个trial每个动作的窗个数
        winnum = round((datalen-winlen+steplen)/steplen);
        %分割数据
        winemg{i} = divide(sumemg,winlen,winnum,steplen);
        DataSave{i,j}=winemg{i};
    end
    %保存
%     save(['postdata' '\win' num2str(j) '.mat'],'winemg');
end
save([ 'TD' '\' 'winemg.mat'],'DataSave');
toc;