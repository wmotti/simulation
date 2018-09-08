function [y] = generaTempo()
  lambda = .2;
  y= -1/lambda * log(grand(1,1,'def'));
endfunction

function [y] = generaServizio()
  mu = .5;
  sigma = .1;
  y = mu + sigma * (sum(grand(12,1,'def')) - 6);
endfunction

Tmax = 10;

function [A,D,Tp] = simulaCoda()
  tc = 0;               // tempo corrente
  NA = 0;               // arrivi nel tempo corrente
  ND = 0;               // partenze nel tempo corrente
  n = 0;                // clienti nel sistema al tempo corrente
  T = [];               // tempo di arrivo del cliente i-esimo
  T(1) = generaTempo(); 
  tA = T(1);            // tempo di arrivo del prossimo cliente
  tD = %inf;            // tempo di partenza del prossimo cliente
  exit = %F;
  while (~ exit),
    if (tA <= tD & tA < Tmax),
      tc = tA;
      NA = NA + 1;
      n = n + 1;
      T(NA) = tc + generaTempo();
      tA = T(NA);
      if (n == 1),
        Y = generaServizio();
        tD = tc + Y;
      end;
      A(NA) = tc;
    end;
    if (tD < tA & tD <= Tmax)
      tc = tD;
      n = n-1;
      ND = ND+1;
      D(ND) = tc;
      if (n == 0)
        tD = %inf;
      else
        Y = generaServizio();
        tD = tc+Y;
      end;
    end;
    if (min(tA,tD) > Tmax & n>0)
      tc = tD;
      n = n - 1;
      ND = ND + 1;
      D(ND) = tc;
      if (n > 0)
        Y = generaServizio();
        tD = tc + Y;
      end;
    end;
    if (min(tA,tD) > Tmax & n == 0)
      Tp = max(tc-Tmax,0);
      exit = %T;
    end;
  end;
endfunction;

[A,D,Tp] = simulaCoda();
