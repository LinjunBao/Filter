function Plot_Data(varargin)
Varargin_length = length(varargin);

%% Errorbar
FPA_Mean = [varargin{1}.Mean_baseline_FPA, varargin{1}.Mean_Toe_in_FPA, varargin{1}.Mean_Toe_out_FPA];
SEM_Mean = [varargin{1}.SEM_baseline_FPA, varargin{1}.SEM_Toe_in_FPA, varargin{1}.SEM_Toe_out_FPA];
errorbar(FPA_Mean,SEM_Mean,'k','LineStyle','none');
%% baseline
hold on;
for i = 1:Varargin_length-1
    plot(1+0.02*(i-(Varargin_length-1)/2-0.5),varargin{i+1}.baseline_FPA_unique,'.g','marKerSize',10);
end
%% toe in
hold on
for i = 1:Varargin_length-1
    plot(2+0.02*(i-(Varargin_length-1)/2-0.5),varargin{i+1}.Toe_in_FPA_unique,'.g','marKerSize',10);
end
hold on
plot([1.8,2.2],[-1,-1],'r-');
hold on
plot([1.8,2.2],[9,9],'r-');
%% teo out
hold on
for i = 1:Varargin_length-1
    plot(3+0.02*(i-(Varargin_length-1)/2-0.5),varargin{i+1}.Toe_out_FPA_unique,'.g','marKerSize',10);
end
hold on
plot([2.8,3.2],[-15,-15],'r-');
hold on
plot([2.8,3.2],[-5,-5],'r-');
axis([0 4 -20 14]); 