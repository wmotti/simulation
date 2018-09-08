dati=[5,4,9,6,21,17,11,20,7,10,21,15,13,16,8];
n=size(dati,'c');

function [repl]=replica()
  repl=sample(n,dati)
endfunction

function [y]=Var(d)
  xm=sum(dati)/n;
  y=1/n * sum((d-xm)^2);
endfunction

function [y]=Var_camp(d)
  xm=sum(d)/n;
  y=1/(n-1) * sum((d-xm)^2);
endfunction

var=Var(dati)

function [y]=repeat(n,g,h)
  for i=[1:n]
    y($+1)=g(h());
  end
endfunction

r=10000;
Y=mean(repeat(r,Var_camp,replica));

Y
