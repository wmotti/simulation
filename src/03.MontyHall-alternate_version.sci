function [result]=simula(cambia)

  // definisco i premi
  prizes=[0,0,1]';
  
  // definisco le posizioni degli stessi
  state=grand(1,'prm',prizes)';
  
  // scelgo una porta
  choice=grand(1,1,'uin',1,3);
  
  // imposto lo stato delle porte (1 => scelta)
  p_pos= zeros(1,3);
  p_pos(choice)=1;
  
  // determino le porte non scelte
  non_scelte=find(p_pos==0);
  
  // scelgo e apro una porta non scelta
  if (state(non_scelte(1))==1) then
    aperta=non_scelte(2);
    elseif (state(non_scelte(2))==1) then
     aperta=non_scelte(1);
    else aperta_i = grand(1,1,'uin',1,2);
    aperta=non_scelte(aperta_i); 
  end;
  p_pos(aperta)=1;

  result=0;
  
  // definisco il successo se decido di cambiare la porta scelta
  if (cambia) then
    if (state(find(p_pos==0))==1) then
      result=1;
    end;
  end;
  
  // definisco il successo se decido di non cambiare la porta scelta
  if (~cambia) then
    if (state(choice)==1) then result=1; end;
  end;
endfunction;

// ripete n volte la funzione g con parametro p1
function [y]=repeat(n,g,p1)
  for i=[1:n]
    y($+1)=g(p1);
  end
endfunction

mean(repeat(10000,simula,0))

mean(repeat(10000,simula,1))
