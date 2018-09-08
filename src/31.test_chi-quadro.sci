function [t]=chiValue(dati,ps)
  mm=size(dati,'r');
  [a,ns]=dsearch(dati,[1:k],"d");
  t=sum((ns-(mm*ps))^2 ./(mm*ps));
endfunction

function [y]=chiTest()
  t=chiValue(dati,ps);
  y=1-cdfchi("PQ",t,k-1);
endfunction

k=10;
m=1000;
ps=ones(1,k)*1/k;
dati=grand(m,1,'uin',1,k);

chiTest()

function [y]=repeat(n,g)
  for i=[1:n]
    y($+1)=g();
  end
endfunction

function [y]=ct()
  dati=grand(m,1,'uin',1,k);
  y=chiTest();
endfunction

n=100;
p_values=repeat(n,ct);
mean(p_values)

function [y]=ct_bin()
  dati=grand(m,1,'bin',k-1,1/2);
  y=chiTest();
endfunction
  
p_values_bin=repeat(n,ct_bin);

mean(p_values_bin)

dati=[1, 10, 2, 5, 7, 6, 1, 4, 7, 5, ...
      3, 5, 8, 1, 6, 6, 3, 10, 7, 2, ...
      10, 10, 2, 10, 5, 10, 5, 9, 2, 3, ...
      5, 3, 9, 1, 6, 6, 5, 10, 2, 2, ... 
      1, 6, 8, 9, 8, 10, 10, 6, 10, 10, ... 
      7, 2, 7, 9, 10, 10, 2, 1, 9, 10, ... 
      2, 8, 10, 7, 5, 10, 4, 10, 6, 1, ... 
      5, 3, 7, 7, 1, 10, 3, 2, 8, 2, ... 
      10, 8, 5, 10, 9, 3, 8, 10, 3, 1, ... 
      5, 3, 10, 7, 7, 7, 6, 9, 4, 1];
dati=dati';
histplot([0:k],dati)

chiTest()

t=chiValue(dati,ps) 

k=10;
m=size(dati,'r');

function [y]=simDist()
  y=grand(m,1,'uin',1,k)
endfunction

function [y]=tSim()
  [a,NS]=dsearch(simDist(),[1:k],"d");
  y=sum((NS-(m*ps))^2 ./ (m*ps));
endfunction

function [y]=simula(mm)
  r=repeat(mm,tSim);
  c=0;
  for i=[1:mm]
    if (r(i)>=t)
      c=c+1;
    end;
  end;
  y=c/mm;
endfunction

simula(1000)

simula(10000)
