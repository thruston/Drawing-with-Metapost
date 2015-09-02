prologues := 3;
outputtemplate := "%j%c.eps";

beginfig(1);

u = 1cm;
path xx, yy, f;
xx = (left -- 5 right) scaled u;
yy = (3 down -- 3 up) scaled u;

drawarrow xx withcolor .7 white;
drawarrow yy withcolor .7 white;

f = ( (-3,mexp(-768)) for x= -23/8 step 1/8 until 13/8: -- (x,mexp(256x)) endfor) 
    reflectedabout(origin, (1,1)) 
    scaled u;

draw f withcolor .67 blue;

endfig;

% is point "p" inside cyclic path "ring" ?
vardef inside(expr p, ring) = 
  save t, count, test_line;
  count := 0;
  path test_line;
  test_line = p -- (infinity, ypart p);
  for i = 1 upto length ring:
     t := xpart (subpath(i-1,i) of ring intersectiontimes test_line);
     if ((0 <= t) and (t<1)): count := count + 1; fi
  endfor
  odd(count)
  enddef;
  
vardef front_half primary p = subpath(0, 1/2 length p) of p enddef;
vardef back_half  primary p = subpath(1/2 length p, length p) of p enddef;

% a and b should be cyclic paths...
vardef xoverlap(expr a, b) = 
  boolean p, q;
  p = inside(point 0 of a, b);
  q = inside(point 0 of b, a);
  if ((not p) and (not q)): 
    buildcycle(a,b)
  elseif (not p): 
    buildcycle(front_half b, a, back_half b)
  elseif (not q): 
    buildcycle(front_half a, b, back_half a)
  else: 
    buildcycle(front_half a, back_half b, front_half b, back_half a)
  fi
  enddef;

vardef xcombine(expr a, b) = 
  boolean p, q;
  p = inside(point 0 of a, b);
  q = inside(point 0 of b, a);
  if (p and q): 
    buildcycle(a,b)
  elseif p: 
    buildcycle(front_half b, a, back_half b)
  elseif q: 
    buildcycle(front_half a, b, back_half a)
  else: 
    buildcycle(front_half a, back_half b, front_half b, back_half a)
  fi
  enddef;

vardef overlap(expr a, b) = 
  save p, q, A, B;
  boolean p, q;
  p = not inside(point 0 of a, b);
  q = not inside(point 0 of b, a);
  path A, B;
  A = counterclockwise a;
  B = counterclockwise b;
  if (p and q): 
    buildcycle(A,B)
  elseif p: 
    buildcycle(front_half B, A, back_half B)
  elseif q: 
    buildcycle(front_half A, B, back_half A)
  else: 
    buildcycle(front_half A, back_half B, front_half B, back_half A)
  fi
  enddef;

beginfig(0)
u:=10pt;
vardef randomcirc(expr O, r, w) = 
  save p,i; pair p; numeric i;
    p=O+right*r;
    p for i=1 upto 9: .. (p rotatedaround(O, 36i))+(uniformdeviate w, uniformdeviate w) endfor .. cycle
enddef;
path pat[];
pair p[];
p0:=(0,5u); p3:=(-8u,0);
pat0:=randomcirc(p0,8u,.5u);
pat3:=randomcirc(p3,5u,0.4u);
%fill combine(pat0, pat3) withcolor .7[blue, white];
fill overlap(pat0, pat3) withcolor .7[red, white];
drawarrow front_half pat0; drawarrow front_half pat3;
endfig;
beginfig(2);
  path A, B; 
  A = fullcircle scaled 2.5cm; 
  B = fullcircle scaled 1.8cm shifted (1cm,0);
  fill buildcycle(A,B) withcolor .8[blue,white]; drawarrow A; drawarrow B;
  label.rt(btex Where has the fill colour gone? etex, point 0 of B shifted (1cm,0));
  label.ulft(btex $A$ etex, point 3 of A);
  label.urt(btex $B$ etex, point 1 of B);
endfig;

beginfig(3);
  path A, B; picture p[];
  A = fullcircle scaled 2.5cm; 
  B = fullcircle scaled 1.8cm shifted (1cm,0);
  p1 = image(fill buildcycle(A,B) withcolor .8[blue,white]; drawarrow A; drawarrow B;);
  A := A rotated 180;
  p2 = image(fill buildcycle(A,B) withcolor .8[blue,white]; drawarrow A; drawarrow B;);
  B := B rotatedabout(center B,180);
  p3 = image(fill buildcycle(A,B) withcolor .8[blue,white]; drawarrow A; drawarrow B;);
  A := A rotated 180;
  p4 = image(fill buildcycle(A,B) withcolor .8[blue,white]; drawarrow A; drawarrow B;);
  B := B rotatedabout(center B, 180);
  A := reverse A;
  p5 = image(fill buildcycle(A,B) withcolor .8[blue,white]; drawarrow A; drawarrow B;);
  A := A rotated 180;
  p6 = image(fill buildcycle(A,B) withcolor .8[blue,white]; drawarrow A; drawarrow B;);
  B := B rotatedabout(center B,180);
  p7 = image(fill buildcycle(A,B) withcolor .8[blue,white]; drawarrow A; drawarrow B;);
  A := A rotated 180;
  p8 = image(fill buildcycle(A,B) withcolor .8[blue,white]; drawarrow A; drawarrow B;);

  for i=1 upto 4: draw p[i]   scaled .75 shifted (80i,  0); label(decimal i,     (5mm+80i,0)); endfor
  for i=1 upto 4: draw p[i+4] scaled .75 shifted (80i,-68); label(decimal (4+i), (5mm+80i,-68)); endfor
endfig;

beginfig(4);
  path A, B; picture p[];
  A = fullcircle scaled 2.5cm; 
  B = fullcircle scaled 1.8cm shifted (1cm,0);
  p1 = image(fill overlap(A,B) withcolor .8[red,white]; drawarrow A; drawarrow B;);
  A := A rotated 180;
  p2 = image(fill overlap(A,B) withcolor .8[red,white]; drawarrow A; drawarrow B;);
  B := B rotatedabout(center B,180);
  p3 = image(fill overlap(A,B) withcolor .8[red,white]; drawarrow A; drawarrow B;);
  A := A rotated 180;
  p4 = image(fill overlap(A,B) withcolor .8[red,white]; drawarrow A; drawarrow B;);
  B := B rotatedabout(center B, 180);
  A := reverse A;
  p5 = image(fill overlap(A,B) withcolor .8[red,white]; drawarrow A; drawarrow B;);
  A := A rotated 180;
  p6 = image(fill overlap(A,B) withcolor .8[red,white]; drawarrow A; drawarrow B;);
  B := B rotatedabout(center B,180);
  p7 = image(fill overlap(A,B) withcolor .8[red,white]; drawarrow A; drawarrow B;);
  A := A rotated 180;
  p8 = image(fill overlap(A,B) withcolor .8[red,white]; drawarrow A; drawarrow B;);

  for i=1 upto 4: draw p[i]   scaled .75 shifted (80i,  0); label(decimal i,     (5mm+80i,0)); endfor
  for i=1 upto 4: draw p[i+4] scaled .75 shifted (80i,-68); label(decimal (4+i), (5mm+80i,-68)); endfor
endfig;


end.

