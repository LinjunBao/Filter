function Sum = Combine_Data(varargin)
Varargin_length = length(varargin);
%% baseline
Sum.baseline_FPA_unique = varargin{1}.baseline_FPA_unique;
for i=2:Varargin_length
    Sum.baseline_FPA_unique = cat(1, Sum.baseline_FPA_unique, varargin{i}.baseline_FPA_unique);
end
Sum.Mean_baseline_FPA = mean(Sum.baseline_FPA_unique);
Sum.Std_baseline_FPA  = std(Sum.baseline_FPA_unique);
Sum.length_baseline_FPA = length(Sum.baseline_FPA_unique);
Sum.SEM_baseline_FPA = Sum.Std_baseline_FPA/sqrt(Sum.length_baseline_FPA);
%% toe in
Sum.Toe_in_FPA_unique = varargin{1}.Toe_in_FPA_unique;
for i=2:Varargin_length
    Sum.Toe_in_FPA_unique = cat(1, Sum.Toe_in_FPA_unique, varargin{i}.Toe_in_FPA_unique);
end
Sum.Mean_Toe_in_FPA = mean(Sum.Toe_in_FPA_unique);
Sum.Std_Toe_in_FPA  = std(Sum.Toe_in_FPA_unique);
Sum.length_Toe_in_FPA = length(Sum.Toe_in_FPA_unique);
Sum.SEM_Toe_in_FPA = Sum.Std_Toe_in_FPA/sqrt(Sum.length_Toe_in_FPA);
%% toe out
Sum.Toe_out_FPA_unique = varargin{1}.Toe_out_FPA_unique;
for i=2:Varargin_length
    Sum.Toe_out_FPA_unique = cat(1, Sum.Toe_out_FPA_unique, varargin{i}.Toe_out_FPA_unique);
end
Sum.Mean_Toe_out_FPA = mean(Sum.Toe_out_FPA_unique);
Sum.Std_Toe_out_FPA  = std(Sum.Toe_out_FPA_unique);
Sum.length_Toe_out_FPA = length(Sum.Toe_out_FPA_unique);
Sum.SEM_Toe_out_FPA = Sum.Std_Toe_out_FPA/sqrt(Sum.length_Toe_out_FPA);