function [pi]=approx_pi(m,n)
  c=zeros(m,n);
  cn=1;
  while cn<=n,
    x=grand(m,1,'unf',-1,1);
    y=grand(m,1,'unf',-1,1);
    for i=[1:m]
      if (x(i)^2+y(i)^2<=1), c(i,cn)=c(i,cn)+1; end;
    end;
    cn=cn+1;
  end;
  pi=4 * mean(c)
endfunction

approx_pi(1000,100)
