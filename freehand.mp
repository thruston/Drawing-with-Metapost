prologues := 3;
outputtemplate := "%j%c.mps";

def freehand_segment(expr p) =
  point 0 of p {direction 0 of p rotated (4+normaldeviate)} .. 
  point 1 of p {direction 1 of p rotated (4+normaldeviate)}
enddef;

def freehand_path(expr p) = 
  freehand_segment(subpath(0,1) of p)
  for i=1 upto length(p)-1:
    & freehand_segment(subpath(i,i+1) of p)
  endfor
  if cycle p: & cycle fi
enddef;
defaultfont := "eurm10";
color sepia; sepia = (0.44, 0.26, 0.08);


picture mark[];
mark1 = image(draw (left--right) scaled 2 rotated 60);
mark2 = image(draw mark1 shifted left; draw mark1 shifted right);

def moved_along expr x of p = rotated angle direction x of p 
                              shifted point x of p enddef;

beginfig(1);
z0 = (0,-1cm); z1 = (6cm,0);  z2 = (4cm,3cm); 
path t, c; 
t = freehand_path(z0--z1--z2--cycle);
c = freehand_path(z0..z1..z2..cycle);

z3 = point 1/2 + 1/20 normaldeviate of subpath (0,1) of t;

draw c withcolor .67 red;
draw t;
draw freehand_segment(point 2 of t--z3);
draw mark2 moved_along 1/4 of t;
draw mark2 moved_along 3/4 of t;

label.lft("A", z0);
label.rt ("B", z1);
label.top("C", z2);
label.bot("D", z3);
endfig;

def ddraw_out(expr p, o) = 
  draw p;
  for i=0 upto length(p)-1:
     draw point i   of p .. point i   of p shifted (-o*unitvector(direction i+eps of p));
     draw point i+1 of p .. point i+1 of p shifted (+o*unitvector(direction i+1-eps of p));
  endfor
enddef;

def draw_out(expr p, o) = 
  draw p;
  for i=1 upto length(p):
     draw (unitvector(direction i-eps of p) scaled +o 
           -- origin --
           unitvector(direction i+eps of p) scaled -o) 
           shifted point i of p;
  endfor
enddef;

def angle_label_pos(expr p, i, s) = 
  ( unitvector(point i-1 of p-point i of p)
  + unitvector(point i+1 of p-point i of p)
  ) scaled s shifted point i of p
enddef;

beginfig(2);
  drawoptions(withcolor sepia);
  draw_out(t,6);
  drawoptions(withcolor .78 blue);
  label.lrt ("a", point 1/2 of t);
  label.urt ("b", point 3/2 of t);
  label.ulft("c", point 5/2 of t);

  drawoptions(withcolor .67 red);
  label(char 11, angle_label_pos(t,2,10));
  label(char 12, angle_label_pos(t,0,14));
  label(char 13, angle_label_pos(t,1,10));
endfig;

beginfig(3);
for i=0 upto 15: 
  label.top(decimal i infont "cmss10" scaled 0.7, (15i,108)) withcolor .67 red;
  for j=0 upto 7:
  label(char (i+16j) infont "eurm10", (15i,100-14j));
  if i=0: label.lft(decimal 16j infont "cmss10" scaled 0.7, (-8,100-14j)) withcolor .67 red; fi
endfor endfor
endfig;



end.

