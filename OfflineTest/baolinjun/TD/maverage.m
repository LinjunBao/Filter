function [ ave ] = maverage( recognition )
%��ƽ��ʶ����
    [r,~] = size(recognition);
    sum = 0;
    for i=1:r
        sum = sum+recognition(i,i);
    end
    ave = sum/r;
end