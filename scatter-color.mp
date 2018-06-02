prologues := 3;
outputtemplate := "%j%c.eps";

beginfig(1);
  N = 5; n = 0;
  for y=1 upto N:
    for x=1 upto N:
      fill fullcircle scaled 16 shifted 20(x,y)
        withpen pencircle scaled 2
        withcolor (n/N/N)[red, blue];
      label(decimal incr n infont "phvr8r", 20(x,y)) 
        withcolor white;
    endfor
  endfor
endfig;
end.

