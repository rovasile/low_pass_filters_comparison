% are rolul de a realiza filtrul obtinut in urma 
% parametrilor (M, wc, fereastra) si de a verifica daca
%  este unul valid sau nu. Va returna 1 in cazul in 
% care filtrul este valid si 0 in caz contrar. 

function [result] = proiectare(M,wc,fereastra)

r=85; %80-100 
beta=2;  %0-10
alfa=35; %0-100
L=1; %0-3
orig_wc=wc;
wc=wc/pi;
result=0;

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

wp=0.3*pi;
ws=0.5*pi;
cerinta_delta_p=0.05;
cerinta_delta_s=0.05;

[delta_p, delta_s] = abateri(h,wp,ws);

if(delta_p<cerinta_delta_p && delta_s<cerinta_delta_s)
%     fprintf("dp=%f ds=%f\n",delta_p, delta_s);
    fprintf("Filtru gasit pentru M=%d.\n",M);
%     [H,om]=freqz(h);
%     plot(om,abs(H));
%     xline(wp,'--r',{'wp'});
%     xline(ws,'--r',{'ws'});
%     xline(orig_wc,'b',{'w_c'});
%     yline(cerinta_delta_s,'--k',{'delta_s'});
%     yline(1-cerinta_delta_p,'--k',{'delta_p'});
%     yline(1+cerinta_delta_p,'--k',{'delta_p'});
%     str = sprintf('M=%d, WIN=%s, W_c=%0.2f%s', M,fereastra, orig_wc/pi,'\pi');
%     title(str);
    result=1;
end

end

