prologues:=3;outputtemplate:="%j%c.mps";
beginfig(1);

u = 10;
path r, s, t; 
s = unitsquare scaled u;
r = s rotated  30 shifted point 3 of s;
t = s rotated -30 shifted point 2 of 
   (s rotated  30 shifted point 3 of s);

picture unit;
unit = image(
  fill s withcolor .8[red,white]; draw s;
  fill t withcolor .8[red+blue,white]; draw t;
  fill r withcolor .8[blue,white]; draw r;
) shifted ((-u*1.93185156237, 0) rotated 45)
  rotated 15;
R = 10;

for x=-R upto R:
  for y=-R upto R:
    draw unit shifted ( (y*u*sqrt(6),0) rotated 180) 
              shifted ( (x*u*sqrt(6),0) rotated 60);
  endfor  
endfor  

clip currentpicture to fullcircle scaled 400;

endfig;
end

