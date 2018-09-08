function [y]=integrale(m,g)
  x=grand(m,1,'def');
  y=mean(feval(x,g))
endfunction

deff('[y]=g(x)','y=(x^4+1)/(x^3+1)');
m=100;

integrale(m,g)
