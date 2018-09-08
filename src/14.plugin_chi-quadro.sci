function [y]=normale_approx(n,m)
  for i=[1:m], 
    u=grand(n,1,'def');
    y($+1)=(sum(u) - n/2) * sqrt(12/n); 
  end
endfunction

function [y]=chi2(k,M)
  for i=[1:M]
    nor=normale_approx(1000,k);
    y(i)=sum(nor.^2)
  end
endfunction

dati=chi2(4,1000);

// funzione di distribuzione empirica
dati=gsort(dati,'g','i');
m=size(dati,'r');
plot2d(dati,[1:m]/m) //CDF

// funzione di distribuzione teorica
x=[0:.1:25];
size_x=size(x,'c');
plot2d(x,cdfchi("PQ",x,ones(1,size_x)*4),style=5)

// funzione di massa di probabilità empirica
set("current_figure",1)
Max=max(dati);
Min=min(dati);
histplot([Min:(Max-Min)/30:Max],dati)

// funzione di massa di probabilità teorica
function [f]=fC(x,nu)
  f=x.^(nu/2-1).*exp(-x/2)./(2.^(nu/2).*gamma(nu./2))
endfunction

tt = [Min:0.1:Max]; ff = fC(tt,4);
plot2d(tt,ff,style=5)
p=get("hdl");
p.children.thickness=2;
