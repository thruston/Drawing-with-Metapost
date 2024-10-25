\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
secondarydef a through b = 
  begingroup; save d; d = abs(a-b); (1+12/d)[b,a] -- (1+12/d)[a,b] endgroup
enddef;
beginfig(1);
  path ellipse; 
  ellipse = fullcircle scaled 300 yscaled 5/8 rotated 13;

  numeric a, b;
  2a = abs (point 4 of ellipse - point 0 of ellipse);
  2b = abs (point 6 of ellipse - point 2 of ellipse);

  numeric e; e = 1 +-+ b/a;  % Pythagorean difference

  z0 = 1/2[point 0 of ellipse, point 4 of ellipse];
  z1 = e[z0, point 0 of ellipse];
  z2 = e[z0, point 4 of ellipse];

  drawoptions(withcolor 3/4[blue, white]);
  draw point 0 of ellipse through point 4 of ellipse;
  draw point 2 of ellipse through point 6 of ellipse;

  vardef arrowlabel(expr s, a, b, offset) = 
    save p, t; interim ahangle := 28;
    path p; p = (a--b) shifted (offset * unitvector(b-a) rotated 90);
    picture t; t = thelabel(s, point 1/2 of p);
    drawdblarrow p; unfill bbox t; draw t;
  enddef;

  label.lrt("$a$", 1/2[z0, point 4 of ellipse]);
  label.rt("$b$", 1/2[z0, point 6 of ellipse]);
  arrowlabel("$ae$", z0, z1, -6);
  drawoptions();

  numeric t; t = 1.732;
  drawoptions(withcolor 1/2);
  draw (left--right) scaled 34
    rotated angle direction t of ellipse
    shifted point t of ellipse;
  draw (1/2 down--up) scaled 34 
    rotated angle direction t of ellipse
    shifted point t of ellipse;
  drawoptions();

  draw z1 -- point t of ellipse -- z2; 
  draw ellipse withcolor 3/4 red;

  labeloffset := 6;
  dotlabel.urt("$T$", point t of ellipse);
  dotlabel.top("$F_1$", z1);
  dotlabel.ulft("$F_2$", z2);

  input show_name
endfig;
\end{mplibcode}
\end{document}

