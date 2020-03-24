clear
close all
clc
[y,fs] =audioread('onsei_a_ikami.wav');
t = ((1:length(y))-1)/fs;
plot(t,y)
xlabel("ŠÔ(s)")
%soundsc(y,fs)
m = 3;
g = t + (m-1)*t.^2/2;
g = g(1:find(g>t(end),1));
mody = interp1(t,y,g);
spectrogram(y,hann(256),128,256,fs,'yaxis')
ylim([0 10])
