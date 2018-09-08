function [y]=stima()
  u=grand(1,1,'def');
  y=exp(u);
endfunction

function [y]=stimaVA()
  u=grand(1,1,'def');
  y=(exp(u)+exp(1-u))/2;
endfunction

function [y]=repeat(n,g)
  for i=[1:n]
    y($+1)=g();
  end
endfunction

m=100;
dati=repeat(2*m,stima);
datiVA=repeat(2*m,stimaVA);

mean(dati)
mean(datiVA)
variance(dati)
variance(datiVA)

function [y]=euEstimate()
  m=100;
  y=mean(repeat(m,stima));
endfunction

function [y]=euEstimateVA() 
  m=100;
  y=mean(repeat(m,stimaVA));
endfunction

n=1000;
histplot([1.55:0.01:1.85],repeat(n,euEstimate));

set("current_figure",1)
histplot([1.55:0.01:1.85],repeat(n,euEstimateVA));

histplot([1.55:0.01:1.85],repeat(n,euEstimate));
histplot([1.55:0.01:1.85],repeat(n,euEstimateVA),style=5);
