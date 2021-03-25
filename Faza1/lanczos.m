% functia are rolul de a genera raspunsul la impuls conform
% formulei (1.10)

function x = lanczos(M,L)

for n=1:M
x(n)=((sin(2*pi*(2*n-M+1)/(2*(M-1))))...
    /(2*pi*((2*n-M+1)/(2*(M-1)))))^L;
end

end

