function [ b,a ] = mycomb( frequency )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Fs = 2000;
Fo = frequency;  % Sampling Frequency

N     =floor( Fs/Fo);  % Order
BW    = 1;  % Bandwidth
Apass = 10;   % Bandwidth Attenuation
q = 35;

BW = (Fo/(Fs/2))/q;
[b, a] = iircomb(N, BW, Apass);

end
