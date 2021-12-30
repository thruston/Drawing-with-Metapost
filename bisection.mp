vardef equilateral_triangle_point(expr a, b) =
  b shifted -a rotated 60 shifted a
enddef;

vardef euclidean_bisector(expr a,b,c,r) = 
  save arc,p,q,e; 
  path arc; numeric p,q; pair e;
  arc = fullcircle scaled r shifted b;
  p = ypart ( (a--b) intersectiontimes arc );
  q = ypart ( (b--c) intersectiontimes arc );
  e = equilateral_triangle_point(point p of arc, point q of arc);
  hide(
    draw subpath(p-1/4,p+1/4) of arc withcolor .7[red,white]; 
    draw subpath(q-1/4,q+1/4) of arc withcolor .7[red,white];
    draw point p of arc -- point q of arc -- e -- cycle
                                    withcolor .7[blue,white];
  )
  e
enddef;

vardef vector_bisector(expr a,b,c,r) = 
   b + unitvector (a-b) scaled r 
     + unitvector (c-b) scaled r
enddef;

vardef interior_bisector(expr a,b,c) = 
  (1/(1+abs(c-b)/abs(a-b)))[a,c]
enddef;

pair A,B,C;
A = 120 right rotated 52;
B = origin; 
C = 144 right rotated -4;
