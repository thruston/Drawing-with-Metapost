prologues := 3;
outputtemplate := "%j%c.eps";

def perpendicular expr t of p = 
  direction t of p rotated 90 shifted point t of p
  enddef;

beginfig(1);

u = 5mm;  
r = 0;
n = 32;
s = 8u;
theta = -45;

path base;
base = origin for i=1 upto n-1: -- (i/n*s,r*normaldeviate) endfor -- (s,0) -- (s,-u) -- (0,-u) -- cycle;
fill base withcolor .8[blue,white];
draw base withcolor .67 blue;

path ray[];
for i=2 upto 6:
  ray[i] = (left--right) scaled 2/3 s rotated theta shifted (i*u,0);
  b := ypart(ray[i] intersectiontimes base);
  ray[i] := point 0 of ray[i] 
         -- point b of base 
         -- point 0 of ray[i] reflectedabout(point b of base, perpendicular b of base);
  drawarrow ray[i];
endfor   

label("r=" & decimal r, center base);

endfig;
end.
