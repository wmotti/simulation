function [y]=stima(n)
  y1=0;
  for j=[1:n]
    y1=y1 + sqrt(1-((grand(1,1,'def')+j-1)/n)^2);
  end;
  y=4/n * y1;
endfunction

function [y]=repeat(n,g,p1)
  for i=[1:n]
    y($+1)=g(p1);
  end
endfunction

n=1000;
dati=repeat(n,stima,20);

mean(dati)
variance(dati)

function [y]=stimaVA(n)
  y1=0;
  for j=[1:n]
    add1=sqrt(1-((grand(1,1,'def')+j-1)/n)^2);
    add2=sqrt(1-((j-grand(1,1,'def'))/n)^2);
    y1=y1 + add1 + add2;
  end;
  y=2/n * y1;
endfunction

n=1000;
dati=repeat(n,stimaVA,20);

mean(dati)
variance(dati)


