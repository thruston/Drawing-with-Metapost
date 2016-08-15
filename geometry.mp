prologues:=3;outputtemplate:="%j%c.mps";

vardef equilateral_triangle_point(expr a, b) =
  b shifted -a rotated 60 shifted a
enddef;

vardef equilateral_triangle_point_a(expr a, b) =
  path c; c = fullcircle scaled 2abs(b-a);
  (c shifted a intersectionpoint c shifted b)
enddef;

vardef shaeffli(expr n, m) =
  for i=0 step m until n*m-1:
      right rotated (i/n*360) --
  endfor cycle
enddef;
 
vardef polygon(expr n) = 
  for i=0 upto n-1:
     right rotated (i/n*360) --
  endfor cycle
enddef;

vardef bisector(expr a,b,c) = 
  save p, u, v; pair p, u, v;
  u = unitvector(a-b);
  v = unitvector(c-b);
  if u=v: p = b
  else:   p = whatever[a,c] = b + whatever * (u+v)
  fi;
  p
enddef;

vardef bisector_a(expr a,b,c,s) = 
  save u, v;  pair u, v;
  u = unitvector(a-b) scaled s;
  v = unitvector(c-b) scaled s;
  equilateral_triangle_point(u,v) shifted b
enddef;

% angle abc
vardef mangle(expr a,c,b) = (angle(c-b)-angle(c-a)) mod 360 enddef;

beginfig(99);

pair A,B,C,D,E,F;

A = origin; B = 200 right; C = (5/8 xpart B,2/3 xpart B);

randomseed := 3003;
D = (1/2 + 1/8 normaldeviate)[B,C];
E = (1/2 + 1/8 normaldeviate)[A,C];

F = whatever[A,bisector(C,A,D)] = whatever[B,bisector(C,B,E)];

draw A--B--C--cycle; 
draw A--D; draw B--E; draw A--F--B;
label.llft("A", A);
label.lrt ("B", B);
label.top ("C", C);
label.urt ("D", D);
label.ulft("E", E);
label.top ("F", F);

label(btex $\alpha$   etex, bisector_a(C,A,F,40));
label(btex $\alpha$   etex, bisector_a(F,A,D,42));
label(btex $\beta$    etex, bisector_a(E,B,F,32));
label(btex $\beta$    etex, bisector_a(F,B,C,34));
label(btex $\theta_0$ etex, bisector_a(D,A,B,21));
label(btex $\theta_1$ etex, bisector_a(A,B,E,21));

label(btex $\epsilon$ etex, bisector_a(B,E,A,4));
label(btex $\phi$     etex, bisector_a(B,F,A,4));
label(btex $\delta$   etex, bisector_a(B,D,A,4));

label(btex \vbox{\halign{\hfil$#$&${}=#$\hfil\cr
\pi-\theta_0-\theta_1&\epsilon+2\alpha\cr
&\delta+2\beta\cr
&\phi+\alpha+\beta,\cr\noalign{\smallskip}
\hbox{hence}\quad
\phi&\displaystyle{\epsilon+\delta\over2}.\cr
}} etex, (xpart A + 8 , ypart C - 22));


endfig;
beginfig(1);

pair A,B,C,D;
C = origin; B = 200 right; r = 24; 
A = whatever[C,B rotated r] = whatever[B,C rotatedabout(B,-r-30)];
D = (A--C) intersectionpoint fullcircle scaled 2 abs(A-B) shifted A;
%D = B rotatedabout(A, mangle(B,A,C));

draw A--B--C--cycle; 
draw B--D;

label.top("A", A);
label.rt("B", B);
label.lft("C", C);
label.ulft("D", D);

show mangle(A,B,C) - mangle(B,C,A);
show mangle(D,B,C);

endfig;

% beta - gamma = 30
% beta = 30 + gamma
% 180 = alpha + gamma + beta
% beta = delta + x
% 180 = alpha + 2 delta
% 2 delta = gamma + beta
% 2 delta = 2 beta - 30
% 2 beta = 2 delta + 30
% 2 beta = 2 delta + 2x
% x = 15;

beginfig(2);

z0 = (100,200);
z1 = (200,50);
%z2 = (-40,-20);
z2 = equilateral_triangle_point(z0,z1);
draw z0--z1--z2--cycle;

%drawarrow z0 -- (z1-z0) + (z2-z0) shifted z0;
drawarrow z0 -- z1+z2-z0;
drawarrow z0 -- z0 + unitvector(z1+z2-2z0) scaled 1in withcolor blue;
drawarrow origin -- 1/2(z1+z2) withcolor red;

drawarrow (origin -- (z1+z2)) shifted -z0 withcolor red;

forsuffixes $=0,1,2: drawarrow origin -- z$; label(str $, z$ scaled 1.05); endfor

endfig;


beginfig(3); % don't change this one, used in dwmp
path c; c = fullcircle scaled 144;
pair a,b,p,q;
for i=0 step 1 until 8:
  a := point i   of c;
  b := point i+1 of c;
  p := equilateral_triangle_point(a,b);
  q := equilateral_triangle_point(b,a);
  draw a -- p -- b withcolor .67 green;
  draw a -- q -- b withcolor .67 red;
endfor
draw c withcolor .53 blue;
endfig;

end
