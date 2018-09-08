function [y]=stimaPi()
  v1=grand(1,1,'unf',-1,1);
  v2=grand(1,1,'unf',-1,1);
  if (v1^2 + v2^2 <=1),
    y=1;
  else 
    y=0;
  end;
endfunction

function [y]=repeat(n,g)
  for i=[1:n]
    y($+1)=g();
  end
endfunction

m=1000;
dati=repeat(m,stimaPi);

mean(dati)*4
variance(dati)

function [y]=stimaPiCond()
  y=sqrt(1-grand(1,1,'def')^2)
endfunction

dati=repeat(m,stimaPiCond);

mean(dati)*4
variance(dati)

function [y]=stimaPiCondVA()
  u=grand(1,1,'def');
  y=(sqrt(1-u^2)+sqrt(1-(1-u)^2))/2;
endfunction

dati=repeat(m,stimaPiCondVA);

mean(dati)*4
variance(dati)
