function [y]=repeat(n,g)
  for i=[1:n]
    y($+1)=g();
  end
endfunction

function [y]=genera()
  y=(sum(grand(n,1,'exp',1/lambda))/n -exm)/stdevxm;
endfunction 

n=1000;
m=1000;
lambda=3;
exm=1/lambda;
stdevxm=1/(lambda * sqrt(n));
dati=repeat(m,genera);
datis=gsort(dati,'g','i');

// funzione di ripartizione empirica
plot2d(datis,[1:m]/m)

// funzione di ripartizione teorica
x=[-4:.1:4];
size_x=size(x,'c');
plot2d(x,cdfnor("PQ",x,zeros(1,size_x),ones(1,size_x)),style=5)

// funzione di densità empirica
set("current_figure",1)
histplot([min(datis):100/m:max(datis)],datis)

// funzione di densità teorica
function [f]=fN(x,mu,sigma)
  f=exp(-(x-mu)^2/(2*sigma^2))/(sigma*sqrt(2*%pi))
endfunction

ff = fN(x,0,1);
plot2d(x,ff,style=5);
p=get("hdl");
p.children.thickness=2;
