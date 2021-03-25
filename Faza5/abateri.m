% Functia are rolul de a returna delta_pr si delta_sr 
% pentru un set de date introdus, care sa cuprinda 
% un raspuns la impuls, w_p si w_s


function [delta_pr,delta_sr] = abateri(h, wp, ws)

    grila_frecv=0 :wp/1000 :wp ;
    H=freqz(h,1,grila_frecv) ;
    delta_pr =max(abs(1-abs(H)));


    grila_frecv=ws :(pi-ws)/1000 :pi ;
    H=freqz(h,1,grila_frecv) ;
    delta_sr=max(abs(H));
    
    
end

% faza 3, punctul a)