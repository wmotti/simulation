function [y]=xi(n)
  y=grand(n,1,'exp',1);
endfunction

function [y]=nSim()
  y=grand(1,1,'poi',5);
endfunction

function [y]=directSim(c)
  n=nSim();
  if (sum(xi(n))>c),
    y=1;
  else
    y=0;
  end;
endfunction

c=5;

directSim(c)

function [y]=repeat(n,g,c)
  for i=[1:n]
    y($+1)=g(c);
  end
endfunction

m=1000;
dati=repeat(m,directSim,c);

mean(dati)
variance(dati)

function [y]=vrSim(c)
  m=0;
  somma=0;
  while (somma<=c),
    m=m+1;
    somma=somma+xi(1);
  end;
    y=1-cdfpoi("PQ",m-1,5);
endfunction

dati=repeat(m,vrSim,c);

mean(dati)
variance(dati)


