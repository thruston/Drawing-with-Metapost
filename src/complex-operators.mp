\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
  numeric u; u = 1cm;
  z1 = 2 dir 15; z2 = 1.2 dir 60;
  z3 = z1+z2; z4 = z1 zscaled z2; z5 = (x1,-y1);
  drawoptions(withcolor 2/3 white);
  draw (1/2 left -- 3 right) scaled u ;
  draw (1/2 down -- 3 up   ) scaled u ;
  draw subpath (0,3) of fullcircle scaled 2u rotated -22.5;
  drawoptions();
  dotlabel.lrt (btex $\scriptstyle 1$ etex, (u,0));
  dotlabel.ulft(btex $\scriptstyle i$ etex, (0,u));
  interim ahangle := 30;
  forsuffixes @=1,2,3,4,5:
    x@ := x@ * u; y@ := y@ * u;
    drawarrow origin -- z@
      cutafter fullcircle scaled 5 shifted z@
      withcolor 2/3 if @ < 3: blue else: red fi;
  endfor
  fill fullcircle scaled dotlabeldiam;
  dotlabel.rt (btex $A$ etex, z1);
  dotlabel.urt(btex $B$ etex, z2);
  dotlabel.top(btex $A+B$ etex, z3);
  dotlabel.top(btex $A \times B$ etex, z4);
  dotlabel.rt (btex $\bar{A}$ etex, z5);
endfig;
\end{mplibcode}
\end{document}
