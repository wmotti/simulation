clear;

N=10000;
correctWhenStick = 0;
correctWhenChange = 0;

for i=[1:N] do 
  rightAnswer = grand(1,1,'uin',1,3);
  initialGuess = grand(1,1,'uin',1,3);
  if (initialGuess<>rightAnswer) then 
    correctWhenChange = correctWhenChange+1;
  else 
    if (initialGuess==rightAnswer) then 
      correctWhenStick = correctWhenStick+1;
    end;
  end;
end

correctWhenStick/N

correctWhenChange/N

