% Functia se ocupa cu analizarea 	rezultatelor obtinute 
% din functia proiectare. Functia proiectare returneaza
% 1 in cazul in 	care combinatia de ordin,frecventa 
% de taiere si fereastra duce la obtinerea unui filtru 
% care se incadreaza in abaterile specificate in cerinta.   

% Aceasta functie se ocupa de asemenea de tratarea situatiilor
% in care se poate gasi un M mai mic decat cel specificat 
% si a situatiilor in care M nu este destul de mare.

% Returneaza ordinul filtrului optim gasit si frecventa de taiere
% punand prioritate pe identificare ordinului minim


function [mGasit, wcGasit] = faza3_b_intermediar(M,wc,fereastra)

wp=0.3*pi;
ws=0.5*pi;
delta_p=0.05;
delta_s=0.05;

wc_orig=wc;

rezultat=0;
passes=0;
while(passes<4 && rezultat~=1)

    for i=2:M 
        if(rezultat~=1)
           rezultat = proiectare(i,wc,fereastra); 
            if (rezultat==1)
                mGasit=i;
                wcGasit=wc;
            end
        end
    end

    if (rezultat~=1)
        fprintf("Nu s-a putut gasi. Se mareste ordinul si se repeta procedura.\n"); 
        M=M*2;
        for i=M/2:M 
            if(rezultat~=1)
               rezultat = proiectare(i,wc,fereastra); 
                if (rezultat==1)
                    mGasit=i;
                    wcGasit=wc;
                end
            end
        end

    end

    if (rezultat~=1)
        fprintf("Nu s-a putut gasi. Se mareste ordinul si se repeta procedura, din nou.\n"); 
        M=M*2;
        for i=M/2:M 
            if(rezultat~=1)
               rezultat = proiectare(i,wc,fereastra); 
                if (rezultat==1)
                    mGasit=i;
                    wcGasit=wc;
                end
            end
        end

    end
    
    if (rezultat~=1 && passes==2)
        
        fprintf("Nu s-a putut gasi. Se alege Wc ca medie intre Wp si Ws ca ultima optiune.\n"); 
        passes=passes+1;
        wc=(wp+ws)/2;
    end 
    
    
    if (rezultat~=1 && passes==1)
        fprintf("Nu s-a putut gasi. Se apropie Wc de mijlocul intervalului Wp-Ws din nou.\n"); 
        passes=passes+1;
        wc=(wc*3+(wp+ws)/2)/4;
    end    
    
    
    if (rezultat~=1 && passes==0)
        fprintf("Nu s-a putut gasi. Se apropie Wc de mijlocul intervalului Wp-Ws.\n"); 
        passes=passes+1;
        wc=(wc*3+(wp+ws)/2)/4;
    end
    
    M=M/4;
end

  if exist('mGasit','var') == 1
    desenare(mGasit,wcGasit,fereastra,wp,ws,delta_p,delta_s);
  else
      fprintf("Nu a putut fi gasit pentru fereastra %s",fereastra);
  end

end