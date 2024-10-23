\documentclass[border=1mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef radical_axis(expr ca, cb) = 
  numeric t, d, ra, rb;
  ra = abs(center ca - point 0 of ca);
  rb = abs(center cb - point 0 of cb);
  d = abs(center cb - center ca);
  2t = 1 + (ra+rb) / d * (ra-rb) / d;
  (up -- down) scaled 89
    rotated angle (center cb - center ca) 
    shifted t[center ca, center cb]
enddef;
beginfig(1);
  z1 = origin; z2 = 233 dir 4; z3 = 209 dir -42;
  path c[], a[];
  c1 = fullcircle scaled 202 shifted z1;
  c2 = fullcircle scaled 106 shifted z2;
  c3 = fullcircle scaled  62 shifted z3;
  a1 = radical_axis(c1, c2);
  a2 = radical_axis(c2, c3);
  a3 = radical_axis(c3, c1);

  pair radix, t; path orthogonal_circle;
  radix = whatever[point 0 of a1, point 1 of a1] 
        = whatever[point 0 of a2, point 1 of a2];
  t = c1 intersectionpoint 
      halfcircle zscaled (radix-z1) shifted 1/2[radix, z1];
  orthogonal_circle = fullcircle 
    scaled 2 abs (t - radix) shifted radix;
 
  draw z1 -- z2 -- z3 -- cycle withpen pencircle scaled 1/4;
  draw a1; draw a2; draw a3;
  drawoptions(withcolor 3/4[blue, white]);
    draw c1; draw c2; draw c3;
    draw z1 -- t dashed evenly;
  drawoptions(withcolor 2/3 red);
    draw orthogonal_circle;
    draw radix -- t dashed evenly;
    draw radix withpen pencircle scaled dotlabeldiam;
  drawoptions(withcolor 1/4[blue, white]);
    draw z1 withpen pencircle scaled dotlabeldiam;
    draw z2 withpen pencircle scaled dotlabeldiam;
    draw z3 withpen pencircle scaled dotlabeldiam;

  label.urt(btex $C_1$ etex, point 1 of c1);
  label.urt(btex $C_2$ etex, point 1 of c2);
  label.rt (btex $C_3$ etex, point 0 of c3);
endfig;
\end{mplibcode}
\end{document}
