function [ x ] = divide( xsum,winlength,samplenum,stepnum)
%�����ݷָ��һ������
channel = size(xsum,2);
x =zeros(winlength,channel,samplenum);
for i =1:samplenum
x(:,:,i) = xsum((i-1)*stepnum+1:(i-1)*stepnum+winlength,:);
end