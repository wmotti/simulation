n=3;
medie=[1,2,3];
devstd=[.1,.2,.1];
pesi=[.3,.6,.1];

// approssima la normale con n bernoulliane
function [y]=normale_approx(n)
  u=grand(n,1,'def');
  y=(sum(u) - n/2) * sqrt(12/n); 
endfunction

// simula una variabile casuale normale standard
function [y]=simZ()
  y=normale_approx(20);
endfunction

// simula una variabile casuale normale
function [y]=simNormal(mu,sigma)
  y=mu + sigma * simZ();
endfunction

// simula la varibabile casuale mediante composizione di normali
function [y]=simMix()
  u=grand(1,1,'def');
  cm=pesi(1);
  i=1;
  while cm<u, i=i+1; cm=cm+pesi(i); end
  y=simNormal(medie(i),devstd(i));
endfunction

// ripete n volte la funzione g
function [y]=repeat(n,g)
  for i=[1:n]
    y($+1)=g();
  end
endfunction

m=1000;
dati=repeat(m,simMix);

dati=gsort(dati,'g','i');
m=size(dati,'r');
plot2d(dati,[1:m]/m) //CDF

Max=max(dati);
Min=min(dati);
set("current_figure",1)
histplot([Min:(Max-Min)*10/m:Max],dati) //pmf
