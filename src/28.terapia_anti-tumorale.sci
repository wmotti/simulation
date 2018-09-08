function [y]=genDisc(pf)
  pfNorm=pf/(sum(pf));
  u=grand(1,1,'def');
  s=0;
  i=0;
  while (u>s),
    i=i+1;
    s=s+pfNorm(i);
  end;
  y=ws(2,i)
endfunction

function [y]=Drop(ws,killed)
  killid=(find(ws(2,:)==killed));
  if (killid==1),
    y=ws(:,[2:$]);
  else
    for i=[1:killid-1],
      y(:,i)=ws(:,i);
    end;
    for i=[killid+1:size(ws,'c')],
      y(:,$+1)=ws(:,i)
    end;
  end;
endfunction

function [y]=simDirect(n,m,k,ws)
  status=zeros(1,n+m);
  while (sum(status(1:n))<n)
    killed=genDisc(ws(1,:));
    status(killed)=1; 
    ws=Drop(ws,killed)
  end;
  if (sum(1-status(n+1:n+m))>=k),
    y=1;
  else
    y=0;
  end;
endfunction

function [y]=simula()
  n=5;
  m=15;
  k=5;
  ws=[grand(n+m,1,'def')';[1:n+m]];
  y=simDirect(n,m,k,ws);
endfunction

function [y]=repeat(n,g)
  for i=[1:n]
    y($+1)=g();
  end
endfunction

mm=1000;

mean(y)
variance(y)

function [y]=simVR(n,m,k,ws)
  n=5;
  m=15;
  k=5;
  ws=[grand(n+m,1,'def')';[1:n+m]];
  for i=[n+1:n+m]
    tkk(i-n)=grand(1,1,'exp',1/ws(1,i));
  end;
  tkk_sort=gsort(tkk,'g');
  tk=tkk_sort(k);
  y=1;
  for i=[1:n]
    y=y*(1-exp(-ws(1,i) * tk));
  end;
endfunction

mm=1000;
dati=repeat(mm,simVR);

mean(dati)
variance(dati)

function [y]=simVRVA(n,m,k,ws)
  n=5;
  m=15;
  k=5;
  ws=[grand(n+m,1,'def')';[1:n+m]];
  us=grand(m,1,'def');
  for i=[n+1:n+m]
    tkk(i-n)=-1/ws(1,i) * log(us(i-n));
  end;
  for i=[n+1:n+m]
    skk(i-n)=-1/ws(1,i) * log(1-us(i-n));
  end;
  tkk_sort=gsort(tkk,'g');
  tk=tkk_sort(k);
  skk_sort=gsort(skk,'g');
  sk=skk_sort(k);
  y1=1;
  y2=1;
  for i=[1:n]
    y1=y1*(1-exp(-ws(1,i) * tk));
  end;
  for i=[1:n]
    y2=y2*(1-exp(-ws(1,i) * sk));
  end;
  y=(y1+y2)/2;
endfunction

mm=1000;
dati=repeat(mm,simVRVA);

mean(dati)
variance(dati)
