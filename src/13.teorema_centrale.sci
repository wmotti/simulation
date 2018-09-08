function [y]=normale_approx(n,m)
  for i=[1:m], 
    u=grand(n,1,'def');
    y($+1)=(sum(u) - n/2) * sqrt(12/n); 
  end
endfunction

dati=normale_approx(1000,1000);

// funzione di distribuzione empirica
dati=gsort(dati,'g','i');
m=size(dati,'r');
plot2d(dati,[1:m]/m)

// funzione di distribuzione teorica
x=[-4:.1:4];
size_x=size(x,'c');
plot2d(x,cdfnor("PQ",x,zeros(1,size_x),ones(1,size_x)),style=5)

// funzione di dentità empirica
set("current_figure",1)
Max=max(dati);
Min=min(dati);
histplot([Min:(Max-Min)/100:Max],dati)

// funzione di densità teorica
function [f]=fN(x,mu,sigma)
  f=exp(-(x-mu)^2/(2*sigma^2))/(sigma*sqrt(2*%pi))
endfunction
tt = [Min:0.1:Max]; ff = fN(tt,0,1);
plot2d(tt,ff,style=5);
p=get("hdl");
p.children.thickness=2;
