% script-ul are rolul de a construi filtre pe baza ferestrelor pentru a
% ilustra difrentele dintre acestea. De asemenea, se urmareste schimbarea
% parametrilor pentru a observa felul in care reactioneaza filtrele
% respeective.

clc;clear;
M=16;
r=90; %80-100 
beta=5;  %0-10
alfa=50; %0-100
L=2; %0-3
om_c=0.4;

subplot(3,3,1);
w1=boxcar(M);
h=fir1(M-1,om_c,w1);
[H,om]=freqz(h);
plot(om,abs(H));
title("rectangular");

subplot(3,3,2);
w2=triang(M);
h=fir1(M-1,om_c,w2);
[H,om]=freqz(h);
plot(om,abs(H));
title("triangular");

subplot(3,3,3);
w3=blackman(M);
h=fir1(M-1,om_c,w3);
[H,om]=freqz(h);
plot(om,abs(H));
title("blackman");

subplot(3,3,4);
w4=chebwin(M,r);
h=fir1(M-1,om_c,w4);
[H,om]=freqz(h);
plot(om,abs(H));
title("chebyshev");

subplot(3,3,5);
w5=hamming(M);
h=fir1(M-1,om_c,w5);
[H,om]=freqz(h);
plot(om,abs(H));
title("hamming");

subplot(3,3,6);
w6=hanning(M);
h=fir1(M-1,om_c,w6);
[H,om]=freqz(h);
plot(om,abs(H));
title("hanning");

subplot(3,3,7);
w7=kaiser(M, beta);
h=fir1(M-1,om_c,w7);
[H,om]=freqz(h);
plot(om,abs(H));
title("kaiser");

subplot(3,3,8);
w8=lanczos(M,L);
h=fir1(M-1,om_c,w8);
[H,om]=freqz(h);
plot(om,abs(H));
title("lanczos");


subplot(3,3,9);
w9=tukeywin(M,alfa);
h=fir1(M-1,om_c,w9);
[H,om]=freqz(h);
plot(om,abs(H));
title("tukey");

% conform cerintei, se observa ca raspunsurile cu atenuarea mare, au benzi
% de tranzitie largi. Exemplul cel mai extrem in acest caz este vizibil la
% fereastra Rectangular unde scaderea este extrem de rapida, dar se
% identifica apoi lobi.

% La fereastra triangular, atenuarea este relativ rapida, dar nivelul la
% care se ajunge este aproximativ 5% din intensitate, care urmeaza sa scada
% lent. Deci scaderea a fost brusca, dar pana sa ajunga la 0 va dura mai
% mult.

%%
% % % % % % % % % punctul b) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure();
% am ales fereastra blackman:

M=16;
om_c=0.4;

subplot(4,1,1);
w3=blackman(M);
h=fir1(M-1,om_c,w3);
[H,om]=freqz(h);
plot(om,mag2db(abs(H)));
title("blackman M=16");

M=24;
subplot(4,1,2);
w3=blackman(M);
h=fir1(M-1,om_c,w3);
[H,om]=freqz(h);
plot(om,mag2db(abs(H)));
title("blackman M=24");

M=32;
subplot(4,1,3);
w3=blackman(M);
h=fir1(M-1,om_c,w3);
[H,om]=freqz(h);
plot(om,mag2db(abs(H)));
title("blackman M=32");

M=64;
subplot(4,1,4);
w3=blackman(M);
h=fir1(M-1,om_c,w3);
[H,om]=freqz(h);
plot(om,mag2db(abs(H)));
title("blackman M=64");
%Se observa ca odata cu cresterea ordinului, filtrul devine din ce in ce
%mai eficient, descresterea in intensitate fiind din ce in ce mai agresiva
