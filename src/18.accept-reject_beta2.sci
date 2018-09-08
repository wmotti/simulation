function [out]=Beta2()
  cont=%T;
  while cont,
    u1=grand(1,1,'def');
    y=u1^(1/a);
    u2=grand(1,1,'def');
    cont= ~(u2 <= (1-y)^(b-1));
  end;
  out=y;
endfunction

function [y]=repeat(n,g)
  for i=[1:n]
    y($+1)=g();
  end
endfunction

m = 10000;
a = 4.9; b = 1.5;

t2=repeat(m,Beta2);

// funzione di densità empirica
x=[floor(min(t2)):.01:ceil(max(t2))];
histplot(x,t2)

// funzione di densità teorica
function [bb]=bet(x,a,b)
  bb=(gamma(a+b)/(gamma(a)*gamma(b)))*x.^(a-1).*(1-x).^(b-1)
endfunction

plot2d(x,bet(x,4.9,1.5),style=5);
p=get("hdl");
p.children.thickness=2;
