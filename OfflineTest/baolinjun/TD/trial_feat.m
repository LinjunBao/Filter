function [ Got_feature ] = trial_feat(data)
%获取一个动作类一个trial的特征集
    [~,channel,winnum] = size(data);
%    featurelen = 10*channel;%10维TDAR肌电特征
%     featurelen = 6*channel;%6维AR肌电特征
     featurelen = 4*channel;%4维TD肌电特征
    Got_feature = zeros(winnum,featurelen);
    for i = 1:winnum
        Got_emgfeature_td(i,:)=emg_feat_td(data(:,:,i));%4维TD肌电特征
        Got_emgfeature_ar(i,:)=emg_feat_ar(data(:,:,i));%6维AR肌电特征
        Got_emgfeature_tdar(i,:)=emg_feat_tdar(data(:,:,i));%10维TDAR肌电特征

        Got_feature = [ Got_emgfeature_td ];%4维TD肌电特征
%         Got_feature = [ Got_emgfeature_ar ];%6维AR肌电特征
%        Got_feature = [ Got_emgfeature_tdar ];%10维TDAR肌电特征

    end
end
