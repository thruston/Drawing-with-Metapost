prologues := 3;
outputtemplate := "%j%c.eps";

beginfig(1);

path e; e = fullcircle xscaled 34mm yscaled 55mm;

draw e withcolor .8 white;

s = 1/8;
draw point 0 of e for t=s step s until length e-s: .. point t of e + (normaldeviate, normaldeviate) endfor .. cycle;

endfig;


beginfig(2);

desired_length := 180; n := 30; s := 80;

path shape;
for r=0 upto 8:
  shape := for i=0 upto n-1: 
             (s + r * normaldeviate, 0) rotated (360/n*i) ..
           endfor cycle;
  shape := shape scaled (desired_length/arclength shape);
  shape := shape shifted (r*s,0);
  draw shape withcolor (r/8)[black,red];
  label(decimal r, center shape);
endfor

endfig;
end.

