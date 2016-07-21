prologues:=3;outputtemplate:="%j%c.eps";
vardef area(expr a,b,c) = 
   1/2 abs(xpart a * (ypart b - ypart c)
         + xpart b * (ypart c - ypart a)
         + xpart c * (ypart a - ypart b))
enddef;
vardef ttarea(expr a,b,c) = 
   1/2 abs(xpart ((b-a) rotatedabout(a,-angle (b-a)))
         * ypart ((c-a) rotatedabout(a,-angle (b-a))))
enddef;

beginfig(1);

z1 = (42,89);
z2 = (-10,40);
z3 = (20,-30);

path p;
p = z1--z2--z3--cycle;

draw p; pair a,b;

for t=0 step 1/4 until 3:
  a := point t of p;
  b := point t+1/2 length p of p;
  draw a--b;
  show (t,area(point 0 of p, a, b));
  show (t,area(point 1 of p, a, b));
  show (t,area(point 2 of p, a, b));
  show (t,area(point 0 of p, a, b)+
  area(point 1 of p, a, b)+
  area(point 2 of p, a, b));
endfor

endfig;
end

