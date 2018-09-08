function [y]=Beta()
  cont=%T;
  while cont,
    u1=grand(1,1,'def');
    u2=grand(1,1,'def');
    fattore_1 = (u1 * (a + b - 2) / (a-1))^(a-1);
    fattore_2 = ((1-u1) * (a + b - 2) / (b-1))^(b-1);
    cont= ~(u2 <= (fattore_1 * fattore_2));
  end;
  y=u1;
endfunction

function [y]=repeat(n,g)
  for i=[1:n]
    y($+1)=g();
  end
endfunction

m = 10000;
a = 2; b = 5;

t=repeat(m,Beta);

// funzione di densità empirica
x=[floor(min(t)):.01:ceil(max(t))];
histplot(x,t) 

// funzione di densità teorica
function [bb]=bet(x,a,b)
  bb=(gamma(a+b)/(gamma(a)*gamma(b)))*x.^(a-1).*(1-x).^(b-1)
endfunction

plot2d(x,bet(x,2,5),style=5);
p=get("hdl");
p.children.thickness=2;
