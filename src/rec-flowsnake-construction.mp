\documentclass{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
  path h[], snake;
  h0 = for i = 1 upto 6: 40 dir 60i -- endfor cycle; 
  h0 := h0 rotated - angle (9, sqrt(3));
  for i = 1 upto 6:
    h[i] = h0 shifted (point 0 of h0 - point 2 of h0) rotated -(120+60i);
    draw h[i] withcolor 3/4;
  endfor
  snake = point 0 of h1 -- point 1 of h2 -- point 2 of h3 
       -- point 1 of h4 -- point 2 of h5 -- point 3 of h6
       -- point 4 of h5 -- point 0 of h5;
  ahangle := 30;
  z0 = point 0 of snake; z1 = point 8 of snake; z23 = 2/3[z0, z1];
  drawoptions(withcolor 1/2);
    drawarrow z0 -- z23; draw z23 -- z1;
  drawoptions(withcolor \mpcolor{textred});
    draw snake;
    for t=1, 5, 6:    drawarrow subpath (t, t-2/3) of snake; endfor
    for t=1, 2, 3, 6: drawarrow subpath (t, t+2/3) of snake; endfor
  drawoptions();
  dotlabel.llft("$(0, 0)$", z0);
  dotlabel.lrt ("$(1, 0)$", z1);
endfig;
\end{mplibcode}
\end{document}

