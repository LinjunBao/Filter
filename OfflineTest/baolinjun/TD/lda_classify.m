function [ave confusion] = lda_classify( feature )
%线性分类器分类
%动作类别数和trial个数
[trialnum,classnum] = size(feature);
%每个动作每个trial的窗个数和特征长度
[winnum,featurelen] = size(feature{1,1});
%将特征分为两半，一半做训练数据，另一半做测试数据
%每类动作全部样本数的一半
hclasssample = winnum*trialnum/2;
feat1 = zeros(hclasssample*classnum,featurelen);
feat2 = zeros(hclasssample*classnum,featurelen);
for i = 1:classnum
    for j = 1:(trialnum/2)
        feat1((i-1)*hclasssample+(j-1)*winnum+1:(i-1)*hclasssample+j*winnum,:) = feature{j,i};
        feat2((i-1)*hclasssample+(j-1)*winnum+1:(i-1)*hclasssample+j*winnum,:) = feature{j+trialnum/2,i};
    end
end

%给训练数据贴标签
group = zeros(classnum*hclasssample,1);
for i = 1:classnum
    group((i-1)*hclasssample+1:i*hclasssample) = i;
end
%LDA分类,两折交叉验证
class = classify(feat2,feat1,group);
%class2 = classify(feat1,feat2,group);
confusion = mconfusion(class,hclasssample,classnum);
%reco2 = reco_percentage(class2,hclasssample,classnum);
ave = maverage(confusion);
end