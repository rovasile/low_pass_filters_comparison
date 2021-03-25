% Scriptul are rolul de a incerca combinatiile necesare de M, Wp, Ws,
% Parametru si fereastra pentru a gasi un filtru optim. Am incercat sa
% obtin unul care sa aiba ordinul m=20 si in configuratia actuala am
% reusit.

% Am marit M-ul maxim pentru cele 2 cazuri in care se testeaza felul in
% care reactioneaza cautatorul de filtre atunci cand Wc se apropie atat de
% 0, cat si de pi. Scopul era de a ajuta la o reprezentare a diferentei,
% chiar si in cazurile in care un filtru M<20 nu poate fi gasit.



clear;clc;
M=20;
M_orig=M;
delta_p=0.05;
delta_s=0.05;

w=0:0.01:pi;
for i=1:length(w)
   val(i)=H(w(i)); 
end


% In esenta pare a fi ul FTJ ideal cu wc=pi/2
subplot(3,1,2);
wc=0.5*pi;

abateri=ones(1,M);

mGasit=0;
fereastraGasita="";
wcGasit=0;
wsGasit=0;
wpGasit=0;

ferestre=["rectangular", "triangular", "blackman", "chebyshev", "hamming", "hanning", "kaiser", "lanczos", "tukey"];

for i=3:M
   M=i;
   if (mGasit==0)
        for procent=1:15
            for index=1:ferestre.size(2)
                for param=1:9
%                     wc=wp+(ws-wp)/100*procent;
                    wp=wc/100*(100-procent);
                    ws=wc/100*(100+procent);
                    [abatere,valid,parameter]=faza4_proiectare(M,wc,ferestre(index),wp,ws,delta_p,delta_s, param);
%                     param
                    if(abatere<abateri(M) && valid==1)
                        abateri(M)=abatere;
                        mGasit=M;
                        fereastraGasita=ferestre(index);
                        wcGasit=wc;
                        parameterGasit=parameter;
                        wpGasit=wp;
                        wsGasit=ws;
                    end
                end
            end
        end
   end
%    M
end


try
fprintf("Cel mai bun filtru gasit pentru delta_p=%0.4f, delta_s=%0.4f si wc=%0.4fPi este\n",delta_p,delta_s,wc/pi);
fprintf("M=%d, fereastra tip %s, cu wc=%0.2fPi\n",mGasit,fereastraGasita, wcGasit/pi);
fprintf("parameter=%f\n",parameterGasit);
fprintf("wpGasit=%0.2fPi   wsGasit=%0.2fPi\n\n",wpGasit/pi,wsGasit/pi);
hold on;
plot(w,val,'--b');
faza4_desenare(mGasit, wcGasit, fereastraGasita,wpGasit,wsGasit,delta_p,delta_s,parameterGasit);
catch
 fprintf("Filtrul nu a fost gasit. Incercati un M mai mare, o distanta intre wp si ws mai mare, tolerante mai mari.\n\n");
end

%%
% % % % % % % % % % % % % % % % % % % % % % % % GF 2 %%%%%%%%%%%%%%%%%%%
M=M*2;
subplot(3,1,1);
wc=0.3*pi;

abateri=ones(1,M);

mGasit=0;
fereastraGasita="";
wcGasit=0;
wsGasit=0;
wpGasit=0;

ferestre=["rectangular", "triangular", "blackman", "chebyshev", "hamming", "hanning", "kaiser", "lanczos", "tukey"];

for i=3:M
   M=i;
   if (mGasit==0)
        for procent=1:25
            for index=1:ferestre.size(2)
                for param=1:9
%                     wc=wp+(ws-wp)/100*procent;
                    wp=wc/100*(100-procent);
                    ws=wc/100*(100+procent);
                    [abatere,valid,parameter]=faza4_proiectare(M,wc,ferestre(index),wp,ws,delta_p,delta_s, param);
%                     param
                    if(abatere<abateri(M) && valid==1)
                        abateri(M)=abatere;
                        mGasit=M;
                        fereastraGasita=ferestre(index);
                        wcGasit=wc;
                        parameterGasit=parameter;
                        wpGasit=wp;
                        wsGasit=ws;
                    end
                end
            end
        end
   end
%    M
end


try
fprintf("Cel mai bun filtru gasit pentru delta_p=%0.4f, delta_s=%0.4f si wc=%0.4fPi este\n",delta_p,delta_s,wc/pi);
fprintf("M=%d, fereastra tip %s, cu wc=%0.2fPi\n",mGasit,fereastraGasita, wcGasit/pi);
fprintf("parameter=%f\n",parameterGasit);
fprintf("wpGasit=%0.2fPi   wsGasit=%0.2fPi\n\n",wpGasit/pi,wsGasit/pi);
hold on;
% plot(w,val,'--b');
faza4_desenare(mGasit, wcGasit, fereastraGasita,wpGasit,wsGasit,delta_p,delta_s,parameterGasit);
catch
 fprintf("Filtrul nu a fost gasit. Incercati un M mai mare, o distanta intre wp si ws mai mare, tolerante mai mari.\n\n");
end



% % % % % % % % % % % % % % % % % % % % % % % % GF 3 %%%%%%%%%%%%%%%%%%%


subplot(3,1,3);
wc=0.7*pi;

abateri=ones(1,M);

mGasit=0;
fereastraGasita="";
wcGasit=0;
wsGasit=0;
wpGasit=0;

ferestre=["rectangular", "triangular", "blackman", "chebyshev", "hamming", "hanning", "kaiser", "lanczos", "tukey"];

for i=3:M
   M=i;
   if (mGasit==0)
        for procent=1:11
            for index=1:ferestre.size(2)
                for param=1:9
%                     wc=wp+(ws-wp)/100*procent;
                    wp=wc/100*(100-procent);
                    ws=wc/100*(100+procent);
                    [abatere,valid,parameter]=faza4_proiectare(M,wc,ferestre(index),wp,ws,delta_p,delta_s, param);
%                     param
                    if(abatere<abateri(M) && valid==1)
                        abateri(M)=abatere;
                        mGasit=M;
                        fereastraGasita=ferestre(index);
                        wcGasit=wc;
                        parameterGasit=parameter;
                        wpGasit=wp;
                        wsGasit=ws;
                    end
                end
            end
        end
   end
%    M
end


try
fprintf("Cel mai bun filtru gasit pentru delta_p=%0.4f, delta_s=%0.4f si wc=%0.4fPi este\n",delta_p,delta_s,wc/pi);
fprintf("M=%d, fereastra tip %s, cu wc=%0.2fPi\n",mGasit,fereastraGasita, wcGasit/pi);
fprintf("parameter=%f\n",parameterGasit);
fprintf("wpGasit=%0.2fPi   wsGasit=%0.2fPi\n\n",wpGasit/pi,wsGasit/pi);
hold on;
% plot(w,val,'--b');
faza4_desenare(mGasit, wcGasit, fereastraGasita,wpGasit,wsGasit,delta_p,delta_s,parameterGasit);
catch
 fprintf("Filtrul nu a fost gasit. Incercati un M mai mare, o distanta intre wp si ws mai mare, tolerante mai mari.\n\n");
end


























function x = H(w)

if abs(w)<pi/2
    x=1;
else
    x=0;
end

end
