prologues := 3;
outputtemplate := "%j%c.mps";

beginfig(1);

for t=0 upto 3:
  fill unitsquare scaled 7 shifted right shifted up rotated 45 rotated 90t;
endfor

endfig;
end.

