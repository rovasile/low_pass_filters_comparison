% rolul scriptului este doar de a testa functionalitatea rutinei "abateri"
clear;clc;
wp=0.3*pi;
ws=0.5*pi;
wc=0.4*pi;
M=128;
beta=5;
w=kaiser(M, beta);
h=fir1(M-1,wc/pi,w);
[a,b]=abateri(h,wp,ws);
a
b
% [H,om]=freqz(h);
