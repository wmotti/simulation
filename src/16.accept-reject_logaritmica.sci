function [y]=geometrica(p)
  y=ceil(log(grand(1,1,'def'))/log(1-p))
endfunction

function [y]=logaritmica(p)
  exit = %F;
  while (~ exit),
    u=grand(1,1,'def');
    y=geometrica(p);
    exit = (u <= (1 - p)/(p * y));
  end
endfunction

function [y]=repeat(n,g,p1)
  for i=[1:n]
    y($+1)=g(p1);
  end
endfunction

m = 1000;
p = .6;
t = repeat(m,logaritmica,p);

// funzione di densità empirica
histplot([min(t):max(t)]-1,t)

// funzione di densità teorica
deff('[y]=Logaritmica(x)','y=(1-p)^x/(-log(p)*x)')
fplot2d([min(t):max(t)],Logaritmica,style=-2)
