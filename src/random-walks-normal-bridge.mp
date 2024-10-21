\documentclass{standalone}
\usepackage{luamplib}
\begin{document}
\mplibtextextlabel{enable}
\mplibshowlog{enable}
\begin{mplibcode}
beginfig(1);
  randomseed := 3612.11746;
  numeric w, h, n; w = 377; h = 80; n = 500;
  draw (origin--right) scaled w;
  draw (origin--right) scaled w shifted (0,+h/2) withcolor 3/4;
  draw (origin--right) scaled w shifted (0,-h/2) withcolor 3/4;
  numeric y; y = 0;
  path walk; walk = (0, y) for x=w/n step w/n until w: 
    hide(y := y + 4 normaldeviate)
    -- (x, y)
  endfor;
  path bridge; bridge = point 0 of walk for i=1 upto n:
    -- point i of walk + (0, i/n * -y) endfor;
  draw walk withcolor 7/8;  % so you can see how it works
  undraw bridge withpen pencircle scaled 3/4;
  draw bridge withcolor 3/4 blue;
endfig;
\end{mplibcode}
\end{document}
