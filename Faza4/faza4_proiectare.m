% Functia returneaza abaterile filtrului si daca este valid sau nu
% in functie parametrii cu care se apeleaza functia
% este asemanatoare cu functia "proiectare", insa are ca diferenta
% faptul ca aceasta returneaza abaterile pentru a putea gasi filtrul
% cel mai bun


function [abaterile, valid, parameter] = faza4_proiectare(M,wc,fereastra,wp,ws,cerinta_delta_p,cerinta_delta_s,param)

% r=85; %80-100 
% beta=2;  %0-10
% alfa=35; %0-100
% L=1; %0-3
r=80+20/1000*param;
beta=1+9/1000*param;
alfa=1/1000*param;
L=1+2/1000*param;
parameter=0;



orig_wc=wc;
wc=wc/pi;
valid=0;
switch fereastra
    case 'rectangular' 
                        w=boxcar(M);
                        h=fir1(M-1,wc,w);
    case 'triangular'
                        w=triang(M);
                        h=fir1(M-1,wc,w);
    case 'blackman'
                        w=blackman(M);
                        h=fir1(M-1,wc,w);
    case 'chebyshev'
                        w=chebwin(M,r);
                        h=fir1(M-1,wc,w);
    case 'hamming'
                        w=hamming(M);
                        h=fir1(M-1,wc,w);
    case 'hanning'
                        w=hanning(M);
                        h=fir1(M-1,wc,w);
    case 'kaiser'
                        w=kaiser(M,beta);
                        h=fir1(M-1,wc,w);
    case 'lanczos'
                        w=lanczos(M,L);
                        h=fir1(M-1,wc,w);
    case 'tukey'
                        w=tukeywin(M,alfa);
                        h=fir1(M-1,wc,w);
                        
end

    switch fereastra
        case 'chebyshev'
                            parameter=r;
        case 'kaiser'
                            parameter=beta;
        case 'lanczos'
                            parameter=L;
        case 'tukey'
                            parameter=alfa;
    end
[delta_p, delta_s] = abateri(h,wp,ws);
if(delta_p<cerinta_delta_p && delta_s<cerinta_delta_s)
    valid=1;


end
abaterile=delta_p+delta_s;

end

