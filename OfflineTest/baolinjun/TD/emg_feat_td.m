function [ emg_feat_td ] = emg_feat_td( x )
% 一个窗的Hudgins 时域特征
    delta=0.000004;
    [~,cnum] = size(x);
    MAV_x = zeros(1,cnum);
    ZC_x = zeros(1,cnum);
    SSC_x = zeros(1,cnum);
    WL_x = zeros(1,cnum);
    for i = 1:cnum
    MAV_x(i) = mean(abs(x(:,i)));
    ZC_x(i) = 0;
    SSC_x(i) = 0;
    WL_x(i) = 0;
    for j = 1:length(x(:,i))-1
        if ((x(j,i) > 0 && x(j+1,i) < 0) || (x(j,i) < 0 && x(j+1,i) > 0)) && (abs(x(j,i)-x(j+1,i)) >= delta)
            ZC_x(i) = ZC_x(i)+1;
        end
        WL_x(i) = WL_x(i) + abs(x(j+1,i)-x(j,i));
    end
    
    for k = 2:length(x(:,i))-1
        if ((x(k,i) > x(k-1,i) && x(k,i) > x(k+1,i)) || (x(k,i) < x(k-1,i) && x(k,i) < x(k+1,i))) && (abs(x(k,i)-x(k-1,i)) >= delta || abs(x(k,i)-x(k+1,i)) >= delta)
            SSC_x(i) = SSC_x(i)+1;
        end
    end
    end
    
    emg_feat_td = [MAV_x ZC_x SSC_x WL_x];
    
end