\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef do_brace(expr a, b, offset, r) =
  save d, e, m, n, brace, hook; pair e; path brace, hook[];
  d = angle(b-a);
  e = up scaled offset rotated d shifted r[a,b];
  n = 1/2 offset; m = abs(n); 
  hook1 =                         origin {0, n} .. (m, n) {1,0};
  hook2 = (-m,-n) {1,0} .. {0, n} origin {0,-n} .. (m,-n) {1,0};
  hook3 = (-m, n) {1,0} .. {0,-n} origin;
  brace = (hook1 rotated d shifted a --
           hook2 rotated d shifted e --
           hook3 rotated d shifted b) shifted (up scaled n rotated d);
  draw brace withpen pencircle yscaled .6 xscaled .1666 rotated d;
  point 3 of brace
enddef;

beginfig(1);
z1 = origin;
z2 = 180 right rotated 13;
draw z1--z2 withcolor .7 white;
dotlabel.llft("$z_1$",z1);
dotlabel.urt("$z_2$",z2);
drawoptions(withcolor 2/3 red);
label.lrt("Here", do_brace(z1, z2, -12, 3/4)); 
drawoptions();
begingroup; interim ahangle := 180; interim ahlength := 3;
drawdblarrow (z1--z2) shifted (12 up rotated angle (z2-z1)) withcolor 2/3 blue;
endgroup;


endfig;
\end{mplibcode}
\end{document}
