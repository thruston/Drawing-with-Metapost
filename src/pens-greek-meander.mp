\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
vardef meander expr p = 
  save a, u, v, d, dy; numeric a, u, v, d; pair dy; 
  d = 4 xpart urcorner makepath currentpen; 
  a = arclength p; v = round(a/8d); u = a if v > 1: / v fi;
  if not cycle p: point 0 of p -- fi for t = 0 step u until a-4eps:
    hide(dy := d*unitvector(direction arctime t+1/2u of p of p rotated 90))
    subpath(arctime t of p, arctime t+u-2d of p) of p shifted 3dy
    -- 
    subpath(arctime t+u-2d of p, arctime t+1/2 u of p) of p shifted -dy
    --
    subpath(arctime t+1/2u of p, arctime t+2d of p) of p shifted dy
    --
    subpath(arctime t+2d of p, arctime t+u of p) of p shifted -3dy
    --
  endfor if cycle p: cycle else: point infinity of p fi
enddef;

beginfig(1);
  path r; r = (left {right} .. right rotated 10) scaled 100;
  linejoin := mitered;
  path p[];
  p1 = (left -- right) scaled 50 rotated 40;
  p2 = (left {dir 45} .. right {dir 45}) scaled 50 rotated 40;
  p3 = fullcircle scaled 72 yscaled 4/5;
  p4 = unitsquare shifted -(1/2, 1/2) scaled 50;
  interim labeloffset := 13;
  interim ahangle := 30;
  for i=1, 2, 3, 4:
    drawarrow p[i] shifted (96i, 0) withcolor 3/4[if i=4: red else: blue fi, white];
    draw meander p[i] shifted (96i, 0);
  endfor
  label.ulft("\texttt{meander}", (96, 0));
endfig;
\end{mplibcode}
\end{document}
