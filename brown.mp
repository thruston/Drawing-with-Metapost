prologues := 3;
outputtemplate := "%j%c.eps";

beginfig(1);

y = 0; s = 100;
for i=1 upto 50:
draw ( origin
  for x=1/s step 1/s until 1:
    hide(y := y + normaldeviate;)
    -- (x,y*(1/2-abs(x-1/2)))
  endfor
) yscaled 2mm xscaled 10cm withcolor (uniformdeviate 1, uniformdeviate 1, uniformdeviate 1);
endfor

draw origin -- (10cm,0);

endfig;

beginfig(2);
w = 377; h = 233; n = 500;
pair zenith, nadir; zenith = nadir = origin;
path walk[];
for i=1 upto 16:
  y := 0;
  walk[i] = origin for x=0 step w/n until w: 
     hide(
       d := floor uniformdeviate 2 * 2 - 1;
       y := y + d;
       if y > ypart zenith: zenith := (x,y) ; fi
       if y < ypart nadir:  nadir  := (x,y) ; fi
     ) 
     -- (x,y) 
  endfor;
  draw walk[i] withcolor ((y+h/4)/(h/2))[red,blue];
endfor

%draw (down--up) scaled 1/2 h;
draw (origin--right) scaled w;
draw (origin--right) scaled w shifted (0,+h/4) withcolor .8 white;
draw (origin--right) scaled w shifted (0,-h/4) withcolor .8 white;

drawarrow (12 up   -- 2 up  ) shifted zenith withcolor blue;
drawarrow (12 down -- 2 down) shifted nadir  withcolor red;
endfig;

beginfig(3);
%randomseed := uniformdeviate infinity;
randomseed:=1524.50848;

for n=1 upto 4:
  x:=y:=0;
  draw (x,y) for i=1 upto 2000: 
    hide(x:=x+4normaldeviate; y:=y+4normaldeviate;) 
    .. (x,y) 
  endfor withcolor ((n+2)/9)[blue,white];
  fill fullcircle scaled 3 shifted(x,y) withcolor red;
endfor
% mark the origin
fill fullcircle scaled 3 withcolor green;
endfig;

end.

