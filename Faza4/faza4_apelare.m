% Scriptul are rolul de a incerca combinatiile necesare de M, Wc,
% Parametru si fereastra pentru a gasi un filtru optim. 

% Dupa obtinerea filtrului cel mai bun, procedura se va relua, fixand pe
% rand cate o fereastra, pentru a obtine cel mai bun rezultat pentru
% fiecare fereastra in parte.


clear; clc;
M=200;
M_orig=M;
abateri=ones(1,M);
wp=0.3*pi;
ws=0.5*pi;
delta_p=0.05;
delta_s=0.05;
mGasit=0;
fereastraGasita="";
wcGasit=0;


ferestre=["rectangular", "triangular", "blackman", "chebyshev", "hamming", "hanning", "kaiser", "lanczos", "tukey"];

for i=3:M
   M=i;
   if (mGasit==0)
        for procent=45:55
            for index=7
                for param=1:333
                    wc=wp+(ws-wp)/100*procent;
                    [abatere,valid,parameter]=faza4_proiectare(M,wc,ferestre(index),wp,ws,delta_p,delta_s, param);
%                     param
                    if(abatere<abateri(M) && valid==1)
                        abateri(M)=abatere;
                        mGasit=M;
                        fereastraGasita=ferestre(index);
                        wcGasit=wc;
                        parameterGasit=parameter;
                    end
                end
            end
        end
   end
%    M
end

fprintf("Cel mai bun filtru gasit pentru wp=%0.2fPi, ws=%0.2fPi, delta_p=%0.4f, delta_s=%0.4f este\n",wp/pi,ws/pi,delta_p,delta_s);
fprintf("M=%d, fereastra tip %s, cu wc=%0.2fPi\n",mGasit,fereastraGasita, wcGasit/pi);
fprintf("parameter=%f\n",parameterGasit);


faza4_desenare(mGasit, wcGasit, fereastraGasita,wp,ws,delta_p,delta_s,parameterGasit);
%%
%{
parameter=0;
parameterGasit=0;

abateri=ones(1,M);
figure();
nr_fereastra=1;

while nr_fereastra<10
M=M_orig;
mGasit=0;
wcGasit=0;
    for i=3:M
       M=i;
       if (mGasit==0)
            for procent=40:60
                for param=1:9
                    wc=wp+(ws-wp)/100*procent;
                    [abatere,valid,parameter]=faza4_proiectare(M,wc,ferestre(nr_fereastra),wp,ws,delta_p,delta_s,param);
                    if(abatere<abateri(M) && valid==1)
                        abateri(M)=abatere;
                        mGasit=M;
                        fereastraGasita=ferestre(nr_fereastra);
                        wcGasit=wc;
                        parameterGasit=parameter;
                    end
                end
            end
       end
    end
    
    
    subplot(3,3,nr_fereastra);
    try
    faza4_desenare(mGasit, wcGasit, fereastraGasita,wp,ws,delta_p,delta_s,parameterGasit);
    catch Me
    end
    
    abateri=ones(1,M);
    nr_fereastra=nr_fereastra+1;
end
%}
