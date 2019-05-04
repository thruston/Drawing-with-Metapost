vardef draw_brace(expr a, b, m) = 
   save d, e, f, arm; pair d, e, f; picture arm;
   d = unitvector(b-a);
   e = up scaled m rotated angle d shifted 1/2[a,b];
   f = unitvector(d rotated 12m);
   %pickup pencircle xscaled 2 yscaled 1/2 rotated angle f;
   arm = image( draw (rt a {f} ... 1/2[a,e] {d} ... lft e {f}) 
                     shifted unitvector(up scaled m rotated angle d) 
                     shifted 1/6 unitvector(d)
              );
   draw arm; draw arm reflectedabout(e,1/2[a,b]);
enddef;

vardef do_brace(expr a,b,m,r) =
  save d, e, n, bb;
  numeric d, n; pair e; path bb;
  d = angle (b-a); 
  e = up scaled m rotated d shifted r[a,b];
  n = 1/2 m;
  bb = (
           (origin {0,n} .. {right} (abs n,n)) 
           rotated d shifted a
       --
           ((-abs n,-n) {right} .. {0,n} origin {0,-n} .. {right}(abs n,-n)) 
           rotated d shifted e
       --
           ((-abs n,n){right}..{0,-n}origin) 
           rotated d shifted b
       ) shifted (up scaled n rotated d);
   draw bb; % withpen pencircle yscaled 1.218 xscaled .2 rotated d;
   point 3 of bb
enddef;

prologues:=3;outputtemplate:="%j%c.eps";
beginfig(1);

z1 = origin;
z2 = (120,100);

draw z1--z2 withcolor .7 white;
dotlabel.llft("1",z1);
dotlabel.urt("2",z2);


drawoptions(withcolor .96 red);

label.ulft("Here",do_brace(z1,z2,6,5/6)); 

drawoptions();
begingroup; interim ahangle := 180; interim ahlength := 3;
drawdblarrow (z1--z2) shifted (7 down rotated angle (z2-z1));
endgroup;

path a, se;
a = (z1--z2) shifted (20 down rotated angle (z2-z1));
drawdblarrow a;
draw (down--up) scaled 1/2 ahlength rotated angle (z2-z1) shifted point 0 of a;
draw (down--up) scaled 1/2 ahlength rotated angle (z2-z1) shifted point 1 of a;

se = (superellipse(5 right, 3 up, 5 left, 3 down, 0.8)) scaled 2 
     rotated angle (z2-z1)
     shifted point 1/2 of a;
unfill se; draw se; label("OK" infont defaultfont rotated angle (z2-z1), center se);

endfig;
end

