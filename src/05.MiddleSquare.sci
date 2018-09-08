function [n]=vonNeumannNextRand(n)
  l=ceil(log10(n));
  sn="";
  for i=floor(l/2)+1:floor(3*l/2),
    j=part(string(n^2),i);
    sn=sn+j; 
  end;
  n=evstr(sn);
endfunction

function [result]=MS_gen(N,seed)
  result=[];
  n=seed;
  for i=[1:N],
    n=vonNeumannNextRand(n);
    result($+1,1)=n/9999;
  end
endfunction

MS_gen(50,5132)
