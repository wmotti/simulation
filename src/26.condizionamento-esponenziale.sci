function [y]=ySim()
  y=-log(grand(1,1,'def'));
endfunction

function [i]=iSim()
  nor=grand(1,1,'nor',ySim(),2);
  if (nor<=1),
    i=0;
  else
    i=1;
  end;
endfunction

function [y]=repeat(n,g)
  for i=[1:n]
    y($+1)=g();
  end
endfunction
  
m=1000;
dati=repeat(m,iSim);

mean(dati)
variance(dati)

function [y]=iSimCond()
  y=1-cdfnor("PQ",(1-ySim())/2,0,1)
endfunction

dati=repeat(m,iSimCond);

mean(dati)
variance(dati)

function [y]=iSimCondAV()
  u=grand(1,1,'def');
  nor1=cdfnor("PQ",(1+log(u))/2,0,1);
  nor2=cdfnor("PQ",(1+log(1-u))/2,0,1);
  y=(1 - nor1 + 1 - nor2)/2;
endfunction

dati=repeat(m,iSimCondAV);

mean(dati)
variance(dati)

