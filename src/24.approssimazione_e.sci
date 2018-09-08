function [y]=repeat(n,g)
  for i=[1:n]
    y($+1)=g();
  end
endfunction

function [i]=minEstimate()
  i=2;
  u1=grand(1,1,'def')
  u2=grand(1,1,'def')
  while (u2<u1),
    u1=u2;
    u2=grand(1,1,'def');
    i=i+1;
  end;
endfunction

m=1000;
datiMin=repeat(m,minEstimate);

mean(datiMin)
variance(datiMin)

function [i]=maxEstimate()
  i=2;
  u1=grand(1,1,'def')
  u2=grand(1,1,'def')
  while (u2>u1),
    u1=u2;
    u2=grand(1,1,'def');
    i=i+1;
  end;
endfunction

datiMax=repeat(m,maxEstimate);

mean(datiMax)
variance(datiMax)

datiMinMax=(datiMin + datiMax)/2;

mean(datiMinMax)
variance(datiMinMax)

mean((datiMin - %e)^2)
mean((datiMax - %e)^2)
mean((datiMinMax - %e)^2)

%e

function [y]=eEstimateMin()
  y=mean(repeat(m,minEstimate));
endfunction

function [y]=eEstimateMax()
  y=mean(repeat(m,maxEstimate));
endfunction

function [y]=eEstimateMinMax()
  minimi=repeat(m,minEstimate);
  massimi=repeat(m,maxEstimate);
  y=mean((minimi + massimi)/2);
endfunction

histplot([2.5:0.01:3],repeat(m,eEstimateMin));

set("current_figure",1)
histplot([2.5:0.01:3],repeat(m,eEstimateMax));

set("current_figure",2)
histplot([2.5:0.01:3],repeat(m,eEstimateMinMax));

set("current_figure",3)
histplot([2.5:0.01:3],repeat(m,eEstimateMin));
histplot([2.5:0.01:3],repeat(m,eEstimateMinMax),style=5);
