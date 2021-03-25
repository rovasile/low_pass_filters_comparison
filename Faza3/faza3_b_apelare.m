% scriptul are rolul de a facilita apelrile catre functia
% faza3_b_intermediat, astfel incat, dupa ce se indeplineste prima cerinta,
% cea legata de gasirea ordinului minim pentru fereastra selectata, se va
% trece la gasirea ordinelor minime si pentru celelalte ferestre pentru a
% putea compara rezultatele.

clear;clc;
M=20;
wc=0.4*pi;
ferestre=["rectangular", "triangular", "blackman", ...
          "chebyshev", "hamming", "hanning", ...
          "kaiser", "lanczos", "tukey"];
fereastra="lanczos";
[mGasit, wcGasit] = faza3_b_intermediar(M,wc,fereastra);

figure();
for i=1:ferestre.size(2)
    subplot(3,3,i);
    [mGasit, wcGasit] = faza3_b_intermediar(M,wc,ferestre(i));
    
end