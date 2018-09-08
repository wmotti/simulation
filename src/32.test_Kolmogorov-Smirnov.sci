m=10;
dati=grand(m,1,'exp',1/5);

function [y]=fEmp(dati)
  m=size(dati,'r');
  datis=gsort(dati,'g','i');
  for i=[1:m]
    y(i,1)=i/m;
    y(i,2)=datis(i);
  end;
  y=y';
endfunction

y=fEmp(dati);

deff('[y]=cdfexp(lambda,x)','y=1-exp(-lambda * x)')
fs=cdfexp(5,y(2,:));

m1=[1:m]/m-fs;
m2=fs-[0:m-1]/m;

d=max([m1,m2])

function [d]=simPValue()
  us=gsort(grand(m,1,'def'),'g','i');
  m1=[1:m]/m-us'
  m2=us'-[0:m-1]/m
  d=max([m1,m2])
endfunction

function [y]=meanP(mm)
  c=0;
  for i=[1:mm],
    if (simPValue()>=d),
      c=c+1;
    end;
  end;
  y=c/mm;
endfunction

meanP(10000)

m=10;
dati=grand(m,1,'chi',5);

function [y]=fEmp(dati)
  m=size(dati,'r');
  datis=gsort(dati,'g','i');
  for i=[1:m]
    y(i,1)=i/m;
    y(i,2)=datis(i);
  end;
  y=y';
endfunction

y=fEmp(dati);

deff('[y]=cdfexp(lambda,x)','y=1-exp(-lambda * x)')
fs=cdfexp(5,y(2,:));

m1=[1:m]/m-fs;
m2=fs-[0:m-1]/m;

d=max([m1,m2])

function [d]=simPValue()
  us=gsort(grand(m,1,'def'),'g','i');
  m1=[1:m]/m-us'
  m2=us'-[0:m-1]/m
  d=max([m1,m2])
endfunction

function [y]=meanP(mm)
  c=0;
  for i=[1:mm],
    if (simPValue()>=d),
      c=c+1;
    end;
  end;
  y=c/mm;
endfunction

meanP(10000)
