clear all;
clc;
tic;
%��������
data = importdata([ 'winemg.mat']);
%������������ܵ�trial����
[trialnum,classnum] = size(data);
%��������������ȡ
feature = cell(trialnum,classnum);
for i =1:trialnum
    for j = 1:classnum
        feature{i,j} = trial_feat(data{i,j});
    end
end
[ave,confusion] = lda_classify(feature);
toc;