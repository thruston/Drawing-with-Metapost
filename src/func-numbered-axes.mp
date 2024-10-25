\documentclass{standalone}
\usepackage{luamplib}
\usepackage{dwmpcode}
\begin{document}
\begin{mplibcode}
beginfig(1);
numeric u, v; u = 40; v = 29; path xx, yy;  
xx = (3/2 left -- 5 right) scaled u;
yy = (3/2 down -- 4 up) scaled v;
for x=-1, 1, 2, 3, 4:
  draw yy shifted (x * u, 0) withcolor 7/8;  % grid
  draw (down--up) shifted (x * u, 0);        % ticks
  label(TEX("$" & decimal x & "$"), (x * u, -8));
endfor
for y=-1, 1, 2, 3:
  draw xx shifted (0, y * v) withcolor 7/8;  % grid
  draw (left--right) shifted (0, y * v);     % ticks
  label(TEX("$" & decimal y & "$"), (-10, y * v));
endfor
drawarrow xx; label.rt(TEX("$x$"), point 1 of xx);
drawarrow yy; label.top(TEX("$y$"), point 1 of yy);
endfig;
\end{mplibcode}
\end{document}

