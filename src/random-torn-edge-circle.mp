\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\begin{mplibcode}
input random-torn-edge
beginfig(1);
  path c; c = fullcircle scaled 200;
  draw c withcolor .8 white;
  y=0; n = 600;
  path t; t = for i=0 upto n-1:
    point i/n*length(c) of c 
    + (0, walkr y) rotated angle direction i/n*length(c) of c
    -- 
  endfor cycle;
  draw t withcolor .67 red;
endfig;
\end{mplibcode}
\end{document}
