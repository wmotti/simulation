n=4;
function [y]=g(u1,u2,u3,u4)
  y=(u1+u2)/(1+u3-u4)
endfunction

function [y]=tn()
  U=grand(4,1,'def');
  y=-log(prod(U));
endfunction

function [y]=simG()
  vs=gsort(grand(n-1,1,'def'),'g','i');
  vs($+1)=1;
  t=tn();
  us(1)=exp(-t*vs(1));
  for j=[2:n],
    us(j)=exp(-t*(vs(j)-vs(j-1)));
  end;
  y=g(us(1),us(2),us(3),us(4))
endfunction

function [y]=repeat(n,G)
  for i=[1:n]
    y($+1)=G();
  end
endfunction

m=1000;
dati=repeat(m,simG);

mean(dati)
variance(dati)
