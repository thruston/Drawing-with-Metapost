prologues:=3;outputtemplate:="%j%c.eps";

vardef interior_bisector(expr A,O,B) = 
  save a,b; numeric a,b;
  a = length (A-O);
  b = length (B-O);
  (a/(a+b))[A,B]
enddef;

vardef distance(expr a,b,c) = 
  abs((ypart b - ypart a)*xpart c
     -(xpart b - xpart a)*ypart c
     + xpart b * ypart a
     - ypart b * xpart a) 
    /((ypart b - ypart a) 
    ++(xpart b - xpart a))
enddef;
  

beginfig(1);
z0 = origin;
z1 = 120 right rotated 18;
z2 = 80 right rotated -21;
draw z0 -- z1 -- z2 -- cycle;
path segment[];
for i=0 upto 2:
  segment[i] = z[i] -- interior_bisector(z[(i-1) mod 3], z[i], z[(i+1)mod3]);
  draw segment[i];
  endfor

z3 = segment1 intersectionpoint segment2;

draw fullcircle scaled 2 distance(z1,z2,z3) shifted z3;


endfig;
end

