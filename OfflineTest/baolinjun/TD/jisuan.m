clear all;
clc;
tic;
%导入数据
data = importdata([ 'winemg.mat']);
%动作类别数和总的trial个数
[trialnum,classnum] = size(data);
%所有数据特征提取
feature = cell(trialnum,classnum);
for i =1:trialnum
    for j = 1:classnum
        feature{i,j} = trial_feat(data{i,j});
    end
end
[ave,confusion] = lda_classify(feature);
toc;