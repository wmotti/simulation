function [y1,y2]=normale()
  u1=grand(1,1,'def');
  u2=grand(1,1,'def');
  d=-2 * log(u1);
  theta=2 * %pi * u2;
  y1=sqrt(d) * cos(theta);
  y2=sqrt(d) * sin(theta);
endfunction

function [y]=repeat(n,g)
  for i=[1:n]
    [y1,y2]=g();
    y($+1)=y1;
    y($+1)=y2;
  end
endfunction

dati=repeat(1000, normale);

// funzione di distribuzione empirica
dati=gsort(dati,'g','i');
m=size(dati,'r');
plot2d(dati,[1:m]/m)

// funzione di distribuzione teorica
x=[-4:.1:4];
size_x=size(x,'c');
plot2d(x,cdfnor("PQ",x,zeros(1,size_x),ones(1,size_x)),style=5)

// funzione di densità empirica
set("current_figure",1)
Max=max(dati);
Min=min(dati);
histplot([Min:(Max-Min)/100:Max],dati)

// funzione di densità teorica
function [f]=fN(x,mu,sigma)
  f=exp(-(x-mu)^2/(2*sigma^2))/(sigma*sqrt(2*%pi));
endfunction
tt = [Min:0.1:Max]; ff = fN(tt,0,1);
plot2d(tt,ff,style=5);
p=get("hdl");
p.children.thickness=2;
