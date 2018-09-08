numData=3000;
data=grand(1,numData,'nor',0,1);
t=[];
i=1;
while i<=numData-3 do 
  xm=mean(data(1,i:i+3)); 
  chi=0;
  for j=[0:3],
    chi=chi + (data(1,i+j)-xm)^2;
  end;
  t(1,$+1)=(xm*2)/sqrt(chi/3); 
  i=i+4; 
end

// densità empirica
histplot(75,t)

// densità t di student
function [f]=fT(t,nu)
  divisore = (sqrt(%pi*nu).*gamma(nu/2));
  f=gamma((nu+1)./2).*(1+t.^2./nu).^(-(nu+1)/2)/divisore;
endfunction
tt = [min(t):0.1:max(t)]; ff = fT(tt,3);
plot2d(tt,ff,style=5);
p=get("hdl");
p.children.thickness=2;


