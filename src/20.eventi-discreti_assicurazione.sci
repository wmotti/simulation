function [y] = generaTempo(nu,mu,lambda,n)
  param = nu + n*mu + n*lambda;
  y= -1/param * log(grand(1,1,'def'));
endfunction

function [y] = generaEvento(nu,mu,lambda,n)
  u=grand(1,1,'def');
  if (u < nu/(nu + n*mu + n*lambda)),
    y = 1;
  elseif (u<(nu + n*mu)/(nu + n*mu + n*lambda)),
    y = 2;
  else y = 3;
  end;
endfunction

function [Y] = generaRisarcimento()
  Y=grand(1,1,'nor',5,3);
endfunction

Tmax = 100;

tc = 0;         // tempo corrente
a = 10;         // capitale iniziale
n = 10;	        // numero clienti iniziale
c = .01;        // tasso di pagamento del premio
nu = 1;         // tasso di arrivo dei nuovi clienti
mu = 1;	        // tasso di abbandono dei clienti
lambda = .3;    // tasso di richieste di risarcimento
I = 0; 	        // 1 se non c'è stato fallimento entro Tmax
tE = generaTempo(nu,mu,lambda,n);
exit = %F;
while (~ exit),
  if (tE > Tmax)
    I = 1;
    exit = %T;
  else 
    a = a + n*c*(tE - tc);
    tc = tE;
    j = generaEvento(nu,mu,lambda,n);
    if (j == 1)
      n = n + 1;
    elseif (j == 2)
      n = n - 1;
    else
      Y = generaRisarcimento();
      if (Y > a)
        I = 0;
        exit = %T;
      else a = a - I;
      end;
    end;
  end;
  tE=tc + generaTempo(nu,mu,lambda,n);
end;
I	// controlliamo infine se l'assicurazione non è fallita
