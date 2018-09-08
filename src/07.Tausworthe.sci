p=10;
q=7;

// inizializzo il vettore binario
b=round(grand(1,max(p,q),'def'));

// numero di bit che codificano il valore casuale
L=32;
t=L;

// numero di valori casuali che voglio generare
m=200;

function [bx]=XOR(b1,b2)
  if (b1==b2) then 
    bx=0
  else 
    bx=1;
  end
endfunction

// estendo il vettore binario iniziale calcolando
// b(i) con la funzione XOR sui bits b(i-p) e b(i-q)
for i=[max(p,q)+1:m*t+L+1]; 
  b(i)=XOR(b(i-p),b(i-q)); 
end;

// preparo il vettore dei valori casuali finali
sb=zeros(1:m);

// genero sb(i) usando L bits del vettore binario b
for i=[1:m]; 
  for s=[1:L]; 
    sb(i)=sb(i)+2^(-s)*b(i*t+s); 
  end; 
end

// restituisco i primi venti valori casuali ottenuti
sb(1:20)'
