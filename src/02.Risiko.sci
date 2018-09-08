function [esito]=resiste()
  attacco=gsort(grand(1,3,'uin',1,6));
  difesa=gsort(grand(1,2,'uin',1,6));
  if (attacco(1) <= difesa(1) & attacco(2) <= difesa(2)) then
    esito=1
  else 
    esito=0
  end
endfunction

mean(feval([1:100000],resiste))
