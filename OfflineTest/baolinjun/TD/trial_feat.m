function [ Got_feature ] = trial_feat(data)
%��ȡһ��������һ��trial��������
    [~,channel,winnum] = size(data);
%    featurelen = 10*channel;%10άTDAR��������
%     featurelen = 6*channel;%6άAR��������
     featurelen = 4*channel;%4άTD��������
    Got_feature = zeros(winnum,featurelen);
    for i = 1:winnum
        Got_emgfeature_td(i,:)=emg_feat_td(data(:,:,i));%4άTD��������
        Got_emgfeature_ar(i,:)=emg_feat_ar(data(:,:,i));%6άAR��������
        Got_emgfeature_tdar(i,:)=emg_feat_tdar(data(:,:,i));%10άTDAR��������

        Got_feature = [ Got_emgfeature_td ];%4άTD��������
%         Got_feature = [ Got_emgfeature_ar ];%6άAR��������
%        Got_feature = [ Got_emgfeature_tdar ];%10άTDAR��������

    end
end
