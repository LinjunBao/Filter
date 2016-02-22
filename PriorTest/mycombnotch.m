function Hd = mycombnotch
%MYCOMBNOTCH Returns a discrete-time filter object.

%
% MATLAB Code
% Generated by MATLAB(R) 7.11 and the Signal Processing Toolbox 6.14.
%
% Generated on: 30-Dec-2015 16:33:03
%

% IIR Comb Notching filter designed using the IIRCOMB function.

% All frequency values are in Hz.
Fs = 2000;  % Sampling Frequency

N     = 28;   % Order
BW    = 980;  % Bandwidth
Apass = 4;   % Bandwidth Attenuation

[b, a] = iircomb(N, BW/(Fs/2), Apass);
Hd     = dfilt.df2(b, a);

% [EOF]