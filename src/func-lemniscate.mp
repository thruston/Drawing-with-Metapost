\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1); 
  numeric a, c; c = 100; a = sqrt(2) * c;
  vardef f(expr x) = a * cosd(x) / (1 + sind(x) ** 2) enddef;
  vardef g(expr x) = f(x) * sind(x) enddef;
  numeric mint, maxt, s; mint = 0; s = 30; maxt = 360;
  path p; p = for t = mint step s until maxt - s: 
    (f(t), g(t)) ...
  endfor cycle;
  draw p withcolor 3/4 blue;
  path xx; xx = (left -- right) scaled 150;
  path yy; yy = (down -- up) scaled 55;
  drawarrow xx; label.rt("$x$", point 1 of xx);
  drawarrow yy; label.top("$y$", point 1 of yy);
  dotlabel.bot("$F_1$", c * left);
  dotlabel.bot("$F_2$", c * right);
endfig;
\end{mplibcode}
\end{document}
