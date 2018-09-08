function [y]=esponenziale(l,n)
  y=-1/l .* log(grand(n,1,'def'))
endfunction
 
n=1000;
dati=esponenziale(.5,n);

// distribuzione empirica
dati=gsort(dati,'g','i');
plot2d(dati,[1:n]/n)
 
// distribuzione reale
deff('[EE]=EEX(x,l)','EE=1-exp(-l .* x)')
tt=[min(dati):.1:max(dati)];
ff = EEX(tt,.5);
plot2d(tt,ff,style=5);

// densità empirica
set("current_figure",1)
histplot([0:max(dati)],dati)

// densità reale
deff('[ee]=eex(x,l)','ee=l .* exp(-l .* x)')
tt=[min(dati):.1:max(dati)];
ff = eex(tt,.5);
plot2d(tt,ff,style=5);
