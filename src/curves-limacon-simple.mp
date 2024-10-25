\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);

  numeric a; 2a = 144;

  path base; base = fullcircle rotated 180 scaled 2a shifted (2a, 0);
  numeric s; s = 1/4;
  pair A; A = 2[center base, point 0 of base];
  path limacon; limacon = for t = 0 step s until length base:
    A reflectedabout(precontrol t of base, postcontrol t of base) ..
  endfor cycle;

  path c[]; numeric n; n = -1;
  for t = 0 step s until length base:
    c[incr n] = fullcircle scaled 2 abs (point t of base - A) shifted point t of base;
    draw c[n] withpen pencircle scaled 1/4 withcolor 3/4;
  endfor

  draw base withcolor 2/3 blue; 
  draw center base withpen pencircle scaled 2 withcolor 2/3 blue;
  draw limacon withcolor 2/3 red;

  dotlabel.lft("$A$", A);
  dotlabel.urt("$Q$", point 5.4 of base);
  dotlabel.ulft("$P$", A reflectedabout(precontrol 5.4 of base, postcontrol 5.4 of base));
endfig;
\end{mplibcode}
\end{document}

