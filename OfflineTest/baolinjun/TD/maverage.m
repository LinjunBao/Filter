function [ ave ] = maverage( recognition )
%求平均识别率
    [r,~] = size(recognition);
    sum = 0;
    for i=1:r
        sum = sum+recognition(i,i);
    end
    ave = sum/r;
end