function Sum = Deal_With_Data(varargin)
Varargin_length = length(varargin);
Sum = varargin;
%%split data
% Sum.fullrawdata = varargin{1}.fullrawdata;	
% for i=2:Varargin_length
%     Sum.fullrawdata = cat(1, Sum.fullrawdata, varargin{i}.fullrawdata);
% end