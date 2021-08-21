\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
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
   draw bb withpen pencircle yscaled .6 xscaled .1666 rotated d;
   point 3 of bb
enddef;
beginfig(1);

z1 = origin;
z2 = 180 right rotated 13;
draw z1--z2 withcolor .7 white;
dotlabel.llft("$z_1$",z1);
dotlabel.urt("$z_2$",z2);

begingroup; interim ahangle := 180; interim ahlength := 3;
drawdblarrow (z1--z2) shifted (12 up rotated angle (z2-z1)) withcolor 2/3 blue;
endgroup;

drawoptions(withcolor 2/3 red);
label.lrt("Here",do_brace(z1,z2,-12,3/4)); 
drawoptions();


endfig;
\end{mplibcode}
\end{document}
