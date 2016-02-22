function [ave confusion] = lda_classify( feature )
%���Է���������
%�����������trial����
[trialnum,classnum] = size(feature);
%ÿ������ÿ��trial�Ĵ���������������
[winnum,featurelen] = size(feature{1,1});
%��������Ϊ���룬һ����ѵ�����ݣ���һ������������
%ÿ�ද��ȫ����������һ��
hclasssample = winnum*trialnum/2;
feat1 = zeros(hclasssample*classnum,featurelen);
feat2 = zeros(hclasssample*classnum,featurelen);
for i = 1:classnum
    for j = 1:(trialnum/2)
        feat1((i-1)*hclasssample+(j-1)*winnum+1:(i-1)*hclasssample+j*winnum,:) = feature{j,i};
        feat2((i-1)*hclasssample+(j-1)*winnum+1:(i-1)*hclasssample+j*winnum,:) = feature{j+trialnum/2,i};
    end
end

%��ѵ����������ǩ
group = zeros(classnum*hclasssample,1);
for i = 1:classnum
    group((i-1)*hclasssample+1:i*hclasssample) = i;
end
%LDA����,���۽�����֤
class = classify(feat2,feat1,group);
%class2 = classify(feat1,feat2,group);
confusion = mconfusion(class,hclasssample,classnum);
%reco2 = reco_percentage(class2,hclasssample,classnum);
ave = maverage(confusion);
end