\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\begin{mplibcode}
beginfig(1);
numeric u; u = 24; 
path axis; axis = (4.5 left -- 6.5 right) scaled u;
drawarrow axis; 
for i = -4 upto 6: 
  draw (2 up -- 2 down) shifted (i * u, 0);
  label.top("\strut $" & decimal i & "$", (i * u, 0));
endfor

vardef jump(expr a, b, u, dy) = 
  pair p, q; p = (a*u, dy); q = (b * u, dy);
  numeric r; 
  r = if a < b: if dy < 0: - else: + fi 30
      else: 180 if dy < 0: + else: - fi 60
      fi;
  p {right rotated r} .. q
   cutbefore fullcircle scaled 12 shifted p
   cutafter  fullcircle scaled 12 shifted q
enddef;

drawarrow jump(5, 1, u, 12) withcolor red;
drawarrow jump(-2, 3, u, -2) withcolor blue;
endfig;
\end{mplibcode}
\end{document}
