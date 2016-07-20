prologues:=3;outputtemplate:="%j%c.eps";
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
  save p,q; numeric p,q;
  p = length (a-b);
  q = length (c-b);
  (p/(p+q))[a,c]
enddef;

pair A,B,C;

A = 120 right rotated 52;
B = origin; 
C = 144 right rotated -4;

beginfig(1);
% Euclid

z0 = euclidean_bisector(A,B,C,100);

draw B -- 1.2[B,z0];
draw A--B--C;
dotlabel.top(btex $A$ etex, A);
dotlabel.lft(btex $B$ etex, B);
dotlabel.lrt(btex $C$ etex, C);
dotlabel.lrt(btex $E$ etex, z0);

endfig;

beginfig(2);
  
z0 = vector_bisector(A,B,C,50);
drawarrow B--A  cutafter fullcircle scaled 5 shifted A;
drawarrow B--C  cutafter fullcircle scaled 5 shifted C;
drawarrow B--z0 cutafter fullcircle scaled 5 shifted z0;
dotlabel.top(btex $A$ etex, A);
dotlabel.lft(btex $B$ etex, B);
dotlabel.lrt(btex $C$ etex, C);
dotlabel.lrt(btex $E$ etex, z0);

endfig;
beginfig(3);

z0 = interior_bisector(A,B,C);

draw A--B--C--cycle;
draw B -- 1.2[B,z0];
dotlabel.top(btex $A$ etex, A);
dotlabel.lft(btex $B$ etex, B);
dotlabel.lrt(btex $C$ etex, C);
fill fullcircle scaled dotlabeldiam shifted z0;
label(btex $E$ etex, z0 + (3,9));

endfig;
end

