global storedRandom
global ret
global aCongr
global cCongr
global mCongr

function setCongruentialGenerator(a,c,m)
  global aCongr
  global cCongr
  global mCongr
  aCongr=a;
  cCongr=c;
  mCongr=m;
endfunction

function setCongruentialSeed(s)
  global storedRandom
  storedRandom=s;
endfunction

function [ret]=nextRandom()
  global storedRandom
  global ret
  ret=storedRandom/mCongr;
  storedRandom=modulo(aCongr * storedRandom + cCongr,mCongr);
endfunction

function init(a,c,m,s)
  setCongruentialGenerator(a,c,m);
  setCongruentialSeed(s);
endfunction

function [vect]=genera(dim,a,c,m,s)
  init(a,c,m,s);
  i=1;
  vect=[];
  for i=1:dim,vect($+1,1)=nextRandom();end
endfunction

y=genera(50,7^5,1,2^31-1,.3)

plot2d([1:50],y)
c = get("hdl");
p = c.children;
p.mark_mode = "on";
p.line_mode = "off";
p.mark_style = 0;
p.mark_size = 1;

set("current_figure",1)
histplot([0:.02:1],y)
