function [e]=approx_e(n)
  i=ones(1,n)*2;
  cn=1;
  while cn<=n,
    u1=grand(1,1,'def');
    u2=grand(1,1,'def');
    while(u2<u1), 
      u1=u2; 
      u2=grand(1,1,'def'); 
      i(cn)=i(cn)+1; 
    end;
    cn=cn+1;
  end;
  e=mean(i)
endfunction

approx_e(1000)
