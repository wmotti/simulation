function [x]=interTempo(n)
  x=grand(1,1,'exp',480/n) 
endfunction

function [x]=fillTime(m,s)
  x=max(0,grand(1,1,'nor',m,s))
endfunction

function [simtable]=simulatePharma(n,m,s)
  t=0;
  while t<=480 do 
    iT=interTempo(n); 
    t=t+iT; simtable($+1,[1:2])=[iT,fillTime(m,s)];
  end
endfunction 

function [cumtable]=cumulate(table,col)
  i=2;
  rows_number=size(table,'r');
  cumtable(1)=simtable(1,col);
  while i<=rows_number do 
    cumtable(i)=cumtable(i-1)+simtable(i-1,col); 
    i=i+1; 
  end
endfunction 

function [workt]=worktime(table)
  workt(1)=table(1,2);
  old=table(1,2);
  i=2;
  while i<=size(table,'r') do 
    new=max(0,old-table(i,1))+table(i,2);
    workt(i)=new; 
    old=new; 
    i=i+1; 
  end
endfunction

function [min_work]=goSimulate(n,m,s)
  simtable=simulatePharma(n,m,s);
  times=cumulate(simtable,2);
  workt=worktime(simtable);
  min_work=max(480,times($,$)+workt($,$))
endfunction

n = 32;
m = 10;
s = 4;
k = 1;
while k <= 365 do 
  workdays(k)=goSimulate(n,m,s); 
  k=k+1; 
end

tabul(workdays)

histplot([min(workdays):ceil(max(workdays))],workdays);

mean(workdays)
