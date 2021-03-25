% script-ul are rolul de a desena raspunsurile caracteristice ferestrelor
% si de a ilustra ulterior comportamentul in frecventa


M=16;%16
r=90; %80-100 
beta=5;  %0-10
alfa=50; %0-100
L=2; %0-3

subplot(3,3,1);
w1=boxcar(M);
stem(w1);
title("rectangular");

subplot(3,3,2);
w2=triang(M);
stem(w2);
title("triangular");

subplot(3,3,3);
w3=blackman(M);
stem(w3);
title("blackman");

subplot(3,3,4);
w4=chebwin(M,r);
stem(w4);
title("chebyshev");

subplot(3,3,5);
w5=hamming(M);
stem(w5);
title("hamming");

subplot(3,3,6);
w6=hanning(M);
stem(w6);
title("hanning");

subplot(3,3,7);
w7=kaiser(M, beta);
stem(w7);
title("kaiser");

subplot(3,3,8);
w8=lanczos(M,L);
stem(w8);
title("lanczos");


subplot(3,3,9);
w9=tukeywin(M,alfa);
stem(w9);
title("tukey");

figure();   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r=80;
subplot(4,3,1);
w4=chebwin(M,r);
stem(w4);
title("chebyshev r=80");

r=90;
subplot(4,3,2);
w4=chebwin(M,r);
stem(w4);
title("chebyshev r=90");

r=100;
subplot(4,3,3);
w4=chebwin(M,r);
stem(w4);
title("chebyshev r=100");


beta=1;
subplot(4,3,4);
w7=kaiser(M, beta);
stem(w7);
title("kaiser beta=1");

beta=5;
subplot(4,3,5);
w7=kaiser(M, beta);
stem(w7);
title("kaiser beta=5");

beta=10;
subplot(4,3,6);
w7=kaiser(M, beta);
stem(w7);
title("kaiser beta=10");



L=1;
subplot(4,3,7);
w8=lanczos(M,L);
stem(w8);
title("lanczos L=1");

L=2;
subplot(4,3,8);
w8=lanczos(M,L);
stem(w8);
title("lanczos L=2");

L=3;
subplot(4,3,9);
w8=lanczos(M,L);
stem(w8);
title("lanczos L=3");


alfa=10;
subplot(4,3,10);
w9=tukeywin(M,alfa);
stem(w9);
title("tukey alfa=10");

alfa=50;
subplot(4,3,11);
w9=tukeywin(M,alfa);
stem(w9);
title("tukey alfa=50");

alfa=100;
subplot(4,3,12);
w9=tukeywin(M,alfa);
stem(w9);
title("tukey alfa=100");

% % % % % % % % % % % % punctul% b)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
figure();
M=16;
r=90; %80-100 
beta=5;  %0-10
alfa=50; %0-100
L=2; %0-3

subplot(3,3,1);
w1=boxcar(M);
w1=w1/sum(w1);
[W,om]=freqz(w1);
plot(om,mag2db(abs(W)));
title("rectangular");

subplot(3,3,2);
w2=triang(M);
w2=w2/sum(w2);
[W,om]=freqz(w2);
plot(om,mag2db(abs(W)));
title("triangular");

subplot(3,3,3);
w3=blackman(M);
w3=w3/sum(w3);
[W,om]=freqz(w3);
plot(om,mag2db(abs(W)));
title("blackman");

subplot(3,3,4);
w4=chebwin(M,r);
w4=w4/sum(w4);
[W,om]=freqz(w4);
plot(om,mag2db(abs(W)));
title("chebyshev");

subplot(3,3,5);
w5=hamming(M);
w5=w5/sum(w5);
[W,om]=freqz(w5);
plot(om,mag2db(abs(W)));
title("hamming");

subplot(3,3,6);
w6=hanning(M);
w6=w6/sum(w6);
[W,om]=freqz(w6);
plot(om,mag2db(abs(W)));
title("hanning");

subplot(3,3,7);
w7=kaiser(M, beta);
w7=w7/sum(w7);
[W,om]=freqz(w7);
plot(om,mag2db(abs(W)));
title("kaiser");

subplot(3,3,8);
w8=lanczos(M,L);
w8=w8/sum(w8);
[W,om]=freqz(w8);
plot(om,mag2db(abs(W)));
title("lanczos");


subplot(3,3,9);
w9=tukeywin(M,alfa);
w9=w9/sum(w9);
[W,om]=freqz(w9);
plot(om,mag2db(abs(W)));
title("tukey");






figure();   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r=80;
subplot(4,3,1);
w4=chebwin(M,r);
w4=w4/sum(w4);
[W,om]=freqz(w4);
plot(om,mag2db(abs(W)));
title("chebyshev r=80");

r=90;
subplot(4,3,2);
w4=chebwin(M,r);
w4=w4/sum(w4);
[W,om]=freqz(w4);
plot(om,mag2db(abs(W)));
title("chebyshev r=90");

r=100;
subplot(4,3,3);
w4=chebwin(M,r);
w4=w4/sum(w4);
[W,om]=freqz(w4);
plot(om,mag2db(abs(W)));
title("chebyshev r=100");


beta=1;
subplot(4,3,4);
w7=kaiser(M, beta);
w7=w7/sum(w7);
[W,om]=freqz(w7);
plot(om,mag2db(abs(W)));
title("kaiser beta=1");

beta=5;
subplot(4,3,5);
w7=kaiser(M, beta);
w7=w7/sum(w7);
[W,om]=freqz(w7);
plot(om,mag2db(abs(W)));
title("kaiser beta=5");

beta=10;
subplot(4,3,6);
w7=kaiser(M, beta);
w7=w7/sum(w7);
[W,om]=freqz(w7);
plot(om,mag2db(abs(W)));
title("kaiser beta=10");



L=1;
subplot(4,3,7);
w8=lanczos(M,L);
w8=w8/sum(w8);
[W,om]=freqz(w8);
plot(om,mag2db(abs(W)));
title("lanczos L=1");

L=2;
subplot(4,3,8);
w8=lanczos(M,L);
w8=w8/sum(w8);
[W,om]=freqz(w8);
plot(om,mag2db(abs(W)));
title("lanczos L=2");

L=3;
subplot(4,3,9);
w8=lanczos(M,L);
w8=w8/sum(w8);
[W,om]=freqz(w8);
plot(om,mag2db(abs(W)));
title("lanczos L=3");


alfa=10;
subplot(4,3,10);
w9=tukeywin(M,alfa);
w9=w9/sum(w9);
[W,om]=freqz(w9);
plot(om,mag2db(abs(W)));
title("tukey alfa=10");

alfa=50;
subplot(4,3,11);
w9=tukeywin(M,alfa);
w9=w9/sum(w9);
[W,om]=freqz(w9);
plot(om,mag2db(abs(W)));
title("tukey alfa=50");

alfa=100;
subplot(4,3,12);
w9=tukeywin(M,alfa);
w9=w9/sum(w9);
[W,om]=freqz(w9);
plot(om,mag2db(abs(W)));
title("tukey alfa=100");








%pentru M=16 rezultatele in frecventa nu sunt prea clare, deci voi creste M
%pentru a obtine rezultate mai vizibile

%pentru M=50 se observa proprietatea cum ca dupa un varf ascutit, urmeaza
%lobi mai pronuntati, spre deosebire de lobii unui varf mai lat

% clasamentul pe baza rezultatelor obtinute ar fi:
% 1 kaiser
% 2 lanczos
% 3 hamming
% 4 hanning
% 5 tukey
% 6 blackman
% 7 rectangular
% 8 chebyshev
% 9 triangular

