\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
  path t[], base; pair apex;
  base = (left--right) scaled 100;
  apex = whatever * dir +72 shifted point 0 of base 
       = whatever * dir -72 shifted point 1 of base;
  t0 = (base -- apex -- cycle);
  transform S; 
  r = arclength subpath (0, 1) of t0 / arclength subpath (2, 3) of t0;
  point 0 of t0 transformed S = (r*r)[point 0 of t0, point 2 of t0];
  point 1 of t0 transformed S = point 0 of t0;
  point 2 of t0 transformed S = point 1 of t0;
  n = 16;
  for i=1 upto n:
    t[i] = t[i-1] transformed S;
    draw subpath (2,3) of t[i] withpen pencircle scaled 1/4;
  endfor
  drawoptions(withpen pencircle scaled 1/8 withcolor blue);
    draw point 0 of t0 -- point 3/2 of t0;
    draw point 0 of t1 -- point 3/2 of t1;
  drawoptions();
  draw t0;
  drawarrow point 2 of t[n] for i=n-1 downto 0: 
    .. point 2 of t[i] endfor withcolor 2/3 red;
  z0 = whatever[point 0 of t0, point 3/2 of t0]
     = whatever[point 0 of t1, point 3/2 of t1];
  numeric a; a = angle (point 2 of t0 - z0);
  label.lft(TEX("$a$") rotated a, point 5/2 of t0);
  label.bot(TEX("$b$") rotated a, point 1/2 of t0);
  label.rt(TEX("$x$") rotated a, point 1/2 of t1);
  currentpicture := currentpicture rotated -a;
endfig;
\end{mplibcode}
\end{document}
