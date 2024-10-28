\documentclass[border=5mm]{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
  input colorbrewer-rgb
  path s[], t[];
  s1 = unitsquare scaled 21 rotated 15; s2 = s1 rotated 150;
  t1 = subpath (4, 3) of s1 -- point 1 of s2 -- cycle;
  t2 = t1 reflectedabout(point 1 of t1, point 2 of t1);
  t3 = t1 rotated 150; t4 = t1 rotated 210;
  picture color_unit, grid_unit;
  color_unit = image(
    fill s1 withcolor Oranges 8 1;
    fill s2 withcolor Oranges 8 2;
    fill t1 withcolor Blues 8 1;
    fill t2 withcolor Blues 8 2;
    fill t3 withcolor Blues 8 3;
    fill t4 withcolor Blues 8 4;
  );
  grid_unit = image(
    draw s1; draw s2;
    draw t2; draw t3; draw t4;
  );
  pair u, v;
  u = point 1 of s1 - point 1 of s2;
  v = u rotated 90;
  numeric n; n = 3;
  forsuffixes $=color_unit, grid_unit:
    for i=-n upto n:
      for j=-n upto n:
        draw $ shifted (i * u + j * v);
      endfor
    endfor
  endfor

  label.bot("The arrangement of polygons in the units was carefully",  
    point 1/2 of bbox currentpicture shifted 21 down);
  label.bot("chosen to give the tiling neat edges.", 
    point 1/2 of bbox currentpicture);
  path b; b = bbox currentpicture shifted 34 down;
  draw color_unit shifted point 1/4 of b;
  draw grid_unit  shifted point 3/4 of b;
  path b; b = bbox currentpicture shifted 13 down;
  label("\texttt{color\_unit}", point 1/4 of b);
  label("\texttt{grid\_unit}", point 3/4 of b);
endfig;
\end{mplibcode}
\end{document}

