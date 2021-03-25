% Functia 'desenare' are rolul de a ilustra pe un grafic
% caracteristica filtrului definit de parametrii trimisi 
% drept argumente. 
% Aceasta va fi folosita de la faza3.b) incolo.
% Nu are niciun output.

function [outputArg1] = desenare(M,wcGasit,fereastraGasita,wp,ws,cerinta_delta_p,cerinta_delta_s,param)
wc=wcGasit/pi;
r=param; %80-100 
beta=param;  %0-10
alfa=param; %0-100
L=param; %0-3
switch fereastraGasita
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
 [H,om]=freqz(h);
    plot(om,abs(H));
    xline(wp,'--r',{'wp'});
    xline(ws,'--r',{'ws'});
    xline(wcGasit,'b',{'w_c'});
    yline(cerinta_delta_s,'--k',{'delta_s'});
    yline(1-cerinta_delta_p,'--k',{'delta_p'});
    yline(1+cerinta_delta_p,'--k',{'delta_p'});
    str = sprintf('M=%d, WIN=%s, W_c=%0.2f%s P=%f', M,fereastraGasita, wcGasit/pi,'\pi',param);
    title(str);
end

